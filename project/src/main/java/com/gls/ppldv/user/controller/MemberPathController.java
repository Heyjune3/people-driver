package com.gls.ppldv.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gls.ppldv.user.dto.EditDTO;
import com.gls.ppldv.user.entity.Member;
import com.gls.ppldv.user.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class MemberPathController {

	private final MemberService ms;

	// 로그아웃 처리
	@GetMapping("/logout")
	public String logout(HttpServletResponse response, @CookieValue(name = "id", required = false) Cookie cookie,
			HttpSession session, RedirectAttributes rttrs) {
		session.removeAttribute("loginMember");

		if (cookie != null) {
			cookie.setPath("/");
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}

		return "redirect:/";
	}

	@GetMapping("/editProfile")
	public String editProfile() {
		return "/member/editProfile";
	}

	// 회원정보 수정
	@PostMapping("/editProfile")
	public String editProfile(EditDTO member, MultipartFile file, RedirectAttributes rttrs, HttpSession session) {

		System.out.println(member);
		System.out.println(file);

		String message = null;
		// 만약 회원 이미지가 변경되었다면, 삭제 후 다시 업로드
		if (file != null && !file.isEmpty()) {
			try {
				message = ms.editProfile(member, file);

				// 이걸 꼭 이렇게 저장해야 하나..?
				Member m = ms.findMember(member.getEmail());
				session.setAttribute("loginMember", m);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				message = ms.editProfile(member);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		rttrs.addFlashAttribute("message", message);
		return "redirect:/user/editProfile";
	}

	// 회원정보 삭제
	@PostMapping("/removeUser")
	public String removeUser(String email, RedirectAttributes rttrs) {
		String message = null;
		try {
			message = ms.removeUser(email);
		} catch (Exception e) {
			message = "삭제 실패 (다시 삭제 요청을 해주세요.)";
			e.printStackTrace();
		}

		return "redirect:/user/logout";
	}

}
