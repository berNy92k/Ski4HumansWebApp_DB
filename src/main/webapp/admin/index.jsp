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

    <title>Ski4Humans - home page - WELCOME</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <div>
        <div class="firstMessage">
            <p class="pTitle" style="font-size: 25px">SKLEP NARCIARSKI SKI4HUMANS.PL - NAJLEPSZY SPRZĘT DLA
                NARCIARZY</p>
            <p style="font-size: 14px;text-align: justify">Sklep Ski24 to ponad 20 lat doświadczeń związanych ze
                sprzedażą sprzętu zimowego.
                Dzięki ogromnej wiedzy,
                pasji i determinacji z sukcesem budujemy pozycję lidera sprzedaży nart i sprzętu narciarskiego on-line w
                Polsce. Każdego roku zdobywamy kolejne tysiące zadowolonych klientów. Jako pierwszy sklep narciarski w
                Polsce rozpoczęliśmy sprzedaż nart carvingowych. Już od 1997 roku głęboko wierzyliśmy, że nie jest to
                jedynie tymczasowa moda, ale przyszłość, dlatego rozpoczęliśmy szeroką edukację polskich narciarzy,
                czego
                efekty widać gołym okiem.

                Nasz sklep narciarski oferuje Państwu narty najlepszych producentów, wysokiej jakości buty narciarskie,
                niezawodne i bezpieczne kaski, a także gogle i wiele innych akcesoriów niezbędnych na stoku. Znane marki
                to
                nasza mocna strona: Atomic, Head, Volkl, Dynastar, Rossignol, Salomon, Dalbello, Elan, Blizzard, Uvex,
                Komperdell, Nordica, Dragon, to tylko niektóre z brandów, które znajdziesz w ofercie naszego sklepu.</p>
        </div>
    </div>

    <footer>
        <div style="height: 30px"></div>
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