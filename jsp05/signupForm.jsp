<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<form action="signupPro.jsp" method="post"> <!-- 주소창에 get은 공개 post 비공개 -->
		<table>
			<tr>
				<td>ID *<br />
					<input type = "text" name="id"/>
				</td>
			
			</tr>
			<tr>
				<td>Password *<br />
					<input type = "password" name="pw"/>
				</td>
			
			</tr>
			<tr>
				<td>Name *<br />
					<input type = "text" name="name"/>
				</td>
			
			</tr>
			<tr>
				<td>Email <br />
					<input type = "text" name="email"/>
				</td>
			
			</tr>
			<tr>
				<td>Gender *<br />
					<input type = "radio" name="gender" value="male" checked/>남
					<input type = "radio" name="gender" value="female"/>여
				</td>
			
			</tr>
			<tr>
				<td>Hobbies<br />
					<input type = "checkbox" name="music" value = "music"/>Music
					<input type = "checkbox" name="sports" value = "sports"/>Sports
					<input type = "checkbox" name="travel" value = "travel"/>Travel
					<input type = "checkbox" name="movies" value = "movies"/>Movies
				</td>
			<tr>
				<td>Date of Birth <br />
					<input type = "text" name="birthYY" placeholder="YYYY"/>년
					<input type = "text" name="birthMM" placeholder="MM"/>월
					<input type = "text" name="birthDD" placeholder="DD"/>일
				</td>
			
			</tr>
			<tr>
				<td>job <br />
					<select name = "job">
						<option>Employer</option>
						<option>Employee</option>
						<option>Teacher</option>
						<option>Student</option>
						<option>Freelancer</option>
						<option>Etc</option>
					</select>
				</td>	
			</tr>
			
			<tr>
				<td>Bio<br />
					<textarea rows="5" cols="20" name="bio"></textarea>
				</td>
				
			</tr>
			
			<tr>
				<td>
					<input type="submit" value = "sign up"/>
				</td>
			</tr>

		</table>
	</form>







</body>
</html>