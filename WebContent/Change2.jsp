<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="com.sun.xml.internal.ws.policy.privateutil.PolicyUtils.Collections"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
body { font-family: 'Jeju Myeongjo'; padding-top:50px;}

input[type='submit'] { width:200px; height:60px; border:0px; margin-top:40px; background-color:gray; color:white; font-size:15pt; font-family: 'Jeju Myeongjo';  }
input[type='submit']:hover {background-color:#eb6670;}
#front {border: 1px solid gray; width: 150px;display:table-cell; height: 40px; 
vertical-align:middle; background-color: gray; color: white; margin-bottom: 60px;}
#student { border: 1px solid gray; width: 80px; height:80px;display:table-cell;vertical-align:middle;}
#title { border: 1px solid gray; width: 160px; height:50px; display:table-cell;vertical-align:middle;
background-color: gray; color: white; }
input[type='button'] { width:200px; height:60px; border:0px; margin-top:30px;
background-color:gray; color:white; font-size:15pt; font-family: 'Jeju Myeongjo';  }
input[type='button']:hover {background-color:#eb6670;}
</style>
<title>자리배치</title>
<script>
	function save() {
		alert("저장완료!");
	}
</script>
</head>
<body>
<center>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	String p=request.getParameter("people"); int people=Integer.parseInt(p);
	String d=request.getParameter("division"); int division=Integer.parseInt(d);
	String r=request.getParameter("remove");
	String remove[]=r.split(",");
	
	List res1 = new ArrayList();
	//랜덤
	int random[]=new int[people];
	for(int i=0; i<people; i++) {
		double randomValue=Math.random();
		random[i]=(int)(randomValue*people)+1;
		for(int j=0; j<i; j++) {
			if(random[i]==random[j]) i--;
		}
	}
	
	for(int i=0;i<people;i++){
		res1.add(random[i]);
	}
	
	
	for(int i=0;i<res1.size();i++){
			for(int j=0;j<remove.length;j++){
			if(res1.get(i).equals(Integer.parseInt(remove[j]))){
				res1.remove(i);
			}
		}
	}
	
	for(int i=0; i<res1.size(); i++) {
		System.out.println(i+"번째: "+res1.get(i));
	}
	
	//out.println(name); out.println(people); out.println(division); out.println(remove);
%>
<h1><%=name %>의 자리배치가 완료되었습니다. </h1>
<p>인원수: <%=people %>명, 분단수:<%=division %> <%if(r.length()>1) {out.println("결원: "); for(int i=0; i<remove.length; i++) {out.println(remove[i]+"번 ");}}%></p>
<div id="front">교탁</div>
<div style="margin-top: 30px;"></div>
<%
	//분단 확인용
	for(int i=0; i<division; i++) {
		out.println("<div id='title'>"+(i+1)+"분단</div>");
	}	
	out.println("<div style='margin-top: 30px;'></div>");
	
	
	//자리표 출력
	division=division*2;

	int extra=people%division;
	extra=division-extra;
	extra=people+extra;
	int www=80*division;
	out.println("<div style=' text-align: left;width: "+www+"px;'>");
	%>
	<%//자리표 출력
	for(int i=0; i<res1.size();i++) {
		%>
		<div id="student" style="text-align: center;">	
			<%
				 out.println(res1.get(i));				
			%>
		</div><%
		if((i+1)%division==0) out.println("<br><br>");
	}
%>
</div>


<%
		
%>
<br>
<input type="button" value="다른조건" onclick="location.href='Write.jsp'"><input type="button" value="재배치" onClick="window.location.reload()">
</center>
</body>
</html>