<jsp:include page= "../user/user_top.jsp"></jsp:include>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!-- list.jsp -->
<html>  
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- Vendor JS Files -->
  <script src="resources/NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/quill/quill.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/NiceAdmin/assets/js/main.js"></script>
  <!-- Google Fonts -->
  <link href="https://fonts.gstatic.com" rel="preconnect">
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="resources/NiceAdmin/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="resources/NiceAdmin/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="resources/NiceAdmin/assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="resources/NiceAdmin/assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="resources/NiceAdmin/assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="resources/NiceAdmin/assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="resources/NiceAdmin/assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="resources/NiceAdmin/assets/css/style.css" rel="stylesheet">
<head>
<script type="text/javascript">
 	
 	function checkLogin(){
	alert("회원 전용 입니다 로그인 해주세요")
	
 }
 	function memReport(mem_num){
		window.open("mem_report.do?mem_num="+mem_num,"", "width=550, height=470, left=680, top=270")
	}
</script>
	<title>커뮤니티</title>
</head>	
<style>
.box {
    width: 50px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
}
.box1 {
    width: 30px;
    height: 30px; 
    border-radius: 70%;
    overflow: hidden;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

</style>
<body>	
	<div class="container-fluid">
    <div class="pagetitle">
    <br>
      <h1>자유게시판</h1>
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-10">
          <div class="card h-100">
          <div></div>
            <div class="card-body">
              <div class="container">
		<div class="row">
  	  <div class="col-4">
  	  </div>
  	  <div class="col-6">
		<div class="input-group mb-3">
		 <form class="d-flex p-5" role="search" action="board_free_find.do" method="post">
 			<select class="form-select" aria-label="Default select example"name="select">
  			<option value="title" selected>제목</option>
  			<option value="writer" >작성자</option>
 			 <option value="content">내용</option>
			</select>
  			<input type="text" class="form-control "type="search" name="searchString" placeholder="검색어 입력" aria-label="searchString" aria-describedby="button-addon2">
  			<button class="btn btn-outline-secondary" type="submit" name="search" id="button-addon2">Search</button>
		</form>
	</div>
	</div>
	<!-- 로그인 했을때만 글쓰기 버튼 노출 -->
		<c:if test="${not empty sessionScope.mbId}">
	<div class="col-2 align-self-center"><a href="write_board.do?mode=${params.mode}"><button type="button" class="btn btn-outline-primary">글쓰기</button></a>
		</div>
		</c:if>
	</div>
	</div>
	<div class="container text-center">
	<table class="table table-hover p-3">
		<thead class="table-primary">
		<tr>
			<th>#</th>
			<th width="40%">제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회</th>
			<th>IP</th>
		</tr>
		</thead>
		<!--공지사항테이블 -->
		<tr>
		<c:if test="${not empty nlistBoard}">
		<c:forEach var="ndto" items="${nlistBoard}">
			<tr>
			<td><strong>공지</strong></td>
			<td width="40%"><a href="board_noti_content.do?n_num=${ndto.n_num}&mode=" class="link-danger text-decoration-none link-opacity-50-hover"><strong>📢${ndto.n_title}</strong></a></td>
			<td>관리자</td>
			<td>${ndto.n_regdate}</td>
			<td>-</td>
			<td>-</td>
			</tr>
		</c:forEach>
		</c:if>
		</tr>
<!-- 회원 게시글 리스트  -->
	<c:if test="${empty listBoard}">
		<tr>
			<td colspan="6">등록된 게시글이 없습니다. </td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${listBoard}">
<!-- 삭제된 게시글이면 -->
	<c:if test="${dto.board_content eq '-' and dto.board_re_step>0}">
		<tr>
			<td colspan="1">${dto.board_num}</td>
			<td colspan="5" align="left"><c:if test="${dto.board_re_step>0}">
						<img src="resources/img/re.png" height="10">
						</c:if><font color = "gray">삭제된 게시글 입니다.</font></td>
		</tr>
	</c:if>
	<c:if test="${dto.board_content ne '-'}">
	<c:set var="rowNum" value="${rowNum}"/>
	<!-- 신고 5회 이상 먹으면 게시글 규제 -->
	<c:if test="${dto.board_report > 4}">
		<tr>
			<td>${dto.board_num}</td>
			<td colspan="6" align="left"> <font color = "gray">관리자에 의해 규제된 글입니다.</font></td>
		</tr>
	</c:if>
		<c:if test="${dto.board_report < 5}">
		<tr>
			<td>${dto.board_num}</td>
			<td align="left">
				<c:if test="${dto.board_re_level >0}">
						<img src="resources/img/level.gif" width="${dto.board_re_level *10}"><img src="resources/img/re.png" width="10">
				</c:if>
				<!-- 상세보기 넘어갈 때  회원만 보게 하기 -->
				<c:if test="${empty sessionScope.mbId}">
				<a href="javascript:checkLogin()" class="link-primary text-decoration-none link-opacity-50-hover">${dto.board_title}</a> 
				</c:if>
				
				<c:if test="${not empty sessionScope.mbId}">
				<a href="content_board.do?board_num=${dto.board_num}&pageNum=1&mode=" class="link-primary text-decoration-none link-opacity-50-hover">${dto.board_title}</a> 
				</c:if>
				
				<c:if test="${dto.board_replycount ne 0}">
				 [${dto.board_replycount}]💬
				 </c:if>	
				<c:if test="${not empty dto.board_img1||not empty dto.board_img2||not empty dto.board_img3||not empty dto.board_img4}"><img src="resources/img/imgicon.jpg" width=20 height=20 ><img></c:if>
				<c:if test="${dto.bf_num ne null}">
				💾
				</c:if>
			</td>
			<td>
		<!-- 프사 -->	
			<!-- 댓글 프사 -->
						<div class="btn-group dropend">
						<c:if test="${dto.mem_img eq null }">
						<div class="box1" style="background: #BDBDBD;">
						<img class="profile" src="resources/img/default_profile.png"></div></c:if>
						<c:if test="${dto.mem_img ne null }">
						<div class="box1" style="background: #BDBDBD;">
						<img class="profile" src="resources/img/${dto.mem_img}"></div></c:if>&nbsp;
  						<button type="button" class="btn btn-light dropdown-toggle btn-sm" data-bs-toggle="dropdown" aria-expanded="false">
  						${dto.mem_nickname}
  					</button>
  					<c:if test="${login_mem.mem_num ne dto.mem_num }">
  				<div class="btn-group dropend">
 					 <ul class="dropdown-menu">
 					 <c:if test="${login_mem eq null }">
 					  <li><a class="dropdown-item" href="javascript:checkLogin()">회원 신고</a></li>
 					 </c:if>
 					  <c:if test="${login_mem ne null }">
   						 <li><a class="dropdown-item" href="javascript:memReport('${dto.mem_num }')">회원 신고</a></li>
  						</c:if>
  					</ul>
  					</div>
  					</c:if>
				</div></td>
			<td>${dto.board_regdate}</td>
			<td>${dto.board_readcount}</td>
			<td>${dto.board_ip}</td>
		</tr>
		</c:if>
		</c:if>
	</c:forEach>			
		</table>
	
	<!-- 게시글 페이지 수-->
<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
   <c:if test="${page.count>0}">
   		<c:if test="${page.startPage > p.pageBlock}">
   			 <li class="page-item">
     		 <a class="page-link" href="board_free.do?mode=&pageNum=${page.startPage-page.pageBlock}" aria-label="Previous">
       		 <span aria-hidden="true">&laquo;</span>
      		</a>
   			</li>
   		</c:if>
   		
   		<c:forEach var="i" begin="${page.startPage}" end="${page.endPage}">
   			 <li class="page-item">
   			  <a class="page-link" href="board_free.do?board_num=${listboard.board_num}&mode=&pageNum=${i}">${i}</a></li>
    	</c:forEach>
    
   <c:if test="${page.endPage < page.pageCount}">
   			 <li class="page-item">
      			<a class="page-link" href="board_free.do?mode=&pageNum=${page.startPage+page.pageBlock}" aria-label="Next">
        			<span aria-hidden="true">&raquo;</span>
     			</a>
    		</li>
  		</c:if>  
	 </c:if>
  	</ul>
	</nav>
            </div>
          </div>
        </div>
        </div>
        
        <div class="col-lg-2">
          <div class="card h-100">
            <div class="card-body">
              <h5 class="card-title">인기글</h5>
             <div class="d-flex flex-column align-items-stretch flex-shrink-0 bg-white" ">
 	<div class="container">
  	<div class="row">
	<div class="card border-light mb-3" style="max-width: 18rem;">
  	<div class="card-header">조회수 높은 순</div>
    <ul class="list-group list-group-flush">
  <c:forEach var="rlist" items="${readlist }" begin="0" end="4">
    <li class="list-group-item"><!-- 상세보기 넘어갈 때  회원만 보게 하기 -->
				<c:if test="${empty sessionScope.mbId}">
				<a href="javascript:checkLogin()" class="link-primary text-decoration-none link-opacity-50-hover">${rlist.board_title}(${rlist.board_replycount })</a> 
				</c:if>
				
				<c:if test="${not empty sessionScope.mbId}">
				<a href="content_board.do?board_num=${rlist.board_num}&pageNum=1&mode=" class="link-primary text-decoration-none link-opacity-50-hover">${rlist.board_title}(${rlist.board_replycount })</a> 
				</c:if></li>
    </c:forEach>
  </ul>
  </div>
  </div>
  <div class="row">
	<div class="card border-light mb-3" style="max-width: 18rem;">
  	<div class="card-header">댓글 많은 게시글</div>
   <ul class="list-group list-group-flush">
  <c:forEach var="rlist" items="${replylist }" begin="0" end="4">
    <li class="list-group-item"><!-- 상세보기 넘어갈 때  회원만 보게 하기 -->
				<c:if test="${empty sessionScope.mbId}">
				<a href="javascript:checkLogin()" class="link-primary text-decoration-none link-opacity-50-hover">${rlist.board_title}(${rlist.board_replycount })</a> 
				</c:if>
				
				<c:if test="${not empty sessionScope.mbId}">
				<a href="content_board.do?board_num=${rlist.board_num}&pageNum=1&mode=" class="link-primary text-decoration-none link-opacity-50-hover">${rlist.board_title}(${rlist.board_replycount })</a> 
				</c:if></li>
    </c:forEach>
  </ul>
  </div>
  </div>
  </div>
	</div>
            </div>
          </div>

        </div>
      </div>
   
    </section>
       </div>
</html>
<%@include file="../user/user_bottom.jsp" %>