# 기반이 되는 이미지를 의미 -> tomcat:9 버전
FROM tomcat:9

# 컨테이너 내에서 사용할 수 있는 변수를 지정
# 프로젝트를 빌드할 시, ppldv-1.0.0-BUILD-SNAPSHOT.jar의 형태로 jar file이 생성되고, 그 파일의 위치를 변수로 저장하는 것
ARG WAR_FILE=./project.war

# JAR 파일 메인 디렉토리(Docker)에 복사
COPY ${WAR_FILE} /usr/local/tomcat/webapps/

# Docker파일이 Docker엔진을 통해 컨테이너로 올라갈 때, Docker 컨테이너의 시스템 진입점이 어디인지를 선언
# 컨테이너를 실행할 때 Tomcat 서버 시작
CMD [ "catalina.sh","run" ]