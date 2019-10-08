<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home</title>
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"
   integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
   crossorigin="anonymous"></script> -->
<script type="text/javascript" src="<c:url value="/resources/jquery.min.js"/>"></script>

<script>
$(document).ready(function(){
	
	$("#login").click(function(){
	
		
		
		var query= {
				
				id: $("#id").val(),
				pass: $("#pass").val()
		};
	
		
		$.ajax({
			
			url: "/loginck",
			type: "post",
			data: query,
			success:function(data){
				
				if("idfail" == data){
					alert("아이디가 존재하지 않습니다.");
				}else if ("pwfail" == data){
					alert("비밀번호가 존재하지 않습니다.");
				}else{
					window.location.replace("/main");
				
				
				
			}
			
			
		}
		
	});
});
});

</script>
</head>
<body>

<div>
	<label>아이디</label>
	<input type="text" id="id" placeholder="아이디를입력하세요">
</div>
<div>
	<label>비밀번호</label>
	<input type="text"  id="pass"placeholder="비밀번호를입력하세요">
</div>
<input type="submit" value="로그인" id="login">





</body>
</html>