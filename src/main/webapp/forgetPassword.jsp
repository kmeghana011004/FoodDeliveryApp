<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forgot Password</title>

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
    linear-gradient(rgba(0,0,0,.5),rgba(0,0,0,.5)),
    url("https://images.unsplash.com/photo-1552566626-52f8b828add9?auto=format&fit=crop&w=1600&q=80");

    background-size:cover;
    background-position:center;
}

.container{
    width:100%;
    max-width:420px;
    background:#fff;
    padding:40px 35px;
    border-radius:20px;
    box-shadow:0 15px 35px rgba(0,0,0,.12);
    animation:fade .5s ease;
}

@keyframes fade{
    from{
        opacity:0;
        transform:translateY(20px);
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
    margin-bottom:12px;
}

h2::after{
    content:"";
    display:block;
    width:60px;
    height:4px;
    background:#ff5a3c;
    margin:12px auto 0;
    border-radius:10px;
}

.container p{
    text-align:center;
    color:#666;
    margin-bottom:25px;
    font-size:15px;
}

input{
    width:100%;
    padding:15px;
    margin-bottom:20px;
    border:1px solid #ddd;
    border-radius:10px;
    font-size:15px;
    background:#fafafa;
    transition:.3s;
}

input:focus{
    outline:none;
    border-color:#ff5a3c;
    background:#fff;
    box-shadow:0 0 0 4px rgba(255,90,60,.15);
}

button{
    width:100%;
    padding:15px;
    border:none;
    border-radius:10px;
    background:linear-gradient(135deg,#ff5a3c,#ff7849);
    color:#fff;
    font-size:16px;
    font-weight:600;
    cursor:pointer;
    transition:.3s;
    box-shadow:0 10px 20px rgba(255,90,60,.25);
}

button:hover{
    transform:translateY(-2px);
    box-shadow:0 14px 25px rgba(255,90,60,.35);
}

button:active{
    transform:scale(.98);
}

@media(max-width:480px){

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

		<h2>Forgot Password</h2>
		<%
		String error = (String) request.getAttribute("error");

		if (error != null) {
		%>

		<p style="color: red; text-align: center;">
			<%=error%>
		</p>

		<%
		}
		%>

		<form action="ForgotPasswordServlet" method="post">

			<input type="email" name="email"
				placeholder="Enter your Registered Email" required>

			<button type="submit">Send OTP</button>

		</form>

	</div>

</body>
</html>