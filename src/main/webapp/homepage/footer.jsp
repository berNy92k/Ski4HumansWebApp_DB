<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<div class="row">
    <div class="col-3">
        <h7>ZAPISZ SIĘ DO NEWSLETTERA</h7>
        <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="#">
                <form action="index.jsp">
                    <input type="text" name="nazwa" placeholder="Twój adres email*" size="30"
                           style="border-radius: 5px; min-height: 30px; max-height: 35px ;border-color: rgba(109,163,207,0.99)">
                    <input type="submit" value="Wyślij"
                           style="border-radius: 5px;  min-height: 30px; max-height: 35px">
                </form>
            </a></li>
            <li class="text-muted">* Możesz zrezygnować w każdej chwili. W tym celu należy odnaleźć
                szczegóły w naszej informacji prawnej.
            </li>
        </ul>
    </div>
    <div class="col-2">
        <h7>O NAS</h7>
        <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="../onas/o-firmie.jsp">O firmie</a></li>
            <li><a class="text-muted" href="../onas/praca.jsp">Praca</a></li>
            <li><a class="text-muted" href="../onas/serwis-i-wypozyczalnia.jsp">Serwis i wypożyczalnia</a></li>
            <li><a class="text-muted" href="../onas/nasz-sklep-stacjonarny.jsp">Nasz sklep stacjonarny</a></li>
            <li><a class="text-muted" href="../onas/regulamin-sklepu.jsp">Regulamin sklepu</a></li>
            <li><a class="text-muted" href="../onas/aktualne-promocje.jsp">Aktualne promocje</a></li>
            <li><a class="text-muted" href="../onas/kontakt.jsp">Skontaktuj się z nami</a></li>
        </ul>
    </div>
    <div class="col-2">
        <h7>STREFA KLIENTA</h7>
        <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="../strefa-klienta/dane-kontaktowe.jsp">Dane kontaktowe</a></li>
            <li><a class="text-muted" href="../strefa-klienta/polityka-prywatnosci.jsp">Polityka prywatności</a></li>
            <li><a class="text-muted" href="../strefa-klienta/dostawa-i-platnosci.jsp">Dostawa i płatności</a></li>
            <li><a class="text-muted" href="../strefa-klienta/reklamacje-i-zwroty.jsp">Reklamacje i zwroty</a></li>
            <li><a class="text-muted" href="../strefa-klienta/faq.jsp">FAQ</a></li>
            <li><a class="text-muted" href="../strefa-klienta/odbior-osobisty.jsp">Odbiór osobisty</a></li>
            <li><a class="text-muted" href="../strefa-klienta/zagraniczna-wysylka.jsp">Zagraniczna wysyłka</a></li>
            <li><a class="text-muted" href="../strefa-klienta/blog.jsp">Blog</a></li>
        </ul>
    </div>
    <div class="col-2">
        <h7>MOJE KONTO</h7>
        <ul class="list-unstyled text-small">
            <li><a class="text-muted" href="#">Moje konto</a></li>
        </ul>
    </div>
    <div class="col">
        <ul class="list-unstyled text-small">
            <li class="text-muted"><a href="../index.jsp">
                <img class="mb-2" src="../images/logo.png" width="170"
                     height="24" alt="ski4humans"></a>
            </li>
            <br>
            <li class="text-muted"><img class="mb-2" src="../images/phone.png" width="15" height="10">
                | +48 xxx xxx xxx
                <br>Poniedziałek - piątek (8:00 - 16:00)
            </li>
            <br>
            <li class="text-muted">
                <a href="mailto:info@ski4humans.pl">
                    <img class="mb-2" src="../images/mail.png" width="15" height="15"> info@ski4humans.pl
                </a>
                <br>Uprzejmie informujemy, iż nie
                <br>przyjmujemy zamówień drogą
                <br>telefoniczną oraz mailową.
            </li>
        </ul>
    </div>
</div>

<div class="row&copy" style="align-items: center">
    <p style="text-align: center">
        <small class="d-block mb-3 text-muted">&copy; Copyright ski4humans.pl. All rights reserved.</small>
    </p>
</div>

<div class="row&socialMedia" style="align-items: center">
    <!-- <div>Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a
        href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a> is licensed by <a
        href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0
    BY</a></div> -->
    <p style="text-align: center"><img class="mb-2" src="../images/facebook.png" width="20" height="20">
        <img class="mb-2" src="../images/google-plus.png" width="20" height="20">
        <img class="mb-2" src="../images/youtube.png" width="20" height="20">
        <img class="mb-2" src="../images/instagram.png" width="20" height="20"></p>
</div>