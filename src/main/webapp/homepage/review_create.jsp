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

    <div class="width98Margin0auto">
        <div align="center">
            &nbsp;
            <p>Uzupełnij wszytkie pola w celu dodania nowej recenzji.</p>
            &nbsp;
        </div>

        <div>
            <form action="../homepage/createNewReview" method="post" id="createReviewForm"
                  onsubmit="return validateCreateReviewForm()">

                <div class="form-group">
                    <label for="headline">Tytuł oceny</label>
                    <input type="text" class="form-control" id="headline" name="headline"
                           aria-describedby="headline" placeholder="Wpisz tytuł">
                </div>
                <div class="form-group">
                    <label for="rating">Ocena</label>
                    <input type="number" min="1" max="6" class="form-control" id="rating" name="rating"
                           aria-describedby="rating" placeholder="Dodaj ocenę (liczby całkowite od 1 do 6)">
                </div>
                <div class="form-group">
                    <label for="comment">Komentarz</label>
                    <textarea class="form-control" rows="4" cols="50" id="comment" name="comment"
                              aria-describedby="comment">Wpisz komentarz...</textarea>
                </div>
                <div class="form-group">
                    <label for="equipmentName">Nazwa producenta</label>
                    <input type="text" class="form-control" id="equipmentName" disabled="disabled"
                           aria-describedby="equipmentName" value="${equipment.name}">
                    <input type="hidden" id="equipmentId" name="equipmentId" value="${equipment.equipmentId}">
                </div>
                <div class="form-group">
                    <label for="customerName">Nazwa klienta</label>
                    <input type="text" class="form-control" id="customerName" disabled="disabled"
                           aria-describedby="equipmentName" value="${sessionScope.customerLogged.email}">
                    <input type="hidden" id="customerId" name="customerId"
                           value="${sessionScope.customerLogged.customerId}">
                </div>

                <button type="submit" class="btn btn-primary">Zatwierdź</button>
                <button type="button" class="btn btn-primary" id="cancel" onclick="javascript:history.go(-1);">
                    Anuluj
                </button>
            </form>
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

<script type="text/javascript">
    function validateCreateReviewForm() {
        var headline = document.getElementById("headline");
        var rating = document.getElementById("rating");
        var comment = document.getElementById("comment");
        var equipmentId = document.getElementById("equipmentId");
        var customerId = document.getElementById("customerId");

        if (headline.value.length == 0) {
            alert("Tytuł jest wymagany");
            headline.focus();
            return false;
        }
        if (rating.value.length == 0) {
            alert("Ocena jest wymagana");
            rating.focus();
            return false;
        }
        if (comment.value.length == 0) {
            alert("Komentarz jest wymagany");
            comment.focus();
            return false;
        }
        if (equipmentId.value.length == 0) {
            alert("Wybór sprzętu jest wymagany");
            equipmentId.focus();
            return false;
        }
        if (customerId.value.length == 0) {
            alert("Logowanie na strone jest wymagane w celu utworzenia recenzji");
            customerId.focus();
            return false;
        }
        return true;
    }
</script>
</html>