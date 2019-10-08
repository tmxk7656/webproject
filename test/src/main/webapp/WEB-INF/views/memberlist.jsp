<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
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
/* $(document).ready(function(){
	$.ajax({
		url: "/memberlistck",
		type: "POST",
		success:function(data){
			for(var i=0;i<data.length;i++){
				
			var content = '<tr class="code"><td>'
				+data[i].member_number
				+'</td><td>'
				+data[i].id
				+'</td><tr>';
				$("#list").append(content);
			}
		}
		
	}); */
</script>
</head>


<body>
<h1>
	회원목록
</h1>


	<table>
		<thead id="ss">
		
		<tr>
			<th>회원번호</th>
			<th>회원이름</th>
			<th>전문가유무</th>
			
				
		</tr>
		</thead>
		<tbody id="list">
		<c:forEach var="i" items="${member}">
		<tr>
			<td>${i.member_number }</td>
			<td>${i.id}</td>
			
		<c:if test="${i.master == 1 }">
			<td>true</td>
		</c:if>
		<c:if test="${i.master == 0  }">
			<td>false</td>
		</c:if>
	
		</tr>
		</c:forEach>
		</tbody>
	</table>
	
	<input type="button" value="메인으로돌아가기" onclick="history.go(-1) " >

</body>
</html>