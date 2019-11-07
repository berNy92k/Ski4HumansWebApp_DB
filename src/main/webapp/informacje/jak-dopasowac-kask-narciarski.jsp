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
                <a class="nav-link" href="jak-dopasowac-kask-narciarski.jsp">JAK DOPASOWAĆ KASK NARCIARSKI?</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p style="font-size: 30px; padding-bottom: 20px">JAK DOPASOWAĆ KASK NARCIARSKI?</p>
        </div>
        <div>
            <p style="font-size:24px; padding-bottom: 20px">ŻEBY KASK WŁAŚCIWIE SPEŁNIAŁ SWOJE ZADANIE, CZYLI ZAPEWNIAŁ
                BEZPIECZEŃSTWO, MUSI BYĆ ODPOWIEDNIO DOBRANY – NIE MOŻE BYĆ ZA CIASNY, ANI TYM BARDZIEJ ZBYT LUŹNY.</p>
        </div>
        <div>
            <p style="font-size:24px; padding-bottom: 25px">ZMIERZ OBWÓD GŁOWY</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <ul style="font-size: 14px">
                <li>
                    Pomiaru najlepiej dokonać za pomocą metra krawieckiego, około 1 cm nad linią brwi. Otrzymany wynik
                    przekłada się na rozmiar kasku danego producenta np. S(55-56) – przykładowa tabelka znajduje się na
                    dole strony.
                </li>
                <li>
                    W celu uzyskania większego komfortu, zalecamy wybrać rozmiar kasku, który będzie o 1 cm większy od
                    zmierzonego obwodu. W przypadku gdy pomiar wskazuje np. 56.4 cm, najlepszym rozwiązaniem będzie
                    zamówienie kasku z przedziału M czyli 57-58 cm.
                </li>
            </ul>
        </div>
        <br> <br>
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">MIERZENIE KASKU W DOMU</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <ul style="font-size: 14px">
                <li>
                    Załóż kask i zapnij pasek pod brodą, następnie poruszaj głową na boki, w przód oraz w tył.
                </li>
                <li>
                    Pasek nie powinien uciskać, a kask musi dobrze przylegać – nie może opadać na czoło, ani na kark, a
                    także nie może nadmiernie uciskać, powodując ból.
                </li>
            </ul>
        </div>
        <br> <br>
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">DOPASOWANIE DO GOGLI</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                W doborze kasku ważnym elementem jest także jego kompatybilność z goglami. Między kaskiem a goglami
                powinna być tylko niewielka szczelina, dzięki czemu narciarz będzie chroniony przed mrozem i
                wiatrem.
                Szerokość paska gogli powinna być dopasowana do szerokości zapięcia, który znajduje się w tylnej
                części kasku. Wówczas gogle są właściwie trzymane.
            </p>
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