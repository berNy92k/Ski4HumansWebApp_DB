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

    <div class="width500pxMargin0auto">
        <div align="center">
            &nbsp;
            <c:if test="${customer != null}">
                <p>Uzupełnij wszytkie pola w celu wykonania edycji.</p>
            </c:if>
            <c:if test="${customer == null}">
                <p>Uzupełnij wszytkie pola w celu dodania nowego klienta.</p>
            </c:if>
            &nbsp;
        </div>

        <div>
            <c:if test="${customer != null}">
            <form action="../admin/updateCustomer" method="post" id="createCustomerForm"
                  onsubmit="return validateCreateCustomerForm()">
                <input type="hidden" id="customerId" name="customerId" value="${customer.customerId}">
                </c:if>
                <c:if test="${customer == null}">
                <form action="../admin/createNewCustomer" method="post" id="createCustomerForm"
                      onsubmit="return validateCreateCustomerForm()">
                    </c:if>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="text" class="form-control" id="email" name="email" aria-describedby="email"
                               placeholder="Wpisz email" value="${customer.email}">
                    </div>
                    <div class="form-group">
                        <label for="password">Hasło (puste pole oznacza brak zmiany hasła)</label>
                        <input type="text" class="form-control" id="password" name="password"
                               aria-describedby="password"
                               placeholder="Wpisz hasło">
                    </div>
                    <div class="form-group">
                        <label for="firstName">Imię</label>
                        <input type="text" class="form-control" id="firstName" name="firstName"
                               aria-describedby="firstName"
                               placeholder="Wpisz imię" value="${customer.firstName}">
                    </div>
                    <div class="form-group">
                        <label for="lastName">Nazwisko</label>
                        <input type="text" class="form-control" id="lastName" name="lastName"
                               aria-describedby="lastName"
                               placeholder="Wpisz nazwisko" value="${customer.lastName}">
                    </div>
                    <div class="form-group">
                        <label for="street">Ulica</label>
                        <input type="text" class="form-control" id="street" name="street" aria-describedby="street"
                               placeholder="Wpisz nazwę ulicy" value="${customer.street}">
                    </div>
                    <div class="form-group">
                        <label for="homeNumber">Numer domu</label>
                        <input type="text" class="form-control" id="homeNumber" name="homeNumber"
                               aria-describedby="homeNumber"
                               placeholder="Wpisz numer domu" value="${customer.homeNumber}">
                    </div>
                    <div class="form-group">
                        <label for="city">Miasto</label>
                        <input type="text" class="form-control" id="city" name="city" aria-describedby="city"
                               placeholder="Wpisz miasto" value="${customer.city}">
                    </div>
                    <div class="form-group">
                        <label for="zipCode">Kod pocztowy</label>
                        <input type="text" class="form-control" id="zipCode" name="zipCode" aria-describedby="zipCode"
                               placeholder="Wpisz kod pocztowy" value="${customer.zipCode}">
                    </div>
                    <div class="form-group">
                        <label for="country">Kraj</label>
                        <input type="text" class="form-control" id="country" name="country" aria-describedby="country"
                               placeholder="Wpisz kraj" value="${customer.country}">
                    </div>
                    <div class="form-group">
                        <label for="phone">Numer telefonu</label>
                        <input type="text" class="form-control" id="phone" name="phone" aria-describedby="phone"
                               placeholder="Wpisz numer telefonu" value="${customer.phone}">
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
    function validateCreateCustomerForm() {
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