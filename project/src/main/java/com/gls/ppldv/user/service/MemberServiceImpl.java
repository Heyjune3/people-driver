package com.gls.ppldv.user.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.gls.ppldv.configuration.userException.LoginFailedException;
import com.gls.ppldv.configuration.userException.MessageFailedException;
import com.gls.ppldv.user.entity.Member;
import com.gls.ppldv.user.entity.PassCode;
import com.gls.ppldv.user.mapper.MemberMapper;
import com.gls.ppldv.user.repository.CodeRepository;
import com.gls.ppldv.user.repository.MemberRepository;
import com.gls.ppldv.user.util.CookieUtils;
import com.gls.ppldv.user.util.GmailAuthentication;

import lombok.RequiredArgsConstructor;

@Service
@PropertySource("classpath:prop/db-aws.properties") // 프로퍼티 가져오기
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberRepository mr;
	private final CodeRepository cr;
	private final MemberMapper mm;
	
	private final AmazonS3 S3Client;
	
	// 만들어놓은 util 패키지의 GmailAuthentication
	@Autowired
	GmailAuthentication ga;
	
	@Value("${aws.bucket}")
	private String bucketname;
	
	
	@Override
	@Transactional // 2개 이상의 db 처리 관리
	public String register(Member member, MultipartFile file) throws Exception {
		String message = "회원가입실패";
		Member m = mm.idCheck(member.getEmail());
		// 아이디 중복 체크
		if (m != null) {
			throw new Exception("아이디 중복입니다. 다시 선택해주세요."); 
		} else {
			// 이미지 업로드
			String imgUrl = uploadFile(file);
			if (imgUrl != null) { // 이미지 업로드 성공 (S3)
				// 이미지 URL 설정
				member.setImgUrl(imgUrl);
				// 회원 정보 저장
				Member mem = mr.save(member);
				if (mem != null) {
					message = "회원가입성공";
				} else {
					// S3에 올라간 데이터 삭제 요청 +
					message = "회원가입실패 (DB 요청 실패)";
				}
			}
		}
		return message;
	}
		
	
	@Override
	public String register(Member member) throws Exception {
		String message = "회원가입실패";
		Member m = mm.idCheck(member.getEmail());
		
		if (m != null) {
			throw new IllegalArgumentException("아이디 중복입니다. 다시 선택해주세요.");
		} else {
			Member mem = mr.save(member);
			if (mem != null) {
				message = "회원가입 성공";
				System.out.println(message);
			}
		}
		return message;
	}
	
	
	
	@Override
	public Member login(Member member) throws Exception {
		Member m = mr.findByEmailAndPassword(member.getEmail(),member.getPassword());
		if (m != null) {
			// 로그인 성공
			return m;
		} else {
			// 로그인 실패
			throw new LoginFailedException("이메일 또는 비밀번호가 일치하지 않습니다.");
		}
	}
	
	@Override
	public String logOut(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("loginMember");
		
		// 혹시 쿠키 등록되어 있다면, 삭제
		Cookie cookie = new Cookie("id", "");
		cookie.setPath("/");
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		
		return "로그아웃 완료";
	}
	
	
	
	
	
	
	
	
	

	@Override
	@Transactional
	public String findPassSubmit(Member member, HttpServletRequest request) throws Exception {
		
		
		
		Member m = mr.findByEmailAndName(member.getEmail(), member.getName());
		
		// TODO 방법 수정 - 이메일 전송 후, 코드 확인만 하고 코드 입력 페이지로 이동 
		/*
		// 자신 컴퓨터 사설 IP 주소 가져오는 것
		InetAddress local = null;
		try {
			local = InetAddress.getLocalHost();
		} catch (UnknownHostException e) {
			// 여기서 예외가 발생하는 이유가 뭘까?
			// 인터넷 연결이 안될 수 도 있으니까
			e.printStackTrace();
		}
		String ip = local.getHostAddress();
		*/
		
		if (m == null) {
			// 일치하는 회원이 존재하지 않는다면,
			throw new NullPointerException("일치하는 회원 정보가 없습니다.");
		}
		
		// 일치하는 회원 존재
		// 5자리의 숫자 코드 생성
		StringBuilder sb = new StringBuilder();
		for (int i=0; i<5; i++) {
			int random = (int)(Math.random()*10);
			sb.append(random);
		}
		String code = sb.toString();
		
		// 메일로 발송될 코드 DB에 저장
		PassCode pc = new PassCode();
		pc.setEmail(m.getEmail());
		pc.setCode(code);
		cr.save(pc);
		
		// 메일 발송
		Session session = Session.getDefaultInstance(ga.getProp(), ga);
		MimeMessage msg = new MimeMessage(session);
		InternetAddress fromAddress = new InternetAddress(
			"trailblazer6351@gmail.com", "MASTER"
		);
		InternetAddress toAddress = new InternetAddress(m.getEmail());
		
		msg.setSentDate(new Date()); // 보내는 날짜
		msg.setHeader("Content-Type", "text/html;charset=utf-8"); // 마임 타입
		msg.setRecipient(Message.RecipientType.TO, toAddress); // 송신자
		msg.setFrom(fromAddress); // 발신자
		msg.setSubject("비밀번호 찾기 요청", "utf-8"); // 제목
		StringBuilder mail = new StringBuilder();
		mail.append("<!DOCType html>");
		mail.append("<html>");
		mail.append("<head>");
		mail.append("<meta charset='utf-8'>");
		mail.append("</head>");
		mail.append("<body>");
		mail.append("<h1 style='text-align:center;'> @@@ PEOPLE.DRIVER 사이트 비밀번호 찾기 @@@ </h1>");
		mail.append("<div style='text-align:center;'>");
		mail.append("<p style='font-size:30px;'>인증 코드 번호 : <b>"+pc.getCode()+"</b> </p>");
		mail.append("</div>");
		mail.append("</body>");
		mail.append("</html>");
		
		String content = mail.toString();
		msg.setContent(content, "text/html;charset=utf-8");
		// blocking (메일이 발송될 때 까지)
		Transport.send(msg);
		return "메일 발송 성공 메일함을 확인해주세요.";
	}

	@Override
	public String changePassCode(PassCode passCode) {
		PassCode pc = cr.findByEmailAndCode(passCode.getEmail(), passCode.getCode());
		if (pc != null) {
			// 일치하면
			return "코드 일치";
		} else {
			// 일치하지 않으면
			return "코드 불일치";
		}
	}


	@Override
	public String changePass(Member member) throws Exception {
		mm.changePass(member);
		
		return "비밀번호 변경 성공";
	}
	
	
	
	
	
	
	/**
	 * 자동 로그인
	 * @param request - session 정보와 Cookie 정보를 받아올 request
	 */
	public void loginCheck(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginMember") == null && cookies != null) {
			// 로그인되지 않은 상태에서 쿠키 정보가 있을 시
			for (Cookie c : cookies) {
				if (c.getName().equals("id")) {
					String decryptedEmail = CookieUtils.decrypt(c.getValue());
					Member loginMember = mr.findByEmail(decryptedEmail);
					if (loginMember != null) {
						session.setAttribute("loginMember", loginMember);
					}
					break;
				}
			}
		}
	}
	
	
	/**
	 * S3에 파일을 업로드 하고 DB에 imgUrl 저장
	 * @param file - 받은 파일
	 * @return - 저장한 파일 url + 파일 이름
	 */
	public String uploadFile(MultipartFile file) throws IOException {
		
		String originalFileName = file.getOriginalFilename(); // 원본 파일 이름
		String ext = originalFileName.substring(originalFileName.lastIndexOf(".")); // 확장자
		String savedFileName = ""; // 저장파일이름
		String uuid = UUID.randomUUID().toString(); // UUID 32 숫자 + 4 개의 -, 36개 랜덤
		savedFileName = uuid.replace("-", "")+"_"+originalFileName;
		
		// com.amazonaws.services.model
		ObjectMetadata metadata = new ObjectMetadata(); // 메타데이터
		metadata.setContentType("image/"+ext); // 이미지만 처리
		metadata.setContentLength(file.getSize()); // 이미지 크기를 명시해줘야 함

		// S3clinet (버킷이름, 저장할 파일 이름, 인풋스트림, 메타데이터)
		S3Client.putObject(new PutObjectRequest(bucketname, savedFileName, file.getInputStream(), metadata));
		
		return S3Client.getUrl(bucketname, savedFileName).toString();
	}






	
}
