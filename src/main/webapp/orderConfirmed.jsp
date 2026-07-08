<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Confirmed | CraveNest</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:Segoe UI,sans-serif;
}

body{
    background:#f5f5f5;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

/* Card */

.container{
    width:500px;
    background:#fff;
    border-radius:18px;
    padding:40px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,.12);
}

/* Tick */

.tick{
    width:100px;
    height:100px;
    margin:auto;
    background:#28a745;
    color:white;
    border-radius:50%;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:50px;
    margin-bottom:25px;
}

h1{
    color:#28a745;
    margin-bottom:15px;
}

p{
    color:#666;
    line-height:28px;
    margin-bottom:30px;
}

/* Order Box */

.order-box{
    background:#fafafa;
    border:1px solid #eee;
    border-radius:10px;
    padding:18px;
    margin-bottom:30px;
}

.order-box p{
    margin:8px 0;
    color:#444;
}

/* Buttons */

.btn{
    display:inline-block;
    padding:14px 28px;
    margin:8px;
    border-radius:8px;
    text-decoration:none;
    font-size:17px;
    font-weight:bold;
    transition:.3s;
}

.home{
    background:#ff5a00;
    color:white;
}

.home:hover{
    background:#e64a00;
}

.restaurant{
    background:#28a745;
    color:white;
}

.restaurant:hover{
    background:#218838;
}

</style>

</head>

<body>

<div class="container">

    <div class="tick">
        ✓
    </div>

    <h1>Order Confirmed!</h1>

    <p>
        Thank you for ordering with <b>CraveNest</b>.<br>
        Your delicious meal is being prepared and will be delivered shortly.
    </p>

    <div class="order-box">

        <p><b>Order Status :</b> Confirmed</p>

        <p><b>Estimated Delivery :</b> 25 - 35 Minutes</p>

        <p><b>Payment :</b> Successful</p>

    </div>

    <a href="callRestaurantServlet" class="btn restaurant">
        Order Again
    </a>

    <a href="login.html" class="btn home">
        Back to Home
    </a>

</div>

</body>
</html>