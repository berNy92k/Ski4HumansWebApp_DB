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
        <div class="backgroundColord7e6f3Padding15151540MarginBottom50">
            <h2 class="color0d0e48">#${review.reviewId} - ${review.headline}</h2>
        </div>
        <div class="displayFlex">
            <div class="marginRight15Width500">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h4 class="colorb60001">ID:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.reviewId}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 class="colorb60001">Ocena:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.rating}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 class="colorb60001">Tytuł:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.headline}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 class="colorb60001">Komentarz:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.comment}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 class="colorb60001">Data wpisu:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.reviewTime}</h3>
                    </li>
                </ul>
            </div>
            <div class="width50"></div>
            <div class="marginRight15Width500">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h4 class="colorb60001">ID sprzętu:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.equipment.equipmentId}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 class="colorb60001">Nazwa sprzętu:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.equipment.name}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 class="colorb60001">ID klienta:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.customer.customerId}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 class="colorb60001">Email klienta:</h4> &nbsp;
                        <h3 class="color0d0e48">${review.customer.email}</h3>
                    </li>
                </ul>
            </div>
            <div class="marginLeft20Width100">
                <div>
                    <h5>Akcje:</h5>
                </div>
                <div>
                    <p><a href="../admin/editReview?id=${review.reviewId}">EDYCJA</a></p>
                    <p><a href="javascript:deleteReview(${review.reviewId})">USUŃ</a></p>
                </div>
            </div>
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