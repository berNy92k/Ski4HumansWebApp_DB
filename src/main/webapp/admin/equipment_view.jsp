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
        <jsp:include page="header.jsp"/>
    </header>

    <div class="width98Margin30auto0">
        <div class="displayFlex">
            <div class="marginRight15Width610Border0d0e48">
                <img src="data:image/jpg;base64, ${equipment.base64Image}" width="600px">
            </div>
            <div class="width50"></div>
            <div class="width400">
                <div class="marginBottom40px">
                    <h3 class="color0d0e48">${equipment.name}</h3>
                </div>
                <div class="marginBottom40displayFlex">
                    <h4 class="colorb60001">Cena:</h4> &nbsp;
                    <h2 class="colorb60001">${equipment.price} zł</h2>
                </div>
                <div class="marginBottom40px">
                    <h5>Długość (cm) / Rozmiar (EU)</h5>
                    <h3>${equipment.lengthOrSize}</h3>
                </div>
                <div class="marginBottom40displayFlex">
                    <div>
                        <div>
                            <h5>Producent:</h5>
                        </div>
                        <div>
                            <h3>${equipment.manufacturer.manufacturerName}</h3>
                        </div>
                    </div>
                    <div class="marginLeft50">
                        <img src="data:image/jpg;base64,${equipment.manufacturer.base64Image}" width="100px">
                    </div>
                </div>
                <div class="marginBottom20px">
                    <table class="margin0autoTableLayoutFixedWhiteSpaceNormalImportantWordWrapBreakWordWidth400">
                        <thead>
                        <tr class="backgroundColorRgba084140059">
                            <th>
                                <h5>Krótki opis produktu: </h5>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <h4>${equipment.shortDescription}</h4>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="width40 marginLeft20">
                <div>
                    <h5>Akcje:</h5>
                </div>
                <div>
                    <p><a href="../admin/editEquipment?id=${equipment.equipmentId}">EDYCJA</a></p>
                    <p><a href="javascript:deleteEquipment(${equipment.equipmentId})">USUŃ</a></p>
                </div>
            </div>
        </div>
        <div class="clearBothMarginTop40">
            <table class="margin0autoTableLayoutFixedWhiteSpaceNormalImportantWordWrapBreakWordWidth1200">
                <thead>
                <tr class="backgroundColorRgba084140059">
                    <th>
                        <h2>Opis produktu: </h2>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <h3>${equipment.longDescription}</h3>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <footer class="footerFreeSpace30px">
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

<script>
    function deleteEquipment(equipmentId) {
        if (confirm("Czy jestes pewny ? Jeżeli się zgodzisz sprzęt z '" + equipmentId + "' id zostanie usunięty")) {
            window.location = '../admin/deleteEquipment?id=' + equipmentId;
        }
    }
</script>
</html>