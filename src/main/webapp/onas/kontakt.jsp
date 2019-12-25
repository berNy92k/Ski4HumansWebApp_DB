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
                <a class="nav-link" href="o-nas.jsp">O nas</a>
            </li>
            <li class="nav-item">
                <span class="nav-link active">&rarr;</span>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Skontaktuj się z nami</a>
            </li>
        </ul>
    </div>
    <div>
        <div style="max-width: 1120px">
            <div style="float: left; margin: 10px;padding: 10px;width: 350px; height: 450px"></div>
            <div style="float: left; margin: 10px;padding: 10px;width: 350px; height: 450px">
                <p style="font-size: 22px; padding-bottom: 20px">Informacja o sklepie</p>
                <p style="font-size: 15px">
                    ski4humans.pl<br>
                    Biuro i magazyn sprzętu<br>
                    00-000 Miasto<br>
                    Polska<br>
                    Telefon komórkowy: +48 xxx xxx xxx<br>
                    Telefon stacjonarny: +48 xx xxx xx xx<br>
                    Napisz do nas: info@skii4humans.pl</p>
            </div>
            <div style="float: left; margin: 10px;padding: 10px;width: 350px; height: 450px">
                <form>
                    <div class="form-group">
                        <input type="email" class="form-control" id="inputEmail1" aria-describedby="emailHelp"
                               placeholder="Adres Email">
                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone
                            else.
                        </small>
                    </div>
                    <div class="form-group">
                        <textarea id="textAreaMessege" rows="10" cols="44">Napisz wiadomość...</textarea>
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="testIfNotRobot" placeholder="Ile jest dwa razy 2">
                    </div>
                    <button type="submit" class="btn btn-primary">Wyślij wiadomość</button>
                </form>
            </div>
        </div>
        <div style="clear: both"></div>
        <div style="max-width: 1120px">
            <div style="float: left; margin: 10px;padding: 10px;width: 255px; height: 250px">
                <img src="../pic/lokalizacja.PNG" style="padding-bottom: 6px"><br>
                NASZA LOKALIZACJA<br><br>
                ski4humans.pl<br>
                Biuro i magazyn sprzętu<br>
                53-440 Kraków<br>
                Polska<br>
            </div>
            <div style="float: left; margin: 10px;padding: 10px;width: 255px; height: 250px">
                <img src="../pic/email1.PNG" style="padding-bottom: 13px"><br>
                DANE KONTAKTOWE<br><br>
                E-mail:
                <a href="mailto:info@ski4humans.pl">
                    info@ski4humans.pl
                </a>
                <br>
            </div>
            <div style="float: left; margin: 10px;padding: 10px;width: 260px; height: 250px">
                <img src="../pic/phone1.PNG"><br>
                SKONTAKTUJ SIĘ Z NAMI<br><br>
                Tel. komórkowy: +48 xxx xxx xxx<br>
                Tel. stacjonarny: +48 xx xxx xx xx<br>
            </div>
            <div style="float: left; margin: 10px;padding: 10px;width: 260px; height: 250px">
                <img src="../pic/obslugaKllienta.PNG"><br>
                OBSŁUGA KLIENTA<br><br>
                8:00 - 16:00<br>
                od poniedziałku do piątku<br>
            </div>
        </div>
        <div style="clear: both"></div>
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