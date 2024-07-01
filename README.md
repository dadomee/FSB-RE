
# FSB(Flying Super Board)

<br>
FSB(보드게임 복합 커뮤니티 사이트)는 국비학원에서 진행한 파이널 팀프로젝트입니다.

----

![메인페이지](https://github.com/dadomee/FSB/assets/137809118/1d847855-81c2-4a3b-baac-9c59cce5654a)

----

## 개요

+ 총 개발 기간 1개월 2주
    + 설계 및 분석 : 2023/05/19 - 2023/05/25 (ProtoType , UML 작성 , DB 설계)
    + 기능 구현 : 2023/05/25 - 2023/07/27
+ 개발 인원 : 6명
+ 스프링 프레임워크를 이용하여 제작한 보드게임 정보/쇼핑몰/SNS 복합 커뮤니티 사이트입니다.
    크게 관리자, 회원 마이페이지 , 보드게임 정보, 게시판 커뮤니티, 쇼핑몰, SNS로 구성되어 있습니다.

## 리팩토링
+ 24.06.23~

## 개발 환경, 툴

+ OS : window10
+ Kit : JDK
+ Tool
  + eclipse
  + spring
  + oracle
  + S/W : oracle sqldeveloper

## 활용 라이브러리, API

+ Library
  + MyBatis
  + jQuery
  + Json
  + Ajax
  + BootStrap/CSS
 
+ Open Source
   + Naver developers (login)
   + kakao developers (address,map)
<br>

## ERD (담당 기능 부분)

![image](https://github.com/dadomee/FSB-RE/assets/137809118/fdb1b37c-d7a6-4da0-aa30-0f62c89146a7)

<br>

## 담당 기능

    커뮤니티 
        - 게시판 CRUD, 댓글 CRUD, 글목록 검색, 정렬 , 다중 이미지 첨부, 다중 파일 업, 다운로드 , 게시글 댓글 신고 기능
    비즈니스 매장지도
         - 매장 지도 검색, 카카오 지도 API, 카카오 주소 API 활용
    비즈니스 프로필
        - 프로필에 매장정보, 위치 확인, 매장 전용 쿠폰 발급, 매장 리뷰
        
1. 커뮤니티
   + 기능 : 게시판 CRUD, 댓글 CRUD, 글목록 검색 작업, 다중 이미지, 다중 파일 업,다운로드
   + 설명 : 자유, 익명, 중고게시판으로 나누어져 있으며,
      보드게임에 대해 자유롭게 소통할 수 있는 회원전용 게시판 입니다.
      Ajax를 이용한 비동기식 댓글 수정,삭제, 답글 입력을 구현했습니다.

![image](https://github.com/dadomee/FSB/assets/137809118/f9ec9517-a3a8-4d6a-a9a6-26e53005a793)
<br>
<div align="center"><h6>[중고게시판 목록]</h6></div>
<br>

++24.06 게시판 리스트 UI 변경
![image](https://github.com/dadomee/FSB-RE/assets/137809118/64e22607-5f60-48d6-b6ea-847efcf5f94c) <br>
![image](https://github.com/dadomee/FSB-RE/assets/137809118/eb21bc69-d90d-4af6-aef4-8f7fe95ed5e5) <br>
![image](https://github.com/dadomee/FSB-RE/assets/137809118/064a8918-37f9-4239-99b6-084a3a198622) <br>


![image](https://github.com/dadomee/FSB/assets/137809118/8e5deeaf-894f-4d81-934d-7ed114df67d9)
<br>
<div align="center"><h6>[게시글 상세보기]</h6></div>
<br>

2.비즈니스 보드게임 매장지도
  + 기능 : 비즈니스 보드게임 매장 검색, 카카오 지도 API 활용
  + 설명 : 사업자 SNS를 연결하여 사이트에 등록된 매장 위치 정보를 알수 있습니다.
          카카오 지도 API를 활용하여 지도 기능을 구현하였습니다.

![image](https://github.com/dadomee/FSB/assets/137809118/dd3d2618-1b5f-4fe8-9788-acc169f66fc7)

++24.06 지도 UI 변경
![image](https://github.com/dadomee/FSB-RE/assets/137809118/a58caa0c-76a9-48b7-8717-70a58bd4678f)

3.비즈니스 프로필
  + 기능 : 비즈니스 프로필에 매장정보, 위치 확인과 리뷰 CRUD, 매장 전용 쿠폰 발급, 발행
  + 설명 : 사업자 회원만 가지고 있는 비즈니스 프로필에서 매장 전용 쿠폰 발급, 발행과
           매장 리뷰 CRUD, 별점 등을 구현하였습니다.

![image](https://github.com/dadomee/FSB/assets/137809118/7b3de1cc-d425-4282-8306-6b9adb33a1d3)
<br>
<div align="center"><h6>[사업자 프로필]</h6></div>
<br>

![image](https://github.com/dadomee/FSB/assets/137809118/b8a2009c-fdc6-4955-8371-358fddd748cd)
<br>
<div align="center"><h6>[사업자 매장 리뷰]</h6></div>
<br>


## 회고/ 개선점
+ 초기 DB 구축의 완성도가 높지 않아 프로젝트를 하는 동안 지속적인 수정
+ 쿼리문 가독성 개선
+ Controller와 Service의 역할에 대한 고찰 필요
+ 비즈니스 프로필의 수익성 고려
+ 프론트 디자인을 좀 더 일관성/ 가독성 있게
+ 쇼핑몰 클릭시 로딩시간 단축 필요
+ 메소드, 함수명 정리 필요
