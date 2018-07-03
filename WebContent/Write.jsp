<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
body { font-family: 'Jeju Myeongjo'; }

input[type='submit'] { width:200px; height:60px; border:0px; margin-top:40px; 
background-color:gray; color:white; font-size:15pt; font-family: 'Jeju Myeongjo';  }
input[type='submit']:hover {background-color:#eb6670;}
div{margin-top:10%;}
</style>
<title>자리배치</title>
</head>
<body>
<div style="margin-top: 30px;"></div>
<center>
<form method="post" action="Change.jsp">
<div>
<h1>배치표 이름을 입력해주세요.</h1>
<input type="text" name="name" min=20 max=40 required><br>
<h1>인원수를 입력해주세요.</h1>
<input type="number" name="people" min=20 max=40 required><br>
<h1>분단수를 입력해주세요.</h1>
<input type="number" name="division" min=2 max=4 required><br>
</div>
<h1>결원을 입력해주세요. (,로 구분합니다.)</h1>
<input type="text" name="remove"><br>
<input type="submit" value="GO!">
</form>
</div>
</center>
</body>
</html>