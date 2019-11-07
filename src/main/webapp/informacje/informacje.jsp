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
        </ul>
    </div>
    <div>
        <header style="padding-bottom: 30px; padding-top: 10px">
            <h1>
                Informacje
            </h1>
        </header>
        <div>
            <p style="height: 15px;text-indent: 3%">Lista stron w Informacje:</p>
            <ul>
                <li>
                    <a class="nav-link active" href="darmowy-montaz-wiazan.jsp">DARMOWY MONTAŻ WIĄZAŃ</a>
                </li>
                <li>
                    <a class="nav-link active" href="jak-dobrac-sprzet-narciarski.jsp">JAK DOBRAĆ SPRZĘT NARCIARSKI?</a>
                </li>
                <li>
                    <a class="nav-link active" href="../homepage/index.jsp">JAK DOBRAĆ BUTY DLA DZIECKA?</a>
                </li>
                <li>
                    <a class="nav-link active" href="../homepage/index.jsp">W JAKI SPOSÓB DOBRAĆ BUTY NARCIARSKIE?</a>
                </li>
                <li>
                    <a class="nav-link active" href="../homepage/index.jsp">JAK DOPASOWAĆ DŁUGOŚĆ NART?</a>
                </li>
                <li>
                    <a class="nav-link active" href="../homepage/index.jsp">JAK DOBRAĆ ODPOWIEDNIĄ DŁUGOŚĆ KIJKÓW NARCIARSKICH?</a>
                </li>
                <li>
                    <a class="nav-link active" href="../homepage/index.jsp">JAK DOPASOWAĆ KASK NARCIARSKI?</a>
                </li>
                <li>
                    <a class="nav-link active" href="../homepage/index.jsp">CAŁY SPRZĘT MAMY W MAGAZYNIE. ZADZWOŃ DO NAS</a>
                </li>
                <li>
                    <a class="nav-link active" href="../homepage/index.jsp">PRZY ZAKUPACH OD 300 ZŁ - WYSYŁKA GRATIS !</a>
                </li>
            </ul>
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