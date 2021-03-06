<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Web for training">
    <meta name="author" content="DB">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Ski4Humans - Home Page - WELCOME</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <div class="marginLeft40">
        <div class="firstMessage">
            <p class="pTitle fontSize25">SKLEP NARCIARSKI SKI4HUMANS.PL - Część dla administratora
                strony</p>
            <p class="indexFirstMessage1">
                Administrator strony posiada możliwość dodawania/ usuwania oraz modyfikowania istniejących jej
                elementów.</p>
            <p class="indexFirstMessage1">Elementy, które można edytować/ dodawać to:</p>
            <b class="fontSize20">Główne:</b>
            <ul class="fontSize14">
                <li>narty</li>
                <li>buty narciarskie</li>
                <li>kije narciarskie</li>
                <li>kaski narciarskie</li>
                <li>gogle narciarskie</li>
                <li>rekawice narciarskie</li>
                <li>odzież termoaktywna</li>
            </ul>
            <b class="fontSize20">Inne informacje:</b>
            <ul class="fontSize14">
                <li>użytkownicy</li>
                <li>kategorie</li>
                <li>klienci</li>
                <li>recenzje</li>
                <li>zamówienia</li>
            </ul>
        </div>
    </div>

    <footer class="footerFreeSpace30px">
        <jsp:include page="footer.jsp"/>
    </footer>
</div>


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
</body>
</html>