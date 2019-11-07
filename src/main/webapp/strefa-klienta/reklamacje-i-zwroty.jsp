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
                <a class="nav-link" href="strefa-klienta.jsp">Strefa klienta</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Reklamacje i zwroty</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p style="font-size: 30px; padding-bottom: 20px">Reklamacje i zwroty</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 22px; padding-bottom: 10px"><strong>ZWROT</strong></p>

            <p style="font-size: 18px; padding-bottom: 5px"><strong>W JAKI SPOSÓB MOGĘ ZWRÓCIĆ ZAKUPIONY TOWAR?</strong>
            </p>

            <p style="font-size: 14px; padding-bottom: 5px">Okazało się, że zakupiony towar nie spełnia Twoich oczekiwań
                (nie odpowiada rozmiarem, jest nietrafionym prezentem albo po prostu nie podoba Ci się)?

                Zastosuj tych kilka prostych kroków, które w szybki sposób pomogą Ci zwrócić towar:</p>

            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 1
                <br><br>
                ZAPOZNAJ SIĘ Z NASZYM REGULAMINEM.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">Na stronie ski4humans.pl, w zakładce „regulamin sklepu”
                znajdziesz szczegółowe informacje dotyczące odstąpienia od umowy <a href="../onas/regulamin-sklepu.jsp">KLIKNIJ</a>
            </p>

            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 2
                <br><br>
                POINFORMUJ NAS O ODSTĄPIENIU OD UMOWY.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">Od umowy możesz odstąpić w ciągu 14 dni od momentu
                otrzymania produktu, bez podawania jakiejkolwiek
                przyczyny.
                <br><br>
                Dla celów dowodowych najlepiej wykonać to na piśmie np. wysyłając wiadomość mailową na adres:
                info@ski4humans.pl<br>
                - jednocześnie informujemy, że jest to wyłącznie procedura ułatwiająca, która nie ogranicza prawa
                ustawowego konsumenta przedstawionego w regulaminie.
                <br><br>
                Oświadczenie możesz sformułować samodzielnie lub skorzystać z gotowego formularza (protokół jest
                dołączany do paczki lub można go pobrać z zakładki „reklamacje i zwroty” na naszej stronie:
                ski4humans.pl).</p>

            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 3

                PRZYGOTUJ I WYŚLIJ PACZKĘ.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">
                Spakuj produkt, a następnie wyślij go dowolnym przekaźnikiem (nie później niż 14 dni od dnia, w którym
                poinformowali nas Państwo o odstąpieniu od niniejszej umowy) na adres naszego magazynu:
                <br><br>
                SKI4HUMANS
                <br><br>
                ul. XYZ 00
                <br><br>
                xx – xxx XYZ
                <br><br>
                Termin jest zachowany jeżeli odeślesz rzecz przed upływem terminu 14 dni.
            </p>
            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 4

                OCZEKUJ NA ZWROT ŚRODKÓW.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">
                Wszystkie otrzymane płatności, w tym koszty dostarczenia rzeczy (z wyjątkiem dodatkowych kosztów
                wynikających z wybranego przez Państwa sposobu dostarczenia innego niż najtańszy zwykły sposób
                dostarczenia oferowany przez nas) nie później niż 14 dni od dnia, w którym zostaliśmy poinformowani o
                Państwa decyzji o wykonaniu prawa odstąpienia od niniejszej umowy.
                <br><br>
                Zapłaconą przez Ciebie kwotę zwrócimy na wskazany numer konta lub w inny, odpowiedni dla Ciebie sposób.
                <br><br>
                W każdym przypadku nie poniosą Państwo żadnych opłat z związku z tym zwrotem. Informujemy również, że
                możemy wstrzymać się ze zwrotem płatności do czasu otrzymania rzeczy lub do czasu dostarczenia nam
                dowodu jej odesłania, w zależności od tego, które zdarzenie nastąpi wcześniej.
                <br><br>
                Odpowiadasz tylko za zmniejszenie wartości rzeczy wynikające z korzystania z niej w sposób inny niż było
                to konieczne do stwierdzenia charakteru, cech i funkcjonowania rzeczy.
            </p>
            <hr style="height:0;border:none;border-top:1px solid #000;">

            <p style="font-size: 18px; padding-bottom: 5px"><strong>WYMIANA</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">Zakupiony produkt okazał się za mały albo za duży i
                chciałbyś go wymienić?
                <br><br>
                Dołożymy wszelkich starań żebyś jak najszybciej otrzymał swój wymarzony sprzęt. Co należy zrobić:</p>

            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 1
                <br><br>
                SPRAWDŹ CZY WYBRANY PRZEZ CIEBIE ROZMIAR JEST DOSTĘPNY NA STRONIE I ZŁÓŻ NOWE ZAMÓWIENIE.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">Poinformuj nas w dowolny sposób, że będzie to wymiana
                (bezpośrednio w zamówieniu – dodaj komentarz „WYMIANA”).
                <br><br>
                Jeżeli produkt, który Cię interesuje występuje wyłącznie w jednym rozmiarze, chętnie pomożemy Ci znaleźć
                nowy model, odpowiadający Twoim wymaganiom.</p>

            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 2
                <br><br>
                POINFORMUJ NAS MAILOWO O ODSTĄPIENIU OD UMOWY.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">Od umowy możesz odstąpić w ciągu 14 dni od momentu
                otrzymania produktu, bez podawania jakiejkolwiek przyczyny.
                <br><br>
                Dla celów dowodowych najlepiej wykonać to na piśmie np. wysyłając wiadomość mailową na adres:
                info@ski4humans.pl
                <br><br>
                Jednocześnie informujemy, że jest to wyłącznie procedura ułatwiająca, która nie ogranicza prawa
                ustawowego konsumenta przedstawionego w regulaminie..
                <br><br>
                Oświadczenie możesz sformułować samodzielnie lub skorzystać z gotowego formularza (protokół jest
                dołączany do paczki lub można go pobrać z zakładki „reklamacje i zwroty” na naszej stronie:
                ski4humans.pl).
            </p>
            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 3
                <br><br>
                PRZYGOTUJ I WYŚLIJ PACZKĘ.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">Spakuj produkt, a następnie wyślij go dowolnym przekaźnikiem
                na adres naszego magazynu:
                <br><br>
                SKI4HUMANS
                <br><br>
                ul. XYZ 00
                <br><br>
                xx – xxx XYZ
                <br><br>
            </p>
            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 4
                <br><br>
                OCZEKUJ WIADOMOŚCI MAILOWEJ.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">
                Zostaniesz poinformowany o realizacji nowego zamówienia.
                <br><br>
                Będzie to oznaczało, że Twój zwrot już do nas dotarł i wysyłamy do Ciebie nową paczkę.
            </p>

            <hr style="height:0;border:none;border-top:1px solid #000;">

            <p style="font-size: 26px; padding-bottom: 5px"><strong>REKLAMACJA SPRZĘTU</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">
                Jeżeli uważasz, że zakupiony towar w jakikolwiek sposób jest niezgodny z zawartą umową, postępuj zgodnie
                z naszą instrukcją:</p>

            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 1
                <br><br>
                ZGŁOŚ REKLAMACJĘ TOWARU.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">
                Możesz zrobić to w dowolnej formie, ale dla celów dowodowych najbezpieczniej zrobić to pisemnie.
                <br><br>
                Wyślij nam maila na adres: info@ski4humans.pl. Precyzyjne opisanie wady i określenie twoich żądań ułatwi
                nam rozpatrzenie wady.
                <br><br>
                Możesz także skorzystać z gotowego formularza, który jest do pobrania na naszej stronie ski4humans.pl w
                zakładce „reklamacje i zwroty”.
                <br><br>
                Paragon fiskalny nie jest konieczny do zareklamowania produktu, jednak znacznie ułatwi złożenie
                reklamacji.
            </p>
            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 2
                <br><br>
                PRZYGOTUJ I WYŚLIJ PACZKĘ.</strong></p>

            <p style="font-size: 14px; padding-bottom: 5px">
                Spakuj produkt, a następnie wyślij go dowolnym przekaźnikiem na adres naszego magazynu:
                <br><br>
                SKI4HUMANS
                <br><br>
                ul. XYZ 00
                <br><br>
                xx – xxx XYZ
                <br><br>
            </p>
            <p style="font-size: 18px; padding-bottom: 5px"><strong>KROK 3
                <br><br>
                OCZEKUJ NA INFORMACJĘ O ROZPATRZENIU REKLAMACJI.</strong></p>
            <p style="font-size: 14px; padding-bottom: 5px">
                W ciągu 14 dni od otrzymania zwrotu, przedstawimy Ci decyzję dotyczącą rozpatrzenia reklamacji.
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