<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Created By CodingLab - www.codinglabweb.com -->
<html lang="en">

<head>
<base href="${pageContext.request.contextPath}/ex/">
<meta charset="UTF-8">
<!---<title> Responsive Registration Form | CodingLab </title>--->
<link rel="stylesheet" href="css/survey.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div class="container">
	
		<div class="button">
			<a href="index.jsp"><input class="home" type="submit" value="Home"></a>
		</div>
		<br>
		<div class="title">Survey</div>
		<div class="content">
			<form action="survey" method="post">
				<div class="user-details">
					<div class="input-box">
						<span class="details">First Name</span> <input type="text"
							placeholder="Enter your first name" name="firstName" required>
					</div>
					<div class="input-box">
						<span class="details">Last Name</span> <input type="text"
							placeholder="Enter your last name" name="lastName" required>
					</div>
					<div class="input-box">
						<span class="details">Email</span> <input type="text"
							placeholder="Enter your email" name="email" required>
					</div>
					<div class="input-box">
						<span class="details">Date of Bitrh</span> <input type="date"
							placeholder="Enter your date of birth" name="dateOfBirth"
							required>
					</div>

				</div>
				<div class="title">How did you hear about us ?</div>
				<div class="gender-details">
					<input type="radio" name="heardFrom" value="Search Engine" checked id="dot-1"> <input
						type="radio" name="heardFrom" value="Word of Mouth" id="dot-2"> <input
						type="radio" name="heardFrom" value="Social Media" id="dot-3"> <input
						type="radio" name="heardFrom" value="Other" id="dot-4">
					<!-- <span class="gender-title">How did you hear about us ?</span> -->
					<div class="category">
						<label for="dot-1"> <span class="dot one"></span> <span
							class="gender">Search Engine</span>
						</label> <label for="dot-2"> <span class="dot two"></span> <span
							class="gender">Word of Mouth</span>
						</label> <label for="dot-3"> <span class="dot three"></span> <span
							class="gender">Social Media</span>
						</label> <label for="dot-4"> <span class="dot four"></span> <span
							class="gender">Other</span>
						</label>
					</div>
				</div>

				<div class="title">Would you like to receive announcements
					about new CDs and special offers?</div>
				<br>
				<p>
					<input type="checkbox" name="wantsUpdates"> YES, I'd like
					that.
				</p>

				<p>
					<input type="checkbox" name="emailOK"> YES, please send me
					email announcements.
				</p>
				<br>
				<div class="title">Please contact me by</div>
				<br>
				<select name="contactVia">
					<option value="Both" selected>Email or postal mail</option>
					<option value="Email">Email only</option>
					<option value="Postal Mail">Postal mail only</option>
				</select>

				<div class="button">
					<input type="submit" value="Register">
				</div>
			</form>
		</div>
	</div>

</body>

</html>