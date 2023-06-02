<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H2>Home>회원 정보 입력</H2>
<hr style="border:solid 1px;">
<H3>개인 정보 입력</H3>
<form name=membershipform method=get action=request1_result(2019305067).jsp>
	<table>
		<tr>
			<td>이름 :<br>
			<input type="text" name="u_name" required></td>
		</tr>
		<tr>
			<td>비밀번호 :<br>
			<input type="password" name="u_pass" required>
			</td>
		</tr>
		<tr>
			<td>E-mail :<br>
			<input type="email" name="u_email" required>
			</td>
		</tr>
		<tr>
			<td>연락처 :<br>
				<select name="n_kind" required>
					<option value="no">선택</option>
					<option value="KT">KT</option>
					<option value="SKT">SKT</option>
					<option value="LGU+">LGU+</option>
					<option value="자급제">자급제</option>
				</select>
				<input type="tel" name="number1" required>-
				<input type="tel" name="number2" required>-
				<input type="tel" name="number3" required>
			</td>
		</tr>
		<tr>
			<td>성별 :
				<input type="radio" name="gender" value="남" required>남
				<input type="radio" name="gender" value="여" required>여
			</td>
		</tr>
		<tr>
			<td>취미 :
				<input type="checkbox" name=hobby value="운동">운동
				<input type="checkbox" name=hobby value="독서">독서
				<input type="checkbox" name=hobby value="여행">여행
				<input type="checkbox" name=hobby value="음악감상">음악감상
			</td>
		</tr>
		<tr>
			<td>본인 소개 :<br>
			<textarea name="intro" cols="30" rows="5"></textarea></td>
		</tr>
		<tr><td colspan=2 align=center><input type=submit value="가입하기"><input type=reset value="다시작성"></td></tr>
	</table>
</form>
</body>
</html>