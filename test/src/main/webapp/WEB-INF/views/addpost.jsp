<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script> -->
	<script type="text/javascript" src="<c:url value="/resources/jquery.min.js"/>"></script>
<title>Insert title here</title>
<script>
	
</script>
</head>
<body>
	<form action="/addpostck" method="get">
		<div>
			<label>제목</label> <input type="text" name="post_title"
				placeholder="제목을 입력하세요.">
		</div>
		<div>
			<label>내용</label>
			<textarea name="post_content" row="6"></textarea>
		</div>
		<div>
			<label>관련사항</label>
			<textarea name="item" row="5"></textarea>
		</div>

		<input type="submit" value="등록"> <input type="reset"
			value="취소" onClick="history.go(-1)">
	</form>
</body>
</html>