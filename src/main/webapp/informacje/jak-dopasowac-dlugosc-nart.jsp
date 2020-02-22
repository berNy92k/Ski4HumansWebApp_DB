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
                <a class="nav-link" href="jak-dopasowac-dlugosc-nart.jsp">JAK DOPASOWAĆ DŁUGOŚĆ NART?</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p class="fontSize30PaddingBottom20">JAK DOPASOWAĆ DŁUGOŚĆ NART?</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <p class="fontSize14">
                Narciarstwo alpejskie to dyscyplina sportowa, w której właściwe dopasowanie sprzętu stanowi
                najważniejszy element w przygotowaniach do jazdy. Jego prawidłowy dobór ma wpływ przede wszystkim na
                bezpieczeństwo narciarza – zmniejsza ryzyko wszelkich kontuzji, a nawet groźnych wypadków. Poza tym
                umożliwia komfortową jazdę, która z kolei zachęca do tego, aby dalej doskonalić swoją technikę. Sprzęt
                narciarski musi być dobrany do umiejętności narciarza, osobistych preferencji (stylu i miejsca jazdy)
                oraz warunków panujących na stoku.</p>
        </div>

        <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
        <div>
            <p class="fontSize24PaddingBottom20">JAKĄ DŁUGOŚĆ NART WYBRAĆ?</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14">
                <li>
                    Narty dla początkujących i średniozaawansowanych (czyli głównie allround i allmountain) dobiera się
                    nawet 20 - 15 cm krótsze od wzrostu, co może być sporym zaskoczeniem dla narciarzy, którzy byli
                    przyzwyczajeni do „starej szkoły” i jak najdłuższych desek. Wpływ na to ma mocne taliowanie oraz
                    fakt, że na nartach krótszych jeździ się po prostu łatwiej (kliknij żeby zobaczyć modele allround z
                    naszej oferty).
                </li>
                <li>
                    Kobiety powinny wybierać narty o długości do brody (ok 20 cm krótsze), natomiast mężczyźni o
                    długości do nosa (średnio 15 cm krótsze).
                </li>
                <li>
                    Odstępstwo od takiego doboru nart następuje, gdy narciarz wykazuje się zaawansowanymi
                    umiejętnościami, posiada większą masę lub preferuje szybką jazdę. Wówczas, do wyżej wspomnianej
                    długości należy dodać jeszcze 5 cm.
                </li>
                <li>
                    W przypadku gdy narciarz wykazuje się małymi umiejętnościami, niską wagą, bądź jeździ wyłącznie po
                    krótkich stokach – zamiast dodawać, odejmujemy 5 cm.
                </li>
                <li>
                    W nartach typu Race inaczej dobiera się długość do slalomówek, a inaczej do gigantek. Narty
                    slalomowepowinny dosięgać do brody, chyba że narciarz posiada wysoką wagę – wówczas warto wybrać
                    trochę dłuższy model. Narty gigantowe dobieramy natomiast do wzrostu, albo 5 cm dłuższe (przy
                    większej wadze). Pamiętaj, że gigantki służą do dużych prędkości, więc większa długość zapewni
                    lepszą stabilność (kliknij żeby zobaczyć modele race z naszej oferty).
                </li>
            </ul>
            <br>
        </div>
        <br>
        <div>
            <p class="fontSize24PaddingBottom20">PAMIĘTAJ!</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <p class="fontSize14">
                Jeżeli masz jakiekolwiek wątpliwości podczas wyboru nart albo czujesz się niekomfortowo na wybranym
                przez siebie modelu - nie bój się pytać. Doradcy naszych w sklepach (zarówno stacjonarnym, jak i
                internetowym) posiadają wiedzę, która pomoże Ci w doborze właściwego dla siebie sprzętu
                <a href="../onas/kontakt.jsp">(kliknij)</a>
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