<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- writeForm.jsp -->
<%@include file="../user/user_top.jsp"%>
<html>
<head>
<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
<symbol id="img-select" viewBox="0 0 24 24">
         <path d="M3 5.5C3 4.119 4.119 3 5.5 3h13C19.881 3 21 4.119 21 5.5v13c0 1.381-1.119 2.5-2.5 2.5h-13C4.119 21 3 19.881 3 18.5v-13zM5.5 5c-.276 0-.5.224-.5.5v9.086l3-3 3 3 5-5 3 3V5.5c0-.276-.224-.5-.5-.5h-13zM19 15.414l-3-3-5 5-3-3-3 3V18.5c0 .276.224.5.5.5h13c.276 0 .5-.224.5-.5v-3.086zM9.75 7C8.784 7 8 7.784 8 8.75s.784 1.75 1.75 1.75 1.75-.784 1.75-1.75S10.716 7 9.75 7z"></path>
      </symbol>
</svg>
  <meta content="" name="description">
  <meta content="" name="keywords">

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
  
   <script src="resources/NiceAdmin/assets/vendor/quill/quill.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="resources/NiceAdmin/assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="resources/NiceAdmin/assets/js/main.js"></script>
  <!-- Template Main CSS File -->
  <link href="resources/NiceAdmin/assets/css/style.css" rel="stylesheet">

</body>
<title>게시글 작성</title>
<script type="text/javascript">

	function check() {
		if (f.board_title.value == "") {
			alert("제목을 입력해주세요!") 
			f.board_title.focus()
			return false
		}
		
		if (f.board_content.value == "") {
			alert("내용을 입력해주세요")
			f.board_content.focus()
			return false
		}
		return true
	}
	
function checkFile(file){
		var file = file
 		   file.select();
  		  document.selection.clear();
}

</script>

<script>
   attachFile = {
      idx : 2,
      add : function() { // 파일필드 추가
          var o = this;
          var idx = o.idx;
          var div = document.createElement('div');
         div.align = 'left';
         div.className = 'input-group mb-3 w-50';
         div.style.marginTop = '3px';
         div.id = 'file' + o.idx;

         var file = document.all ? document
               .createElement('<input name="board_img">') : document
               .createElement('input');
         file.type = 'file';
         file.name = 'board_img'+o.idx;
         file.className = 'form-control';
         file.id = 'fileField' + o.idx;
         file.accept ='image/*';
         file.oninput=function(){
            attachFile.add();
         }
         var btn = document.createElement('input');
         btn.type = 'button';
         btn.className = 'btn-close';
         btn.onclick = function() {
            o.del(idx);
            o.idx--;
            idx--;
         }
         btn.style.marginLeft = '5px';
         document.getElementById('attachFileDiv').appendChild(div);
         if (o.idx > 4) {
            alert("이미지는 4개까지!")
         }
         if (o.idx <= 4) {
            div.appendChild(file);
            div.appendChild(btn);
            o.idx++;
         }
      },
      
      del : function(idx) { // 파일필드 삭제
          
          document.getElementById('attachFileDiv').removeChild(
                document.getElementById('file' + idx));
       }
    }
</script>

</head>
<body>
		
		<div class="container-fluid">
   		 <section class="section">
  			  <div class="pagetitle">
  			  	<br>
    		  </div><!-- End Page Title -->
    
		<form name="f" action="write_board.do?mode=${mode}" method="post"
			 onsubmit="return check()" enctype="multipart/form-data">
		<input type="hidden" name="board_num" value="${param.board_num}"/>
		<input type="hidden" name="board_re_group" value="${param.board_re_group}"/>
		<input type="hidden" name="board_re_step" value="${param.board_re_step}"/>
		<input type="hidden" name="board_re_level" value="${param.board_re_level}"/>
	

         	<div class="card mb-3 w-75 p-3 mx-auto p-2">
            <div class="card-body">
         	<div class ="card-header">
    		<div class="row">
							<!--  테이블 센터랑 사이즈 조절하기  -->
							<input type="text" class="form-control"
								id="exampleFormControlInput1" placeholder="제목을 입력하세요."
								name="board_title">
  			 </div>
  			 </div>
    		  <div class="row">
              <!-- TinyMCE Editor -->
              <textarea class="tinymce-editor" name="board_content" placeholder="내용을 입력하세요." rows="10" ></textarea>
            </div>
          </div>
        </div>
             <!-- 이미지 업로드 (접이식) -->
			<div class="col mb-3 w-75 p-3 mx-auto p-2" align="left">
               <button type="button" class="btn btn-sm btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#image-collapse" aria-expanded="false">
                        <svg class="bi pe-none me-2" fill="#A6A6A6" width="24" height="24">
                        <use xlink:href="#img-select"></use></svg>
                       		 이미지 업로드 🔽</button>
                </div>
                    <div class="collapse mb-3 w-75 p-3 mx-auto p-2 " id="image-collapse">
                    <!-- div   id ="attachFileDiv">
                    <div align="left" class="input-group mb-3 w-50" >
                     <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="board_img1" accept="image/*" style="border: none; background: transparent;" onchange="javascript:attachFile.add()">
                     <button class="btn-close" type="button" id="inputGroupFileAddon04" onclick="javascript:Del()"></button>
                    </div>
                    </div>
                    	<input type="hidden" name="board_img1"/>
                    	<input type="hidden" name="board_img2"/>
                    	<input type="hidden" name="board_img3"/>
                    	<input type="hidden" name="board_img4"/> -->
                  <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" accept="image/*" name="board_img1" style="border: none; background: transparent;"></div>
                     </div>
                    
                  <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" accept="image/*" name="board_img2" style="border: none; background: transparent;"></div>
                     </div>
                    
                    <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" accept="image/*" name="board_img3" style="border: none; background: transparent;"></div>
                    </div>
                    
                    <div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" accept="image/*" name="board_img4" style="border: none; background: transparent;"></div>
               		</div>
               		
               </div>
               <div class="col mb-3 w-75 p-3 mx-auto p-2" align="left">
               		<div class="row row-cols-2">
                     <div class="col-md-auto"><input type="file" class="form-control mb-2" id="formFileSm" name="filename" style="border: none; background: transparent;" multiple="multiple"></div>
              		</div>
              	</div>
					<!-- 게시글 등록 버튼  -->
						<div class="d-grid gap-2 w-25 mx-auto p-2">
							<button class="btn btn-primary d-grid gap-2 w-100 mx-auto p-2" type="submit">글쓰기</button>
							<button class="btn btn-primary" type="reset">다시작성</button>
							<button class="btn btn-primary" type="button"
								onclick="window.location='board_free.do'">목록보기</button>
						</div>
		</form>
	</section>
	</div>
</body>
<%@include file="../user/user_bottom.jsp"%>
</html>







