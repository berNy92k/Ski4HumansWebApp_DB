<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Web for training">
    <meta name="author" content="DB">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Login page</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>
<body>

<div class="container">
    <header>
        <jsp:directive.include file="header.jsp"/>
    </header>

    <div class="width500pxMargin0auto">

        <div align="center">
            &nbsp;
            <p>Uzupełnij wszystkie pola aby się zarejestrować</p>
            &nbsp;
        </div>


        <c:if test="${message != null}">
            <div align="center">
                <h5><p class="color950002">${message}</p></h5>
            </div>
        </c:if>

        <form action="../homepage/register" method="post" onsubmit="return validateRegisterForm()">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" class="form-control" id="email" name="email" aria-describedby="email"
                       placeholder="Wpisz email">
            </div>
            <div class="form-group">
                <label for="password">Hasło</label>
                <input type="text" class="form-control" id="password" name="password"
                       aria-describedby="password"
                       placeholder="Wpisz hasło">
            </div>
            <div class="form-group">
                <label for="firstName">Imię</label>
                <input type="text" class="form-control" id="firstName" name="firstName"
                       aria-describedby="firstName"
                       placeholder="Wpisz imię">
            </div>
            <div class="form-group">
                <label for="lastName">Nazwisko</label>
                <input type="text" class="form-control" id="lastName" name="lastName"
                       aria-describedby="lastName"
                       placeholder="Wpisz nazwisko">
            </div>
            <div class="form-group">
                <label for="street">Ulica</label>
                <input type="text" class="form-control" id="street" name="street" aria-describedby="street"
                       placeholder="Wpisz nazwę ulicy">
            </div>
            <div class="form-group">
                <label for="homeNumber">Numer domu</label>
                <input type="text" class="form-control" id="homeNumber" name="homeNumber"
                       aria-describedby="homeNumber"
                       placeholder="Wpisz numer domu">
            </div>
            <div class="form-group">
                <label for="city">Miasto</label>
                <input type="text" class="form-control" id="city" name="city" aria-describedby="city"
                       placeholder="Wpisz miasto">
            </div>
            <div class="form-group">
                <label for="zipCode">Kod pocztowy</label>
                <input type="text" class="form-control" id="zipCode" name="zipCode" aria-describedby="zipCode"
                       placeholder="Wpisz kod pocztowy">
            </div>
            <div class="form-group">
                <label for="country">Kraj</label>
                <input type="text" class="form-control" id="country" name="country" aria-describedby="country"
                       placeholder="Wpisz kraj">
            </div>
            <div class="form-group">
                <label for="phone">Numer telefonu</label>
                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="phone"
                       placeholder="Wpisz numer telefonu">
            </div>

            <button type="submit" class="btn btn-primary">Zatwierdź</button>
            <button type="button" class="btn btn-primary" id="cancel" onclick="javascript:history.go(-1);">
                Anuluj
            </button>
        </form>
    </div>


    <footer class="footerFreeSpace30px">
        <jsp:directive.include file="../homepage/footer.jsp"/>
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
    function validateRegisterForm() {
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
        if (password.value.length == 0) {
            alert("Hasło jest wymagane");
            password.focus();
            return false;
        }
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

</body>
</html>