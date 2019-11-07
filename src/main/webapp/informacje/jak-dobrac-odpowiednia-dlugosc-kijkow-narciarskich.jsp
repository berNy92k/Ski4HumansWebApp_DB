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
    <div style="padding-bottom: 20px">
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link active" href="../homepage/index.jsp">Strona główna</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="informacje.jsp">Informacje</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="jak-dobrac-odpowiednia-dlugosc-kijkow-narciarskich.jsp">JAK DOBRAĆ ODPOWIEDNIĄ
                    DŁUGOŚĆ KIJKÓW NARCIARSKICH?</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p style="font-size: 30px; padding-bottom: 20px">JAK DOBRAĆ ODPOWIEDNIĄ DŁUGOŚĆ KIJKÓW NARCIARSKICH?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Kije narciarskie to bardzo ważny (aczkolwiek bagatelizowany) element sprzętu narciarskiego, którego brak
                powoduje złe nawyki podczas jazdy. Kijki służą przede wszystkim do zachowania równowagi oraz
                utrzymywania właściwej postawy - dzięki nim automatycznie prostujemy plecy, a ręce trzymamy bliżej
                ciała. Są również niezastąpioną pomocą na płaskich powierzchniach, gdzie umożliwiają odpychanie.</p>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">CZY DŁUGOŚĆ KIJÓW JEST AŻ TAK WAŻNA?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Za krótkie kije sprawiają, że (podczas skręcania) niepotrzebnie schylamy się i kierujemy tułów do
                przodu. Z kolei zbyt długie są odpowiedzialne za nadmierne prostowanie się i odchylanie do tyłu – w ten
                sposób narciarz próbuje kompensować ich długość. Tylko właściwie dopasowana długość kijów zagwarantuje
                zrównoważoną pozycję.</p>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">W JAKI SPOSÓB DOBRAĆ WŁAŚCIWĄ DŁUGOŚĆ KIJKÓW
                NARCIARSKICH?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <ul style="font-size: 14px">
                <li>
                    Obróć kijek tak aby jego rączka opierała się o ziemię. Następnie stań prosto i chwyć go bezpośrednio
                    pod talerzykiem. Jeżeli przedramię z ramieniem (trzymanym równolegle do ciała) utworzyły kąt prosty,
                    to znaczy, że długość kijka jest odpowiednia.
                </li>
                <li>
                    Jeżeli planujesz zakup przez internet, zalecamy następującą metodę obliczania długości: wzrost
                    należy pomnożyć przez 0,7 i wynik zaokrąglić do pełnych 5 cm (np. 163 cm x 0,7 = 114 cm, czyli
                    właściwa długość kijka to 115 cm).
                </li>
            </ul>
        </div>
    </div>

    <footer>
        <div style="height: 30px"></div>
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