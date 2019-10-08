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
h1{
		text-align: center;
}
table {
	border: 1px solid ;
	width: 100%;
	border-collapse: collapse;
}
th, td{
  border: 1px solid;
  text-align: center;



  
}
</style>
<script>
	$(document).ready(function(){
		$.ajax({
			url: "/getlist",
			type: "POST",
			success:function(data){
				for(var i=0;i<data.length;i++){
					console.log(data[i].post_content);
				var content = '<tr class="code"><td>'
					+data[i].post_title
					+'</td><td>'
					+data[i].id
					+'</td><td>' 
					+data[i].post_pay
					+'</td><td>'
					+data[i].post_visit
					+'</td><td>'
					+data[i].item
					+'</td><td><input type="hidden" value="'
					+data[i].post_code
					+'"></td><tr>';
					$("#list").append(content);
				}
			}
			
		});
		
		$(document.body).on("click",".code",function(){
			var a = $(this);
			var post_code = a.find('input').val();
			 
			
			location.href="/specific?post_code="+post_code;
			
			
		});
		
	});
</script>
</head>
<body>
<h1>
	게시판완성하기
</h1>


	<table>
		<thead id="ss">
		<!-- <tr height="1" bgcolor="#D2D2D2"> -->
		<tr>
			<th>제목</th>
			<th>글쓴이이름</th>
			<th>작성일자</th>
			<th>조회수</th>
			<th>관련사항</th>
				
		</tr>
		</thead>
		<tbody id="list">
		
		</tbody>
	</table>
	<a href="/addpost"><button>글 작성</button></a>
	<a href="/memberlist"><button>회원목록</button></a>
	<a href="/logout"><button>로그아웃</button></a>


</body>
</html>
