<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

	if(session.getAttribute("twitter")==null)
		response.sendRedirect("login.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="./assets/css/Buttons.css">
<link rel="stylesheet" type="text/css" href="./assets/css/login.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="cabecera">
<div id="divlogo"><img id="logoCab" src="./assets/img/LOGO.png" alt="logo"/></div>
<div id="divbusca"><a href="Index.jsp"/><img id="busca" src="./assets/img/buscaLogo.png" alt="logoBusca"/></a></div>
<div id="divpublica"><a href="Post.jsp"/><img id="publica" src="./assets/img/publica.png" alt="logoPublica"/></a></div>
<div id="divchatea"><img id="chatea" src="./assets/img/chatea.png" alt="logoChatea"/></div>
<div id="divlogin"><section class="row1">  
 <div class="seccion">
  <div class="boton-linea-ext">
    <span class="linea1"></span>
    <span class="linea2"></span>
    <span class="linea3"></span>
    <span class="linea4"></span>
    <a id="modalBtn" class="button" href="logout">CERRAR SESIÓN</a>
  </div>
 </div>
</section></div>
</div>
</body>
</html>