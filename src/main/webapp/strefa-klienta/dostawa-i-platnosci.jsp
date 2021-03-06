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
                <a class="nav-link" href="#">Dostawa i płatności</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p class="fontSize30PaddingBottom20">Dostawa i płatności</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <p class="fontSize18">SPOSOBY WYSYŁKI, FORMY TRANSPORTU - ZASADY WYSYŁKI ZAMÓWIONEGO TOWARU</p>
            <hr class="lineHeight0BorderNoneBorderTop1pxSolid000">
            <ol class="fontSize14">

                <li>Informacja o cenie zakupu towaru w Sklepie podawana jest na stronie Sklepu. Cena towaru nie ulegnie
                    zmianie niezależnie od zmian cen w Sklepie, które mogą się pojawić po potwierdzeniu przyjęcia do
                    realizacji zamówienia Klienta.
                </li>
                <li>Ceny produktów w Sklepie podawane są w złotych polskich i zawierają wszystkie jej składniki, w tym
                    VAT, cła i inne podatki.
                </li>
                <li>Sklep zastrzega sobie prawo do zmiany cen towarów znajdujących się w ofercie Sklepu, wprowadzania
                    nowych towarów do oferty Sklepu, przeprowadzania i odwoływania akcji promocyjnych na stronach Sklepu
                    bądź wprowadzania w nich zmian, wycofania poszczególnych produktów ze sprzedaży, a także do
                    czasowego zamknięcia Sklepu.
                    <br><br>
                    Wszelkie tego typu zmiany i działania nie mają zastosowania do zamówień złożonych przed dokonaniem
                    zmian.
                </li>
                <li>Sprzedaż w Sklepie prowadzona jest tylko na terenie Polski, sprzedaż poza granicami Polski możliwa
                    jest pod warunkiem wcześniejszego porozumienia się ze Sprzedawcą.
                </li>
                <li>Sklep przyjmuje zamówienia przez całą dobę, we wszystkie dni tygodnia.
                </li>
                <li>Zamówienia są przekazane do realizacji w dniu złożenia lub w dniu następującym po złożeniu
                    zamówienia.
                </li>
                <li>Zamówienia złożone w soboty, w niedziele oraz w święta będą rozpatrywane następnego dnia roboczego.
                    Za dni robocze rozumie się dni tygodnia od poniedziałku do piątku, za wyjątkiem dni ustawowo wolnych
                    od pracy.
                </li>
                <li>Klient płaci cenę za zamówione produkty, wedle swego wyboru:
                    <ul>
                        <li>płatność on-line za pośrednictwem systemu płatności elektronicznych DotPay.pl(kartą
                            kredytową,
                            szybkim
                        </li>
                        <li>przelewem elektronicznym: lista banków jest widoczna podczas składania zamówienia);
                        </li>
                        <li>płatność przy odbiorze (za pobraniem);
                        </li>
                        <li>odbierając zamówiony towar w sklepie istnieje możliwość zapłaty gotówką lub kartą płatniczą.
                        </li>
                    </ul>
                </li>
                <li>W przypadku wyboru przez Klienta metody płatności w formie elektronicznej za pośrednictwem DotPay,
                    brak otrzymania płatności na rachunek Sprzedawcy<br>

                    lub podmiotów pośredniczących w transakcji w terminie 3 dni od złożenia zamówienia, spowoduje
                    anulowanie zamówienia. W takiej sytuacji można powtórnie złożyć zamówienia.
                </li>
                <li>Termin realizacji zamówienia, tj. czas skompletowania zamówienia i przekazania zamówienia do
                    wysyłki, wynosi do 2 dni roboczych od momentu:
                    <ul>
                        <li>zaksięgowania wpłaty we właściwej wysokości na koncie Sprzedawcy w przypadku płatności
                            online;
                        </li>
                        <li>przyjęcia zamówienia do realizacji w przypadku płatności za pobraniem.
                        </li>
                    </ul>
                </li>
                <li>Zamówiony towar wraz z dowodem zakupu (oryginał faktury lub paragon) wysyłany jest na adres podany
                    przez Klienta podczas składania zamówienia.
                </li>
                <li>Zamówiony towar dostarczany jest do Klienta na terenie Polski na jego koszt za pośrednictwem firmy
                    kurierskiej GLS.
                </li>
                <li>Deklarowany przez firmę kurierską czas dostawy to 1 dzień roboczy od momentu przekazania przesyłki
                    do wysłania, w żadnym zaś razie czas dostawy nie przekroczy 30 dni od daty zawarcia umowy sprzedaży.
                </li>
                <li>Koszty przesyłki uzależnione są od wybranej formy płatności oraz wartości zamówienia i kształtują
                    się następująco:
                    <ul>
                        <li>19 zł - w przypadku przedpłaty on-line;</li>
                        <li>25 zł - w przypadku płatności za pobraniem;</li>
                        <li>0 zł - w przypadku, gdy wartość zamówienia wynosi co najmniej 300 zł (niezależnie od formy
                            płatności).
                        </li>
                    </ul>
                </li>
                <li>Koszty wysyłki zostaną automatycznie doliczone podczas wypełniania formularza zamówienia, po
                    wybraniu opcji płatności i opcji dostawy.
                </li>
                <li>Przed odebraniem przesyłki od kuriera należy sprawdzić, czy opakowanie nie uległo uszkodzeniu w
                    transporcie, to znaczy czy paczka nosi ślady uderzeń, zbić, pęknięć.
                    <br><br>
                    Najczęściej rozpoznać można zniszczenie opakowania kartonowego po odgnieceniach, rozerwaniach,
                    odkształceniach lub zbytnim zaplamieniu.
                    <br><br>
                    W szczególności należy zwrócić uwagę na stan taśm zabezpieczających naklejonych na przesyłkę przez
                    pracowników Sklepu.
                    <br><br>
                    Klient może żądać od dostawcy (tj. pracownika kuriera) sporządzenia protokołu uszkodzeń.
                </li>
                <li>W przypadku, gdy opakowanie przesyłki nosi znamiona uszkodzenia lub gdy taśmy są zerwane Klient może
                    odmówić przyjęcia przesyłki i w obecności kuriera sporządzić protokół szkód oraz zachować kopię
                    protokołu.
                </li>
                <li>Klient może również dokonać odbioru zamówionego towaru osobiście lub za pośrednictwem własnego
                    kuriera, po uprzednim ustaleniu terminu i sposobu ze Sprzedawcą.
                    <br><br>
                    W tym celu należy jednak skontaktować się ze Sklepem poprzez adres mailowy: info@ski4humans.pl
                </li>
                <li>Klient nie ponosi kosztów dostawy w przypadku odbioru osobistego.</li>
            </ol>
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