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

    <title>Ski4Humans - Category List</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <div class="width98Margin0auto">
        <div align="center">
            &nbsp;
            <h3>
                <a href="../admin/preCreateNewReview"><p class="color2b57b4">DODAJ NOWĄ RECENCJĘ DO BAZY</p></a>
            </h3>
            &nbsp;
        </div>

        <div align="center">
            <h5><p class="color950002">${message}</p></h5>
        </div>

        <div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">Ocena</th>
                    <th scope="col">Tytuł</th>
                    <th scope="col">ID sprzętu</th>
                    <th scope="col">ID klienta</th>
                    <th scope="col">Data wpisu</th>
                    <th scope="col">Akcje</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="review" items="${reviewList}" varStatus="status">
                    <tr>
                        <th scope="row">${status.index + 1}</th>
                        <td>${review.reviewId}</td>
                        <td>${review.rating}</td>
                        <td>${review.headline}</td>
                        <td>${review.equipment.equipmentId}</td>
                        <td>${review.customer.customerId}</td>
                        <td>${review.reviewTime}</td>
                        <td class="width220">
                            <a href="../admin/editReview?id=${review.reviewId}">EDYCJA</a> |
                            <a href="javascript:deleteReview(${review.reviewId})">USUŃ</a> |
                            <a href="../admin/viewReview?id=${review.reviewId}">PODGLĄD</a>
                        </td>
                    </tr>
                </c:forEach>
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
    function deleteReview(reviewId) {
        if (confirm("Czy jestes pewny? Jeżeli się zgodzisz recenzja z '" + reviewId + "' id zostanie usunięta")) {
            window.location = '../admin/deleteReview?id=' + reviewId;
        }
    }
</script>
</html>