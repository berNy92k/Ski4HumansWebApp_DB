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

    <title>Ski4Humans - Create Category</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <div style="width: 500px; margin: 0 auto">
        <div align="center">
            &nbsp;
            <c:if test="${review != null}">
                <p>Uzupełnij wszytkie pola w celu wykonania edycji.</p>
            </c:if>
            <c:if test="${review == null}">
                <p>Uzupełnij wszytkie pola w celu dodania nowej recenzji.</p>
            </c:if>
            &nbsp;
        </div>

        <div>
            <c:if test="${review != null}">
            <form action="../admin/updateReview" method="post" id="createReviewForm"
                  onsubmit="return validateCreateReviewForm()">
                <input type="hidden" id="reviewId" name="reviewId" value="${review.reviewId}">
                </c:if>
                <c:if test="${review == null}">
                <form action="../admin/createNewReview" method="post" id="createReviewForm"
                      onsubmit="return validateCreateReviewForm()">
                    </c:if>

                    <div class="form-group">
                        <label for="headline">Tytuł oceny</label>
                        <input type="text" class="form-control" id="headline" name="headline"
                               aria-describedby="headline"
                               placeholder="Wpisz tytuł" value="${review.headline}">
                    </div>
                    <div class="form-group">
                        <label for="rating">Ocena</label>
                        <input type="number" min="1" max="6" class="form-control" id="rating" name="rating"
                               aria-describedby="rating"
                               placeholder="Dodaj ocenę (liczby całkowite od 1 do 6)" value="${review.rating}">
                    </div>
                    <div class="form-group">
                        <label for="comment">Komentarz</label>
                        <input type="text" class="form-control" id="comment" name="comment" aria-describedby="comment"
                               placeholder="Wpisz komentarz" value="${review.comment}">
                    </div>
                    <div class="form-group">
                        <label for="equipmentName">Nazwa producenta</label>
                        <br>
                        <select class="form-control" id="equipmentName" name="equipmentName">
                            <c:forEach items="${equipmentList}" var="equipment">
                                <c:if test="${equipment.equipmentId eq review.equipment.equipmentId}">
                                    <option value="${equipment.equipmentId}" selected>
                                </c:if>
                                <c:if test="${equipment.equipmentId ne review.equipment.equipmentId}">
                                    <option value="${equipment.equipmentId}">
                                </c:if>
                                ${equipment.name}
                                </option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="customerName">Nazwa klienta</label>
                        <br>
                        <select class="form-control" id="customerName" name="customerName">
                            <c:forEach items="${customerList}" var="customer">
                                <c:if test="${customer.customerId eq review.customer.customerId}">
                                    <option value="${customer.customerId}" selected>
                                </c:if>
                                <c:if test="${customer.customerId ne review.customer.customerId}">
                                    <option value="${customer.customerId}">
                                </c:if>
                                ${customer.email}
                                </option>
                            </c:forEach>
                        </select>
                    </div>

                    <button type="submit" class="btn btn-primary">Zatwierdź</button>
                    <button type="button" class="btn btn-primary" id="cancel" onclick="javascript:history.go(-1);">
                        Anuluj
                    </button>
                </form>
        </div>
    </div>

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

<script type="text/javascript">
    function validateCreateReviewForm() {
        var email = document.getElementById("email");
        var password = document.getElementById("password");
        var firstName = document.getElementById("firstName");
        var lastName = document.getElementById("lastName");
        var street = document.getElementById("street");
        var homeNumber = document.getElementById("homeNumber");
        var city = document.getElementById("city");
        var zipCode = document.getElementById("zipCode");
        var country = document.getElementById("country");
        var phone = document.getElementById("phone");

        if (email.value.length == 0) {
            alert("Email jest wymagany");
            email.focus();
            return false;
        }

        <c:if test="${customer == null}">
        if (password.value.length == 0) {
            alert("Hasło jest wymagane");
            password.focus();
            return false;
        }
        </c:if>

        if (firstName.value.length == 0) {
            alert("Imię jest wymagane");
            firstName.focus();
            return false;
        }
        if (lastName.value.length == 0) {
            alert("Nazwisko jest wymagane");
            lastName.focus();
            return false;
        }
        if (street.value.length == 0) {
            alert("Nazwa ulicy jest wymagana");
            street.focus();
            return false;
        }
        if (homeNumber.value.length == 0) {
            alert("Numer domu jest wymagany");
            homeNumber.focus();
            return false;
        }
        if (city.value.length == 0) {
            alert("Miasto jest wymagane");
            city.focus();
            return false;
        }
        if (zipCode.value.length == 0) {
            alert("Kod pocztowy jest wymagany");
            zipCode.focus();
            return false;
        }
        if (country.value.length == 0) {
            alert("Kraj jest wymagany");
            country.focus();
            return false;
        }
        if (phone.value.length == 0) {
            alert("Numer telefonu jest wymagany");
            phone.focus();
            return false;
        }
        return true;
    }
</script>
</html>