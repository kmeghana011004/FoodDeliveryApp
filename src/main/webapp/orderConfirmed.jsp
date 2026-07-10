<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Order Confirmed | QuickBite</title>

<style>

body{
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    background:#f6f7fb;
    padding:20px;
}

.container{
    width:100%;
    max-width:460px;
    background:#fff;
    padding:35px 30px;
    border-radius:20px;
    text-align:center;
    box-shadow:0 15px 35px rgba(0,0,0,.12);
}

.tick{
    width:80px;
    height:80px;
    margin:auto;
    border-radius:50%;
    background:#28a745;
    color:#fff;
    display:flex;
    justify-content:center;
    align-items:center;
    font-size:42px;
    font-weight:bold;
    box-shadow:0 8px 20px rgba(40,167,69,.3);
}

h1{
    margin:20px 0 10px;
    font-size:30px;
    color:#28a745;
}

p{
    color:#666;
    font-size:15px;
    line-height:24px;
}

.order-box{
    margin:25px 0;
    padding:18px;
    background:#fafafa;
    border:1px solid #ececec;
    border-radius:12px;
}

.order-box p{
    margin:10px 0;
    font-size:15px;
    display:flex;
    justify-content:space-between;
}

.btn{
    display:inline-block;
    padding:12px 24px;
    margin:8px 5px 0;
    border-radius:30px;
    text-decoration:none;
    font-size:15px;
    font-weight:600;
    transition:.3s;
}

.restaurant{
    background:#ff5a3c;
    color:#fff;
}

.restaurant:hover{
    background:#e84a2d;
}

.home{
    border:2px solid #28a745;
    color:#28a745;
    background:#fff;
}

.home:hover{
    background:#28a745;
    color:#fff;
}

@media(max-width:500px){

.container{
    max-width:100%;
    padding:30px 20px;
}

.btn{
    width:100%;
    margin-top:10px;
}

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

    
    <a href="OrderHistoryServlet" class="btn home">My Orders</a>

</div>

</body>
</html>