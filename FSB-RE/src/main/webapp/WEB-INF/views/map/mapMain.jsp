<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@include file="../user/user_top.jsp" %>
<!-- map.jsp -->
<head>
<script src="resources/js/jquery-3.7.0.js"></script>
<!-- Vendor JS Files -->
  <script src="resources/NiceAdmin/assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/chart.js/chart.umd.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/echarts/echarts.min.js"></script>
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
</head>
<body>
	<div class="container-fluid">
    <div class="pagetitle">
    <br>
      <h1>보드게임 매장지도</h1>
    </div><!-- End Page Title -->
 <section class="section">
      <div class="row">
      <div class="col-lg-3">
       <div class="card h-100">
       		<div class="card-body">
				<%@include file="../map/mapListBox.jsp"%>
			</div>
			</div>
		</div>
		
	<div class="col-lg-9">
	<div class="card h-100">
	<div class="card-body" style="height : 700px;">
	<div align="center" id="map" style="width: 100%; height:100%;"></div>
	</div>
	</div>
	</div>
	</div>
	</section>
	</div>
	<!-- services 라이브러리 불러오기 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=265d925f04bd6bf7c74e0ca951641be9&libraries=services"></script>
	<c:forEach var="list" items="${locationList }">
			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				mapOption = {
					center : new kakao.maps.LatLng(37.655798132203394, 127.06228085698994), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨
				};

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption);

				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();

				// 주소로 좌표를 검색합니다
				geocoder
						.addressSearch(
								'${list.bp_location}',
								function(result, status) {

									// 정상적으로 검색이 완료됐으면 
									if (status === kakao.maps.services.Status.OK) {

										var coords = new kakao.maps.LatLng(
												result[0].y, result[0].x);

										// 결과값으로 받은 위치를 마커로 표시합니다
										var marker = new kakao.maps.Marker({
											map : map,
											position : coords
										});

										// 인포윈도우로 장소에 대한 설명을 표시합니다
										var infowindow = new kakao.maps.InfoWindow(
												{
													content : '<div style="width:150px;text-align:center;padding:6px 0;">${list.bp_store_name}</div>'
												});
										infowindow.open(map, marker);

										// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
										map.setCenter(coords);
									}
								});
			</script>
		</c:forEach>
	<ul id="placesList"></ul>
</div>
<%@include file="../user/user_bottom.jsp" %>