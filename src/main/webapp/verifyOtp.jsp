<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify OTP</title>

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
    linear-gradient(rgba(0,0,0,.45),rgba(0,0,0,.45)),
    url("https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?auto=format&fit=crop&w=1600&q=80");
    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;
    padding:20px;
}

.container{
    width:100%;
    max-width:420px;
    background:rgba(255,255,255,.96);
    backdrop-filter:blur(12px);
    padding:40px 35px;
    border-radius:20px;
    box-shadow:0 20px 45px rgba(0,0,0,.30);
    animation:fadeIn .6s ease;
}

@keyframes fadeIn{

from{
opacity:0;
transform:translateY(25px);
}

to{
opacity:1;
transform:translateY(0);
}

}

h2{
    text-align:center;
    color:#ff5a3c;
    font-size:30px;
    margin-bottom:10px;
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

.container::before{
    content:"Enter the verification code sent to your email";
    display:block;
    text-align:center;
    color:#666;
    font-size:14px;
    margin-bottom:25px;
    line-height:22px;
}

.error{
    background:#ffe8e8;
    color:#d32f2f;
    padding:12px;
    border-radius:8px;
    text-align:center;
    margin-bottom:18px;
    font-size:14px;
}

input{
    width:100%;
    padding:15px;
    border:1px solid #ddd;
    border-radius:10px;
    background:#fafafa;
    font-size:17px;
    text-align:center;
    letter-spacing:5px;
    transition:.3s;
    margin-bottom:20px;
}

input:focus{
    outline:none;
    background:#fff;
    border-color:#ff5a3c;
    box-shadow:0 0 0 4px rgba(255,90,60,.15);
}

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
    box-shadow:0 15px 28px rgba(255,90,60,.35);
}

button:active{
    transform:scale(.98);
}

@media(max-width:500px){

.container{
    padding:30px 22px;
}

h2{
    font-size:26px;
}

}

</style>

</head>

<body>

<div class="container">

<h2>Verify OTP</h2>

<%
String error=(String)request.getAttribute("error");

if(error!=null){
%>

<p class="error"><%=error%></p>

<%
}
%>

<form action="VerifyOtpServlet" method="post">

<input
type="text"
name="otp"
placeholder="Enter 6 Digit OTP"
required>

<button>

Verify OTP

</button>

</form>

</div>

</body>
</html>