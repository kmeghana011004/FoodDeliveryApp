<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>QuickBite | Login</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
}

body{
    display:flex;
    justify-content:center;
    align-items:center;
    min-height:100vh;

    background:
    linear-gradient(rgba(0,0,0,.60),rgba(0,0,0,.60)),
    url("https://images.unsplash.com/photo-1555396273-367ea4eb4db5?auto=format&fit=crop&w=1920&q=80");

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    background-attachment:fixed;
}
/* Login Card */

.container{
    width:100%;
    max-width:430px;
    background:rgba(255,255,255,.96);
    backdrop-filter:blur(18px);
    border-radius:22px;
    padding:40px 35px;
    box-shadow:0 20px 45px rgba(0,0,0,.30);
    animation:fadeIn .6s ease;
}

@keyframes fadeIn{

from{
opacity:0;
transform:translateY(30px);
}

to{
opacity:1;
transform:translateY(0);
}

}

/* Logo */

.logo{
    text-align:center;
    font-size:42px;
    font-weight:700;
    color:#ff5a3c;
    margin-bottom:8px;
}

.tagline{
    text-align:center;
    color:#666;
    font-size:14px;
    margin-bottom:30px;
}

/* Heading */

h2{
    text-align:center;
    color:#222;
    font-size:30px;
    margin-bottom:25px;
}

h2::after{
    content:"";
    display:block;
    width:70px;
    height:4px;
    background:#ff5a3c;
    margin:12px auto 0;
    border-radius:20px;
}

/* Form */

.form-group{
    margin-bottom:22px;
}

label{
    display:block;
    margin-bottom:8px;
    color:#444;
    font-weight:600;
    font-size:15px;
}

input{
    width:100%;
    padding:15px;
    border:1px solid #ddd;
    border-radius:10px;
    background:#fafafa;
    font-size:15px;
    transition:.3s;
}

input:focus{
    outline:none;
    background:#fff;
    border-color:#ff5a3c;
    box-shadow:0 0 0 4px rgba(255,90,60,.15);
}

/* Password */

.password-box{
    position:relative;
}

.password-box input{
    padding-right:50px;
}

.eye{
    position:absolute;
    right:15px;
    top:15px;
    font-size:18px;
    cursor:pointer;
    color:#777;
}

.eye:hover{
    color:#ff5a3c;
}

/* Forgot */

.forgot{
    text-align:right;
    margin-bottom:22px;
}

.forgot a{
    text-decoration:none;
    color:#ff5a3c;
    font-size:14px;
    font-weight:600;
}

.forgot a:hover{
    text-decoration:underline;
}

/* Button */

button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#ff5a3c,#ff7b42);
    color:#fff;
    font-size:17px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
    box-shadow:0 10px 20px rgba(255,90,60,.25);
}

button:hover{
    transform:translateY(-3px);
    box-shadow:0 15px 30px rgba(255,90,60,.35);
}

button:active{
    transform:scale(.98);
}

/* Register */

.register{
    margin-top:28px;
    text-align:center;
    color:#666;
    font-size:15px;
}

.register a{
    text-decoration:none;
    color:#ff5a3c;
    font-weight:700;
}

.register a:hover{
    text-decoration:underline;
}

/* Messages */

.error{
    background:#ffe8e8;
    color:#d32f2f;
    border-left:5px solid #d32f2f;
    padding:14px;
    border-radius:10px;
    margin-bottom:20px;
    text-align:center;
    font-weight:600;
}

.success{
    background:#e9f9ee;
    color:#28a745;
    border-left:5px solid #28a745;
    padding:14px;
    border-radius:10px;
    margin-bottom:20px;
    text-align:center;
    font-weight:600;
}

/* Mobile */

@media(max-width:500px){

.container{
    padding:30px 22px;
}

.logo{
    font-size:36px;
}

h2{
    font-size:26px;
}

}

</style>

</head>

<body>

<div class="container">

<div class="logo">
🍔 CraveNest
</div>

<div class="tagline">
Fresh Food • Fast Delivery • Great Taste
</div>

<h2>Welcome Back</h2>

<%
String error=(String)request.getAttribute("error");

String success=(String)request.getAttribute("success");

if(error!=null){
%>

<div class="error">

<%=error%>

</div>

<%
}

if(success!=null){
%>

<div class="success">

<%=success%>

</div>

<%
}
%>

<form action="callLoginServlet" method="post">

<div class="form-group">

<label>Email Address</label>

<input
type="email"
name="email"
placeholder="Enter your email"
required>

</div>

<div class="form-group">

<label>Password</label>

<div class="password-box">

<input
type="password"
id="password"
name="password"
placeholder="Enter your password"
required>

<span class="eye"
onclick="togglePassword()">
👁
</span>

</div>

</div>

<div class="forgot">

<a href="forgetPassword.jsp">Forgot Password?</a>

</div>

<button type="submit">

Login

</button>

</form>

<div class="register">

Don't have an account?

<a href="Register.html">

Register Now

</a>

</div>

</div>

<script>

function togglePassword(){

var x=document.getElementById("password");

if(x.type==="password"){

x.type="text";

}
else{

x.type="password";

}

}

</script>

</body>
</html>