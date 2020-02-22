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
                <a class="nav-link" href="informacje.jsp">Informacje</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="w-jaki-sposob-dobrac-buty-narciarskie.jsp">W JAKI SPOSÓB DOBRAĆ BUTY
                    NARCIARSKIE?</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p class="fontSize30PaddingBottom20">W JAKI SPOSÓB DOBRAĆ BUTY NARCIARSKIE?</p>
        </div>
        <div>
            <p class="fontSize24PaddingBottom20">JAK PRAWIDŁOWO ZMIERZYĆ STOPĘ?</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14">
                <li>
                    Czystą kartkę papieru połóż na podłodze i postaw na niej stopę.
                </li>
                <li>
                    Zaznacz długopisem koniuszek dużego palca oraz koniec pięty.
                </li>
                <li>
                    Zmierz w centymetrach odległość między zaznaczonymi punktami.
                </li>
            </ul>
            <p class="fontSize14">
                Szukając butów do jazdy rekreacyjnej zalecamy dodać 0.5-1.0 cm do długości zmierzonej stopy. W przypadku
                jazdy sportowej nie dodajemy już dodatkowych centymetrów, a tym samym uzyskujemy bardziej precyzyjny
                przekaz siły na narty - jednocześnie zgadzając się na utratę komfortu w bucie narciarskim.</p>
        </div>

        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
        <div>
            <p class="fontSize24PaddingBottom20">JAK DOBRAĆ ROZMIAR BUTÓW NARCIARSKICH?</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <p class="fontSize14">
                Na dole strony znajduje się tabelki przykładowa tabelka, gdzie rozmiary odpowiadają zmierzonej długości
                stopy w centymetrach (oznaczone są jako Mondo Point).</p>
        </div>

        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
        <div>
            <p class="fontSize24PaddingBottom20">CO JESZCZE WARTO UWZGLĘDNIĆ PRZY WYBORZE BUTÓW
                NARCIARSKICH?</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">

            <p class="fontSize14">
                Szerokość</p>
            <p class="fontSize14">
                Buty narciarskie powinny być również dopasowane pod względem szerokości, która odpowiada szerokości
                stopy w okolicach kości śródstopia (najczęściej ten współczynnik jest podany dla rozmiaru stopy 27,5
                cm).
            </p>
            <p class="fontSize14">Buty należy dopasować pod kątem wygody i charakteru jazdy:</p>
        </div>

        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14">
                <li>
                    Buty do jazdy sportowej: poniżej 98 mm
                </li>
                <li>
                    Buty dopasowane: 98-100 mm (do jazdy przy większych prędkościach lub dla osób z wąskimi stopami)
                </li>
                <li>
                    Standardowe dopasowanie: 100 – 104 mm (więcej komfortu kosztem utraty precyzji)
                </li>
                <li>
                    Bardzo szerokie: 104 mm – wzwyż (buty dla początkujących oraz osób z szerokimi stopami i łydkami)
                </li>
            </ul>
            <br>
            <p class="fontSize14">
                Flex
            </p>
            <p class="fontSize14">
                Podczas wyboru butów narciarskich należy także kierować się flexem, czyli sztywnością buta. Wybór
                właściwego flexu jest zależny od następujących czynników: umiejętności, predyspozycji fizycznych oraz
                wagi. Osoby posiadające bardziej zaawansowane umiejętności w jeździe oraz charakteryzujące się większą
                wagą powinny wybrać buty sztywniejsze. Ze względu na umiejętności, zaleca się następujący dobór flexu:
            </p>
        </div>

        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14">
                <li>
                    Początkujący: 40 – 70
                </li>
                <li>
                    Średniozaawansowani: 60 – 90
                </li>
                <li>
                    Zaawansowani: 90 – wzwyż
                </li>
            </ul>
            <p class="fontSize14">
                Jeżeli mierzysz buty w domu pamiętaj, żeby dokładnie spiąć klamry i przyjąć pozycję narciarską – kolana
                powinny być lekko ugięte (w taki sposób, aby znajdowały się w pionowej linii z palcami stóp), a golenie
                oparte o języki butów.<br>
                Palce nie mogą zbyt mocno naciskać na przód wkładki.
            </p>
        </div>
        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
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