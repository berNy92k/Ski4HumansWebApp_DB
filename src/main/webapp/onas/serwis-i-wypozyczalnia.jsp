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
                <a class="nav-link" href="o-nas.jsp">O nas</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Serwis i wypożyczalnia</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p class="fontSize30PaddingBottom20">Serwis i wypożyczalnia</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <p class="fontSize35PaddingBottom20">SERWIS NARCIARSKO - SNOWBOARDOWY</p>
            <p class="fontSize12">
                Zachęcamy do skorzystania z naszych usług serwisowych! Przygotujemy Twój sprzęt do zbliżającego się
                sezonu, a także przeprowadzimy konserwację po zimie.<br>
                W serwisie świadczymy następujące usługi:<br>
                - montaż wiązań narciarskich oraz snowboardowych (z oryginalnych szablonów),<br>
                - ustawianie siły wypięcia wiązań,<br>
                - ostrzenie nart i snowboardów na profesjonalnych szwajcarskich maszynach,<br>
                - smarowanie nart i snowboardów,<br>
                - montaż klamer do butów,<br>
                - skracanie kijków.</p>
        </div>
        <br>
        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
        <br>
        <div>
            <p class="fontSize30PaddingBottom20">CENNIK:</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14">
                <li>Podstawa – ostrzenie krawędzi z planowaniem ślizgów, smarowanie na gorąco - 50 zł</li>
                <li>Fullserwis – ostrzenie krawędzi z planowaniem ślizgów, uzupełnianie ubytków, smarowanie na gorąco -
                    70–100 zł
                </li>
                <li>Ustawienie wiązań pod but - 10zł</li>
                <li>Express-serwis, czyli narty na dzisiaj! (w miarę możliwości przerobowych serwisu) - cena podst. + 50
                    %
                </li>
                <li>Smarowanie snowboardu - 20 zł</li>
                <li>Montaż wiązań - 20–40 zł</li>
                <li>Smarowanie nart - 10 zł</li>
                <li>Klejenie rozwarstwień i wklejki- 20 zł</li>
                <li>Ustawienie siły wypięcia wiązań - gratis</li>
            </ul>
            <p class="fontSize30PaddingBottom20">WYPOŻYCZALNIA</p>
            <p class="fontSize12">
                Chciałbyś spróbować swoich sił na stoku ale nie posiadasz własnych nart lub deski? W naszej wypożyczalni
                znajdziesz sprzęt narciarski i snowboardowy, który zapewni Ci najwyższy komfort użytkowania.<br>
                Nasi doradcy udzielą Ci profesjonalnej pomocy i dobiorą sprzęt odpowiadający Twoim umiejętnościom (bez
                względu na to czy jesteś osobą początkującą czy zaawansowaną).<br>
                Dysponujemy dużym wyborem rozmiarów i modeli, zarówno dla dorosłych jak i dzieci.</p>
        </div>
        <br>
        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
        <br>
        <div>
            <p class="fontSize30PaddingBottom20">CENNIK (ZA DOBĘ):</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14 padding15">
                <li>Komplet: narty carvingowe, buty, kijki – 35 zł</li>
                <li>Komplet: deska snowboardowa, buty – 35 zł</li>
                <li>Narty carvingowe – 25 zł</li>
                <li>Buty narciarskie – 10 zł</li>
                <li>Kijki – 5 zł</li>
                <li>Kask – 10 zł</li>
                <li>Deska snowboardowa – 25 zł</li>
                <li>Buty snowboardowe – 10 zł</li>
                <li>Komplet juniorski narciarski (do 135 cm) – 25 zł</li>
                <li>Komplet juniorski snowboardowy (do 130 cm) – 25 zł</li>
                <li>Narty juniorskie – 15 zł</li>
                <li>Deski juniorskie – 15 zł</li>
                <li>Nie liczymy dnia wypożyczenia, ani dnia oddania!</li>
                <li>Przy terminie dłuższym niż 5 dni – 10% rabatu</li>
                <li>Wypożyczenia sprzętu na dłuższe terminy – w cenie do uzgodnienia</li>
            </ul>
            <p class="fontSize12">
                Potrzebujesz więcej informacji? Zadzwoń: xx xxx xx xx
            </p>
        </div>
    </div>

    <footer class="footerFreeSpace30px">
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