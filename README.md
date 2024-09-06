# 📚 3월 도서관 (2nd Team Project) - Spring 전환


국비지원 훈련과정 두번째 팀프로젝트를 스프링으로 전환한 소스코드 입니다.

두번째 프로젝트 바로가기(https://github.com/yunuyununu/SyLibraryProject)

## 🔖 목차
[1. 프로젝트 개요](#-1.-프로젝트-개요)
   - [개발 기간](#-개발-기간)
   - [사용 기술 및 개발 환경](#-사용-기술-및-개발-환경)
   - [팀원 소개](#-팀원-소개)   

[2. 프로그램 구조](#-2.-프로그램-구조)
   - [ER Diagram](#-ER-Diagram)
   - [View](#-View)
   - [Usecase Diagram](#-Usecase-Diagram)
   - [Flow Chart](#-Flow-Chart)

[3. 페이지 기능 안내](#-3.-페이지-기능-안내)
   - [관리자 화면 <통합관리시스템>](#-관리자-화면-<통합관리시스템>)
   - [사용자 화면 <도서관 홈페이지>](#-사용자-화면-<도서관-홈페이지>)

[4. 개선사항 및 후기](#-4.-후기-및-개선점)
   - [후기](#-후기)
   - [피드백 반영 및 개선사항](#-피드백-반영-및-개선사항)

[5. 참고 URL](#-5.-참고-URL)




## 1. 프로젝트 개요
### 🗓 개발 기간
* 2024.04.01 ~ 2024.04.19
* 1주차 : 기존 프로젝트를 스프링 프로젝트로 변환, 기능 테스트 후 추가개발 기능, 에러 등을 바탕으로 회의 진행
* 2주차 : 에러 수정 및 기능 개선, 추가 기능 개발 작업 진행
* 3주차 : 2차 기능 테스트 및 개발작업 마무리, 발표자료 업데이트

<목표>
- 2차 프로젝트를 Spring 프로젝트로 변환
- 2차 프로젝트의 피드백을 반영하여 추가기능 개발 및 기능 개선
- git, github를 도입하여 기본 개념 및 명령어 숙지
- Front-end / Back-end의 다양한 기술스택을 활용한 웹 애플리케이션 구현 및 훈련기간 동안 학습한 내용 적용


### 🖥 사용 기술 및 개발 환경
* OS : <img src="https://img.shields.io/badge/windows 11-0078D4?style=for-the-badge&logo=windows11&logoColor=white"> 
* Front-end : <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=black">
* Back-end : <img src="https://img.shields.io/badge/Java-34567C?style=for-the-badge&logo=Java&logoColor=white"> <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/OpenJDK-000000?style=for-the-badge&logo=OpenJDK&logoColor=white"> <img src="https://img.shields.io/badge/SpringBoot-6DB33F?style=for-the-badge&logo=SpringBoot&logoColor=white">
* Tools : <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> <img src="https://img.shields.io/badge/Spring Security-6DB33F?style=for-the-badge&logo=SpringSecurity&logoColor=white"> <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white">
* Library : <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=for-the-badge&logo=ApacheTomcat&logoColor=black"> <img src="https://img.shields.io/badge/Chart.js-FF6384?style=for-the-badge&logo=Chart.js&logoColor=white"> <img src="https://img.shields.io/badge/JSON-000000?style=for-the-badge&logo=JSON&logoColor=white">



### 👩‍💻 팀원 소개
* [도경민](https://github.com/mindyhere)
* [박미현](https://github.com/Miihyunee)
* [양미영](https://github.com/didaldud)
* [조연우](https://github.com/yunuyununu) 🙋‍♀️
* [홍재희](https://github.com/jh91019)

※ 기존 프로젝트 내용 제외하고 스프링 전환 작업 내용만 작성
![member](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/772f6286-ad43-412f-83e7-cd8706d1f3a1)



## 2. 프로그램 구조
### 🔹 ER Diagram
![erDiagram](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/67127cc6-8b68-4e02-ad19-9ebb41ecbaf0)



### 🔹 View
![view](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/38f37aef-6ff5-4446-b3fd-f9a097a9e798)



### 🔹 Usecase Diagram
![usecase](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/f19f63de-0fc1-4b25-9181-8329c2c2ce5a)




### 🔹 Flow Chart
 - 관리자 
![flowChart-admin](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/4e96b359-6f0c-43dd-9a5c-e158e59739d2)


 - 사용자(회원/비회원)
![flowChart-User](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/8f344b7b-e329-4204-aa41-d7ef2ba674a1)



## 3. 페이지 기능 안내
※ 기존 프로젝트 내용 제외하고 스프링 전환 작업 내용만 작성
#### 관리자 화면 <통합관리시스템>
   - 메인 화면
![메인화면](https://github.com/jh91019/syLibrary_spring/assets/156145497/310360db-2f96-4599-89eb-02dbb98113ae)


- 메모상세보기 또는 수정 클릭 시 모달창 분리

   - 도서 등록


![도서등록](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/305faab6-28c9-4146-86e0-15150c05c288)


   - 도서목록/수정


![도서목록수정](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/a66614b0-cd2b-4add-9c14-32ebea121ac4)


   - 도서 분류 등록


![신규)분류등록](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/7cd53228-8c98-44a9-9914-cf9269135d41)


   - 회원정보


![회원정보](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/ca4452db-2f60-46d3-9d6b-1e663b186552)

- 회원 등급별 권수 분류
- 회원등급, 연체유무 추가


   - 희망 도서
![희망 도서 관리](https://github.com/jh91019/syLibrary_spring/assets/156145497/d4669a38-635d-4a52-a923-f9b287b5fbb8)


- 분류별 검색 가능
- 번호 클릭 시 상세 페이지로 이동


![희망 도서 상세](https://github.com/jh91019/syLibrary_spring/assets/156145497/b07ec660-4c07-4e94-8ab1-6e8803cac519)


- 신청자와 신청도서 정보 확인가능
- 옵션으로 상태변경
- 이용가능으로 변경 시 상태변경버튼 비활성화 / 신청도서는 구비도서로 등록됨
- 접수취소 시 취소사유 입력폼 활성화


#### 사용자 화면 <도서관 홈페이지>
   - 도서검색 자동완성 기능


![자동완성](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/d19cdaeb-63b9-47de-b2e5-4f2f4f4df73c)


   - 비밀번호 찾기


![비밀번호찾기](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/79924394-6da4-45dd-ad5c-6fdfc5298a54)


   - 회원정보 수정


![회원정보수정](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/536b9c31-70f8-40d3-b752-fd837679369a)


   - 연장불가 기능

     : 연체 중일 시 연장기능 이용할 수 없음


![연체중연장불가](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/3e365e49-cf6a-48b3-b3f7-d9ea6ba5b751)


   - 희망도서 신청


![희망도서](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/17aba026-1ef9-4ffc-aad0-b325dd0d5b58)


   - 나의 서재 > 희망도서 신청 내역


![희망도서신청내역](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/69ecc951-78e2-4386-b002-da52754cade2)


   - 예약 신청


![예약신청](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/64a40a6b-0e23-43c1-8867-d8e09ddef278)


![예약신청내역](https://github.com/Miihyunee/LibraryinMarch_spring.ver/assets/151993240/8683eaa3-cdbb-4372-b400-7d50428271ed)



## 4. 후기 및 개선점
### 📝 후기
- 동일 프로젝트를 스프링으로 재구성 하는 것 만으로도 도전적인 과제였습니다. 덕분에 많은 공부가 
  되었고 한층 성장할 수 있는 시간이었습니다.
- 추가 기능 개발을 포함해 미처 확인하지 못했던 에러나, 아쉬웠던 점 등을 보완하여 완성도를
  높은 프로젝트로 발전시킬 수 있었습니다.
- Git을 활용함으로써 SVN과는 다른 방식으로 협업을 경험해 볼 수 있었습니다.



### 🛠 피드백 반영 및 개선사항
- 회원 등급 개념을 추가 ▶ 서비스 이용시 등급에 따른 각기다른 이용권한 부여
- 비밀번호가 DB에 그대로 저장되었던 문제 ▶ 암호화 방식 적용
- 비밀번호 찾기에서 팝업으로 비밀번호를 알려주는 것이 아닌, 회원가입 시 작성한 메일로 임시 
  비밀번호를 전송하는 방식으로 개선
- 연체 상태에서도 도서 연장이 가능한 오류 발견 ▶ 연체 여부 확인하는 단계를 추가하여 기능 개선
- 개발기간부족으로 기존에 구현하지 못했던 검색어 자동완성 기능 추가
- 희망도서와 관련된 추가 기능 구현 ▶ 오픈API의 적용 및 이용자는 희망도서 신청 및 취소 서비스를 
  이용할 수 있고, 관리자는 이용자가 신청한 희망도서의 상태를 변경 가능하도록 추가 기능 개발완료



## 5. 참고 URL
| No. | Site | URL |
|---|:---:|---:|
| 1 | 노원구 구립도서관 | https://www.nowonlib.kr |
| 2 | 인창도서관 | https://www.gurilib.go.kr/inlib/index.do |
| 3 | 국립중앙도서관 | https://www.nl.go.kr |
| 4 | 알라딘 | https://www.aladin.co.kr/home/welcome.aspx |
| 5 | 교보문고 | https://www.kyobobook.co.kr |
