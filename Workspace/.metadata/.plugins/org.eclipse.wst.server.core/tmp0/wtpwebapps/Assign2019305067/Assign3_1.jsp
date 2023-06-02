<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
	function check() {
		var form = document.assign3_1
		var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i
		if(isNaN(form.username.value)==false){
			alert("작성자는 숫자로 시작할 수 없습니다.")
			return false;
		}
		if(!regExpEmail.test(form.email.value)){
			alert("이메일 형식으로 입력해주세요.")
			return false;
		}
		else return true;
	}
</script>
<body>
<h2>Home > 작성자와 이메일 주소 입력</h2>
<hr style="border:solid 1px;">
<form name=assign3_1 method=post action=Assign3_2.jsp onsubmit="return check()">
	<table>
		<tr>
			<td>작성자 :<br>
			<input type="text" name="username" required></td>
		</tr>
		<tr>
			<td>이메일 :<br>
			<input type="text" name="email" required></td>
		</tr>
		<tr><td><input type=submit value="신청하기" ></td></tr>
	</table>
</form>

</body>
</html>