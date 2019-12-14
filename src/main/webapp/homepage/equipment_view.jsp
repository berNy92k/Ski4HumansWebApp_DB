<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Web for training">
    <meta name="author" content="DB">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Ski4Humans - Equipment View</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:directive.include file="header.jsp"/>
    </header>

    <div style="width: 98%; margin: 30px auto 40px;">
        <div style="display: flex">
            <div style="margin-right: 15px; width: 610px; border: 1px solid #0d0e48;">
                <img src="data:image/jpg;base64, ${equipment.base64Image}" width="600px">
            </div>
            <div style="width: 50px"></div>
            <div style="width: 500px">
                <div style="margin-bottom: 40px">
                    <h3 style="color: #0d0e48"><b>${equipment.name}</b></h3>
                </div>
                <div style="margin-bottom: 40px;display: flex">
                    <h6 style="color: #b60001">Cena:</h6> &nbsp;
                    <h2 style="color: #b60001"><b>${equipment.price}</b> zł</h2>
                </div>
                <div style="margin-bottom: 40px">
                    <h6>Długość (cm) / Rozmiar (EU)</h6>
                    <h3>${equipment.lengthOrSize}</h3>
                </div>
                <div style="margin-bottom: 40px;display: flex">
                    <div>
                        <div>
                            <h5>Producent:</h5>
                        </div>
                        <div>
                            <h3>${equipment.manufacturer.manufacturerName}</h3>
                        </div>
                    </div>
                    <div style="margin-left: 50px">
                        <img src="data:image/jpg;base64,${equipment.manufacturer.base64Image}" width="250px">
                    </div>
                </div>
                <div style="margin-bottom: 40px; text-align: center">
                    <a href="#?eq=${equipment.equipmentId}">
                        <button type="button" class="btn btn-primary" id="cancel">
                            DODAJ DO KOSZYKA
                        </button>
                    </a>
                </div>
                <div style="margin-bottom: 20px">
                    <table style="margin: 0 auto; table-layout:fixed;
                    white-space: normal !important; word-wrap: break-word;">
                        <thead>
                        <tr style="background-color:rgba(0,117,255,0.23)">
                            <th>
                                <h7>Krótki opis produktu:</h7>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <h5>${equipment.shortDescription}</h5>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div style="clear: both; margin-top: 40px">
            <table style="margin: 0 auto; width: 1200px; table-layout:fixed; white-space: normal !important;
            word-wrap: break-word">
                <thead>
                <tr style="background-color:rgba(0,117,255,0.23)">
                    <th>
                        <h5>Opis produktu: </h5>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <h4>${equipment.longDescription}</h4>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="../homepage/footerWithHelp.jsp"/>

    <footer>
        <div style="height: 30px"></div>
        <jsp:include page="footer.jsp"/>
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