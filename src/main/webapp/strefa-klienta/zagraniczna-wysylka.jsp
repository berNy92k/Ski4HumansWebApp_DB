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
                <a class="nav-link" href="#">Zagraniczna wysyłka</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p class="fontSize30PaddingBottom20">Zagraniczna wysyłka</p>
        </div>
        <div class="firstMessage paddingLeft20paddingRight20textAlignJustify">
            <ul class="fontSize14">
                <li>Realizujemy zamówienia w granicach Uni Europejskiej. Każde zamówienie z wysyłką poza granice Polski
                    podlega dodatkowej opłacie za wysyłkę (nie obowiązuje darmowa wysyłka powyżej 300zł wartości
                    zamówienia).
                </li>
                <li>Maksymalny wymiar pojedyńczej paczki to 200cmx80cmx60cm, maksymalna waga 10kg. Poniżej zamieszczamy
                    tabelę z zawartymi kosztami dostawy dla poszczególnych krajów Uni Europejskiej dla których
                    realizujemy wysyłkę.
                </li>
                <li>W razie realizacji większego zamówienia wymagającego większej paczki prosimy o złożenie zapytania o
                    wycenę na adres mailowy info@ski4humans.pl
                </li>
                <li>Wysyłkę krajową oraz poza granicę Polski realizujemy za pośrednictwem firmy kurierskiej GLS.
                </li>
                <li>W handlu zagranicznym nie oferujemy metody płatności za pobraniem.
                </li>
                <li>Zamówienie wysyłamy po zaksięgowaniu płatności za zakupiony towar oraz wysyłkę.
                </li>
            </ul>

            <table class="width250 fontSize12 border2pxSolidDddddd">
                <tr class="border1pxSolidDddddd">
                    <th class="border1pxSolid#dddddd width200 textAlignLeft">
                        Państwa <br> do których realizujemy wysyłkę
                    </th>
                    <th class="border1pxSolid width50 textAlignLeft">
                        Koszt wysyłki brutto <br>[PLN]
                    </th>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Austria</td>
                    <td class="border1pxSolidDddddd">80</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Belgium</td>
                    <td class="border1pxSolidDddddd">74</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Bulgaria</td>
                    <td class="border1pxSolidDddddd">96</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Croatia</td>
                    <td class="border1pxSolidDddddd">140</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Czech Republic</td>
                    <td class="border1pxSolidDddddd">67</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Denmark</td>
                    <td class="border1pxSolidDddddd">74</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Estonia</td>
                    <td class="border1pxSolidDddddd">102</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Finland</td>
                    <td class="border1pxSolidDddddd">145</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">France</td>
                    <td class="border1pxSolidDddddd">104</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Germany</td>
                    <td class="border1pxSolidDddddd">67</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Holland</td>
                    <td class="border1pxSolidDddddd">74</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Hungary</td>
                    <td class="border1pxSolidDddddd">67</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Ireland</td>
                    <td class="border1pxSolidDddddd">132</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Italy</td>
                    <td class="border1pxSolidDddddd">104</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Latvia</td>
                    <td class="border1pxSolidDddddd">86</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Lithuania</td>
                    <td class="border1pxSolidDddddd">67</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Luxembourg</td>
                    <td class="border1pxSolidDddddd">74</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Portugal</td>
                    <td class="border1pxSolidDddddd">157</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Romania</td>
                    <td class="border1pxSolidDddddd">92</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Slovakia</td>
                    <td class="border1pxSolidDddddd">67</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Slovenia</td>
                    <td class="border1pxSolidDddddd">109</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Spain</td>
                    <td class="border1pxSolidDddddd">136</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">Sweden</td>
                    <td class="border1pxSolidDddddd">120</td>
                </tr>
                <tr class="border1pxSolidDddddd">
                    <td class="border1pxSolidDddddd">United Kingdom</td>
                    <td class="border1pxSolidDddddd">104</td>
                </tr>
            </table>
        </div>
    </div>

    <footer class="footerFreeSpace30px30px">
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