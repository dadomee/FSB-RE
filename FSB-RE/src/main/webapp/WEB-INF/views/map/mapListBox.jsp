<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- map.jsp -->

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
<script>
	function maplist(){
		var form = $('#f')[0];
		var formData = new FormData(form);
		$.ajax({
		    url:'map_search.do', //request 보낼 서버의 경로
		    type:'post', // 메소드(get, post, put 등)
		    data : formData,
			dataType:'text',
		    processData:false,
		    contentType:false,
		    cache:false,
		    
		    success: function(data) {
		    	$("#maplist").html(data) ;
		    },
		    error: function(err) {
		    	alert("ajax 처리 중 에러 발생");
		    	console.log(err)
		        //서버로부터 응답이 정상적으로 처리되지 못했을 때 실행
		    }
		});

	}
</script>
s			<div class="border-top"></div>
			 <form id="f"  name="f" class="d-flex" role="search" action="javascript:maplist()">
		<div class="input-group mb-3">
			<input type="search" name="searchString" class="form-control"
				placeholder="매장명을 검색하세요" aria-label="searchString" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="submit"	id="button-addon2">검색</button>
			</div>
		</form>
		<div class="border-top"></div>
		<br>
		<div class="container overflow-scroll" style=max-height:600px;>
		<c:if test="${mode eq null }">
		<table id="maplist">
		<c:forEach var="list" items="${locationList }">
		<tr >
		<td>
		<div class="card">
  			<div class="card-body" style=height:170px;>
   				<div class="card-title"><a href="map_click.do?bp_num=${list.bp_num }">${list.bp_store_name }</a></div>
   				 <p class="card-text">🚩${list.bp_location }${list.bp_d_location }
   				 <br>
  				 📞${list.bp_tel } 		 ⭐${list.bp_starrating }/5.0</p>
    			 <a href="b_personalHome.do?bp_num=${list.bp_num }&num=${list.mem_num}" class="card-link">프로필로 이동</a>
 			 </div>
		</div>
		</td>
		</tr>
		</c:forEach>
		</table>
		</c:if>
		<c:if test="${mode ne null }">
		<table id="maplist">
		<c:forEach var="plist" items="${plist }">
		<tr >
		<td>
		<div class="card">
  			<div class="card-body" style=height:165px;>
   				<div class="card-title"><a href="map_click.do?bp_num=${list.bp_num }">${list.bp_store_name }</a></div>
   		 <p class="card-text">🚩${plist.bp_location }${list.bp_d_location }
   				 <br>
  				 📞${plist.bp_tel } 		 ⭐${plist.bp_starrating }/5.0</p>    			 
  				 <a href="b_profile.do?bp_num=${plist.bp_num }" class="card-link">프로필로 이동</a>
 			 </div>
		</div>
		</td>
		</tr>
		</c:forEach>
		</table>
		</c:if>
		</div>

