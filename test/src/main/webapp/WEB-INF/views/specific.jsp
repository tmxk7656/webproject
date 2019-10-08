<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script> -->
   <script type="text/javascript" src="<c:url value="/resources/jquery.min.js"/>"></script>
	
<style>

}
</style>
<script>
	$(document).ready(function(){
		var code = "${code}";
		
		var query = {
				post_code : code
		};
		
	 $.ajax({
			url: "/specificck",
			//contentType:"application/json; charset=UTF-8"",
			type: "post",
			data:query,
			success:function(data){

				$("#content").val(data[0].post_content);
				$("#id").val(data[0].id);
				$("#time").val(data[0].post_pay);
				$("#item").val(data[0].item);
				/* alert("${sessionScope.sessionid.id}");
				alert(data[0].id); */
				if("${sessionScope.sessionid.id}" == data[0].id){
					$("#update").css("display","block");
					$("#delete").css("display","block");
				}
				
			}
			
		});
	 $("#delete").click(function(){
		 
	 			var a = $(this);
	 			var postcode = a.next().val();
	 			alert(postcode);
	 			
	 			var query = {
	 					
	 					post_code : postcode
	 			};
	 			
	 			$.ajax({
	 				
	 				url:"/deletepost",
	 				type: "get",
	 				data: query,
	 				success:function(data){
	 					
	 					location.href="/main";
	 				}
	 				
	 			});
	 			
		 	
		 
	 		});
	 $("#update").click(function(){
		 
			var a = $(this);
			var postcode = a.next().val();
			var postcontent = $("#content").val();
			alert(postcode);
			
			var query = {
					
					post_code : postcode,
					post_content : postcontent
			};
			console.log(query);
			
			$.ajax({
				
				url:"/updatepost",
				type: "post",
				data: JSON.stringify(query),
				dataType : 'json',
				contentType: "application/json; charset=UTF-8",
				success:function(data){
					
					console.log(data);
					location.href="/main";
				}
				
				
			});
			
	 	
	 
		});
	 $("#good").click(function(){
		 
			var a = $(this);
			var postcode = a.next().val();
			
			alert(postcode);
			var query = {
					
					post_code : postcode
					
					
			};
			console.log(query);
			
			$.ajax({
				
				url:"/mastergood",
				type: "post",
				data: query,
				success:function(data){
					
					console.log(data);
					location.href="/main";
				}
				
			});
			
	 	
	 
		});
	 
	 	
		});

</script>
</head>
<body>

		
		<div>
			<label>내용</label> 
			<textarea id="content" name="post_content" value="" row="10"></textarea>
		</div>
		<div>
			<label>작성자</label>
			<textarea id="id"   name="id" value="" row="10"></textarea>
		</div>
		<div>
			<label>작성일자</label>
			<textarea id="time" name="post_pay" value="" row="10"></textarea>
		</div>
		<div>
			<label>관련사항</label>
			<textarea id="item" name="item" value="" row="10"></textarea>
		</div>
		
		
		<button id="update" style="display:none">수정</button>
		<input type="hidden" name="post_code" value="${code}" >
		<button id="delete" style="display:none">삭제</button> 		
		<input type="hidden" name="post_code" value="${code}" >
		<button id="good">추천</button> 
		<input type="hidden" name="post_code" value="${code}" >
		
		
		<input type="button" value="메인으로돌아가기" onclick="history.go(-1) " >
		


</body>
</html>
