<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Web for training">
    <meta name="author" content="DB">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Ski4Humans - home page - WELCOME</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>
<header>
    <jsp:include page="../homepage/header.jsp"/>
</header>

<div class="container">
    <div class="paddingBottom20">
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link active" href="../homepage/index.jsp">Strona główna</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="strefa-klienta.jsp">Strefa klienta</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Odbiór osobisty</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p class="fontSize30PaddingBottom20">Odbiór osobisty</p>
        </div>
        <div>
            <p class="fontSize45PaddingBottom20">ODBIÓR OSOBISTY DLA KLIENTÓW Z XYZ I OKOLIC:</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14">
                <li>Zapraszamy do naszej siedziby biura i magazynu sklepu internetowego ski4humans.pl w XYZ:
                    <br><br>
                    ul. XYZ 00
                    <br><br>
                    00-000 XYZ
                    <br><br>
                    w następnym dniu roboczym po złożeniu zamówienia (jest to czas potrzebny na skompletowanie i
                    przygotowanie sprzętu).
                </li>
                <br>
                <li> Akceptujemy płatność gotówką oraz kartą płatniczą.
                </li>
                <br>
                <li>Godziny pracy:
                    <br><br>
                    pon - pt: 8:00 - 15:30
                    <br><br>
                    sobota: nieczynne
                    <br><br>
                    niedziela: nieczynne
                </li>
                <br>
                <li>W razie pytań prosimy o kontakt pod numerem +48 000 000 000</li>
            </ul>
        </div>
    </div>

    <footer class="footerFreeSpace30px30px">
        <jsp:include page="../homepage/footer.jsp"/>
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