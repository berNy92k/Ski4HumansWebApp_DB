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
                <a class="nav-link" href="#">FAQ</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p style="font-size: 30px; padding-bottom: 20px">FAQ</p>
        </div>
        <div>
            <p style="font-size: 25px; padding-bottom: 20px">SKĄD MAM WIEDZIEĆ, ŻE SKLEP SKI4HUMANS.PL JEST
                WIARYGODNY?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Jesteśmy legalną firmą i sprzedajemy sprzęt sportowy już od wielu lat. Naszą działalność na polskim
                rynku rozpoczęliśmy w 1997 roku. Przez kilka ostatnich lat konsekwentnie budowaliśmy pozycję silnego
                dystrybutora nart i snowboardu w kraju. Oferta naszego sklepu obejmuje szeroki asortyment desek, butów,
                wiązań oraz różnych akcesoriów i sprzętu zimowego. Sprowadzamy tylko oryginalny i nowy towar. Oferujemy
                klientom towar stockowy - pełnowartościowe narty, deski itp. z poprzednich sezonów. Co najważniejsze -
                wszystkie produkty, które oferujemy w naszych sklepach mamy w naszym magazynie. Wysyłka odbywa się z
                naszego działu dystrybucji. W 2006 roku uruchomiliśmy nasz pierwszy sklep internetowy www.ski4humans.pl,
                zdobywając kilkanaście tysięcy zadowolonych klientów i rozszerzając obszar działania. Później przyszła
                kolej na sklep www.snowboard4humans.pl. Dbamy, aby oferowany przez nas towar - narty i deski
                snowboardowe znanych marek - był najwyższej jakości i spełniał wysokie wymagania klientów. Dzięki
                zaangażowaniu naszych pracowników - fachowców, którzy chętnie udzielają cennych porad, zakupy w naszych
                e-sklepach są czystą przyjemnością.</p>
        </div>
        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 25px; padding-bottom: 20px">JAK WYSZUKAĆ INTERESUJĄCY MNIE PRODUKT?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Zespół naszych pracowników dokłada wszelkich starań, by zakupy dokonane w naszym sklepie były
                bezpieczne. Zachowujemy wszelkie procedury używane standardowo w innych sklepach internetowych.
                Stosujemy protokół SSL (Secure Socket Layer), który sprawia, że informacje bankowe wprowadzane przy
                zamówieniu są szyfrowane. Możesz być spokojny. Wszelkie podawane przez Ciebie dane podlegają naszej
                polityce prywatności.<br>
                Jeśli masz jakiekolwiek wątpliwości, zadzwoń do nas lub napisz. Jesteśmy do Twojej dyspozycji i chętnie
                odpowiemy na wszelkie pytania.</p>
        </div>
        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 25px; padding-bottom: 20px">CZY ZAKUPY W SKI4HUMANS.PL SĄ BEZPIECZNE?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Jeśli wiesz, jakie narty, buty czy inne chcesz kupić, wpisz model w wyszukiwarkę w górnej prawej części
                strony. Jeśli szukasz produktu pasującego do Ciebie, możesz skorzystać z menu górnego i wyszukać produkt
                w poszczególnych kategoriach. Innym rozwiązaniem jest skorzystanie z filtrów po lewej stronie.
                Wystarczy, że klikniesz np. Narty Męskie, a dalej wyfiltrujesz, jaka cena i inne kryteria Cię
                interesują.</p>
        </div>
        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 25px; padding-bottom: 20px">JAK MAM SIĘ ZALOGOWAĆ DO SKI4HUMANS.PL?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Zakupy w ski4humans.pl mają być szybkie i łatwe. Możesz się zalogować, tworząc swoje konto lub dokonać
                zakupów bez logowania. Założenie konta w ski4humans.pl nie jest obowiązkowe. Zachęcamy jednak do
                rejestracji
                i posiadania własnego konta. Dzięki temu przy kolejnych zakupach, będziesz mógł szybciej zamawiać
                produkty z naszej oferty, bez powtórnego uzupełniania danych teleadresowych, możesz na bieżąco
                monitorować status złożonych zamówień, przeglądać historię swoich zakupów, dokonywać zmian danych
                osobowych, zmieniać hasło dostępu, mieć swoje stałe adresy do wysyłek (przydatne, gdy dokonujesz
                zamówień na adres służbowy, a czasem na domowy lub gdy robisz prezent dla kogoś z rodziny lub
                znajomych). Posiadając konto w ski4humans.pl, możesz też zapisać swoje ulubione produkty do SCHOWKA.
                Założenie konta zajmie Ci mniej niż 2 minuty. Nie musisz pamiętać loginu, bo jest nim Twój adres e-mail,
                a gdybyś zapomniał hasła, które zdefiniowałeś, możemy Ci je szybko przypomnieć. Możesz też bez problemu
                zalogować się przez swoje konto na Facebooku.</p>
        </div>
        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 25px; padding-bottom: 20px">JAK MOGĘ ZŁOŻYĆ ZAMÓWIENIE?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Jeśli znalazłeś interesujący Cię produkt, kliknij przycisk DODAJ DO KOSZYKA – znajdujący się na stronie
                konkretnego produktu. Zobaczysz informację ZAKTUALIZOWANO PRZEDMIOTY W KOSZYKU. Możesz teraz kontynuować
                zakupy i wyszukiwać kolejne produkty lub przejść do Złożenia zamówienia. Możesz w każdej chwili
                modyfikować swój koszyk – usuwać produkty, zmieniać ich rozmiar i ilość. Na górnym pasku strony widzisz
                zawsze, ile masz produktów w koszyku, a gdy najedziesz kursorem na ikonkę koszyka, rozwinie się jego
                szybki podgląd. Wystarczy, że klikniesz POKAŻ KOSZYK, a przeniesiony zostaniesz do pełnej listy
                produktów w koszyku. Jeśli chcesz kontynuować zakupy, zawsze możesz kliknąć na KONTYNUUJ ZAKUPY.</p>
        </div>
        <hr style="height:0;border:none;border-top:1px solid #000;">
        <br>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Kiedy już skończyłeś dodawanie produktów do koszyka i chcesz dokończyć proces zakupów, kliknij na
                przycisk PRZEJDŹ DO KASY. Najpierw poprosimy Cię o podanie danych adresowych. Tutaj możesz też
                zadecydować, czy chcesz podać inny adres wysyłki i czy życzysz sobie fakturę VAT. Następnie wybierz
                warunki dostawy - Kurier GLS (1 dzień roboczy) lub odbiór osobisty. Wybierz też odpowiednią dla Ciebie
                metodę płatności – płatność za pobraniem, zwykły przelew lub płatność z Twojego banku online przez
                dotpay.</p>
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