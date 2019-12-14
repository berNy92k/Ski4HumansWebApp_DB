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

    <title>Ski4Humans - Equipment List</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:directive.include file="header.jsp"/>
    </header>

    <div style="width: 98%; margin: 0 auto">

        <div align="center" style="margin-top: 15px">
            <h2><p style="color: #2d0001;">${equipmentCategoryName} - ${equipmentSex}</p></h2>
        </div>

        <div align="center">
            <h5><p style="color: #950002;">${message}</p></h5>
        </div>

        <div style="width: 95%; margin: 0 auto">
            <c:forEach var="equipment" items="${equipmentList}">
                <div style="width: 250px; border: 1px solid rgba(0,7,255,0.02); display: inline-block; margin: 14px">
                    <div style="width: 245px">
                        <a href="viewEquipment?id=${equipment.equipmentId}">
                            <img class="book-small" src="data:image/jpg;base64,${equipment.base64Image}" width="245px"
                                 alt="Podgląd sprzętu"/>
                        </a>
                    </div>
                    <div style="text-align: center; vertical-align: center; margin-top: 5px">
                        <div style="height: 90px">
                            <a href="viewEquipment?id=${equipment.equipmentId}">
                                <b>${equipment.name}</b>
                            </a>
                        </div>
                        <div>
                            Rating *****
                        </div>
                        <div>
                            <b><i>${equipment.manufacturer.manufacturerName}</i></b>
                        </div>
                        <div style="height: 80px;"><i>${equipment.shortDescription}</i></div>
                        <div>
                            <b style="color: #bf0004">${equipment.price} [zł]</b>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <footer>
            <div style="height: 30px"></div>
            <jsp:include page="footer.jsp"/>
        </footer>
    </div>
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