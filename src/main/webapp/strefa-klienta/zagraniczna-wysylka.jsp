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
                <a class="nav-link" href="#">Zagraniczna wysyłka</a>
            </li>
        </ul>
    </div>
    <div>
        <div>
            <p style="font-size: 30px; padding-bottom: 20px">Zagraniczna wysyłka</p>
        </div>
        <div class="firstMessage" style="padding-left: 20px;padding-right: 20px;text-align: justify">
            <ul style="font-size: 14px">
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

            <table style="width:250px; font-size: 12px; border: 2px solid #dddddd;">
                <tr style="border: 1px solid #dddddd;">
                    <th style="border: 1px solid #dddddd; width: 200px; text-align: left">Państwa <br> do których
                        realizujemy wysyłkę
                    </th>
                    <th style="border: 1px solid #dddddd; width: 50px; text-align: left">Koszt wysyłki brutto <br>[PLN]
                    </th>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Austria</td>
                    <td style="border: 1px solid #dddddd;">80</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Belgium</td>
                    <td style="border: 1px solid #dddddd;">74</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Bulgaria</td>
                    <td style="border: 1px solid #dddddd;">96</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Croatia</td>
                    <td style="border: 1px solid #dddddd;">140</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Czech Republic</td>
                    <td style="border: 1px solid #dddddd;">67</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Denmark</td>
                    <td style="border: 1px solid #dddddd;">74</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Estonia</td>
                    <td style="border: 1px solid #dddddd;">102</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Finland</td>
                    <td style="border: 1px solid #dddddd;">145</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">France</td>
                    <td style="border: 1px solid #dddddd;">104</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Germany</td>
                    <td style="border: 1px solid #dddddd;">67</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Holland</td>
                    <td style="border: 1px solid #dddddd;">74</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Hungary</td>
                    <td style="border: 1px solid #dddddd;">67</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Ireland</td>
                    <td style="border: 1px solid #dddddd;">132</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Italy</td>
                    <td style="border: 1px solid #dddddd;">104</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Latvia</td>
                    <td style="border: 1px solid #dddddd;">86</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Lithuania</td>
                    <td style="border: 1px solid #dddddd;">67</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Luxembourg</td>
                    <td style="border: 1px solid #dddddd;">74</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Portugal</td>
                    <td style="border: 1px solid #dddddd;">157</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Romania</td>
                    <td style="border: 1px solid #dddddd;">92</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Slovakia</td>
                    <td style="border: 1px solid #dddddd;">67</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Slovenia</td>
                    <td style="border: 1px solid #dddddd;">109</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Spain</td>
                    <td style="border: 1px solid #dddddd;">136</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">Sweden</td>
                    <td style="border: 1px solid #dddddd;">120</td>
                </tr>
                <tr style="border: 1px solid #dddddd;">
                    <td style="border: 1px solid #dddddd;">United Kingdom</td>
                    <td style="border: 1px solid #dddddd;">104</td>
                </tr>
            </table>
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