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
                <a class="nav-link" href="darmowy-montaz-wiazan.jsp">DARMOWY MONTAŻ WIĄZAŃ</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p style="font-size: 30px; padding-bottom: 20px">DARMOWY MONTAŻ WIĄZAŃ</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Prawidłowy montaż wiązań to jeden z najważniejszych kroków,
                przygotowujących sprzęt narciarski do użytkowania. Właściwy montaż to gwarancja bezpieczeństwa każdego
                narciarza. Warto pamiętać, że montaż musi być wykonany przez osoby odpowiednio do tego wykwalifikowane:
                posiadające fachową wiedzę i doświadczenie. Mając na uwadze komfort i bezpieczeństwo klientów
                decydujących się na zakup nart - jako jeden z nielicznych sklepów - oferujemy całkowicie darmowy montaż
                wiązań.</p>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">JAKIE DANE SĄ POTRZEBNE DO MONTAŻU WIĄZAŃ?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <ul style="font-size: 14px">
                <li>
                    Żeby wykonać poprawny montaż przede wszystkim należy podać długość skorupy buta, mierzoną w
                    milimetrach. Warto pamiętać, że jest to trzycyfrowa liczba, przeważnie wytłoczona w okolicach pięty
                    buta narciarskiego (nie mylić z długością buta wewnętrznego podawaną w centymetrach). W przypadku
                    gdy długość nie jest podana, można zmierzyć spód buta (przykładowe długości butów: damskie 297 mm,
                    męskie 327 mm). Pod tekstem znajduje się grafika, która prezycyjnie prezentuje sposoby pozyskania
                    informacji o długości skorupy buta.
                </li>
                <li>
                    Aby odpowiednio ustawić siłę wypięcia potrzebujemy od Państwa następujących danych: wagę (kg),
                    wzrost (cm) oraz umiejętności określone w skali od 1 do 3:
                </li>
            </ul>
            <br>
            <ol style="font-size: 12px">
                <li>Narciarz początkujący – preferujący małe prędkości i spokojną jazdę, jeżdżący na stokach o
                    niewielkim nachyleniu.
                </li>
                <li>Średniozaawansowany – średnie prędkości, większa skrętność i bardziej nachylone stoki.</li>
                <li>Dobrze jeżdżący – duże prędkości, agresywna i dynamiczna jazda, najbardziej nachylone stoki.</li>
            </ol>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">DODATKOWE ELEMENTY, UWZGLĘDNIANE PODCZAS MONTAŻU
                WIĄZAŃ:</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <ul style="font-size: 14px">
                <li>
                    Wiek narciarza - osoby, które mają ponad 50 lat powinni poinformować o tym w zamówieniu w celu
                    bezpiecznego ustawienia wiązań.
                </li>
                <li>
                    Montaż wiązań w nartach freestyle’owych uwzględnia przesunięcia ich do przodu – w zależności od
                    preferencji i stylu jazdy narciarza.
                </li>
            </ul>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Dane muszą zgadzać się z rzeczywistymi wymiarami narciarza. Tylko wtedy montaż będzie przeprowadzony
                prawidłowo, zapewniając użytkownikowi właściwy stopień bezpieczeństwa!
            </p>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">WIĄZANIA STANDARDOWE CZY NA PŁYCIE?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Obecnie narciarze mają duży wybór w dopasowaniu dla siebie najlepszych wiązań. Szczególną popularnością
                cieszą się wiązania na płycie, które umożliwiają łatwą i szybką regulację bez używania jakichkolwiek
                narzędzi. Jeżeli chcą Państwo ustawić je samodzielnie, nasi specjaliści chętnie objaśnią jak wykonać to
                prawidłowo.
            </p>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Standardowe wiązania (bez płyty) mają ruchomy wyłącznie tylny bezpiecznik, dlatego (po montażu do
                wybranej długości buta) można jeszcze do nich dopasować buty, które są o rozmiar mniejsze, bądź o dwa
                rozmiary większe.
            </p>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div>
            <p style="font-size: 24px; padding-bottom: 20px">JAK PODAĆ WSZYSTKIE DANE, GDY NIE KUPIŁEM/KUPIŁAM JESZCZE
                BUTÓW?</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                Żeby ułatwić zakupy w naszym sklepie oferujemy klientom następujące rozwiązanie:
                wybierając najpierw buty, a dopiero potem narty, w koszyku istnieje możliwość zamówienia montażu wiązań
                do butów kupionych własnie w tym zamówieniu. Kiedy butów jest więcej wystarczy zaznaczyć, do której pary
                ma być wykonany montaż.
                Z kolei gdy kolejność jest odwrotna – najpierw wybierane są narty – można zaznaczyć pole: „zamawiam
                montaż, ale proszę o kontakt, w celu ustalenia szczegółów”, następnie wybrać buty i w koszyku ponownie
                zmienić opcję montażu, zaznaczając zakupione buty.
            </p>
        </div>

        <hr style="height:0;border:none;border-top:1px solid #000;">
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <p style="font-size: 14px">
                PO ZAMONOTWANIU WIĄZAŃ NARTY SĄ W PEŁNI GOTOWE DO JAZDY NA STOKU!
            </p>
        </div>
        <hr style="height:0;border:none;border-top:1px solid #000;">
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