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

    <div class="width98Margin20auto0">

        <%-- Form for transaction --%>
        <form action="../homepage/continueCheckout" method="post" id="shoppingCart">

            <div class="displayFlex">
                <%-- Shopping cart --%>
                <div class="width48percentage">
                    <div align="center" class="clearBoth">
                        <h5>Koszyk</h5>
                    </div>
                    <table class="table table-striped">
                        <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Zdjęcie</th>
                            <th scope="col">Nazwa</th>
                            <th scope="col">Producent</th>
                            <th scope="col">Ilość</th>
                            <th scope="col">Kwota [zł]</th>
                        </tr>
                        </thead>
                        <c:if test="${cart.totalQuantityOfEquipments != 0}">
                            <tbody>
                            <c:forEach var="cartSingleEq" items="${cart.shoppingCart}" varStatus="status">
                                <tr>
                                    <th scope="row">${status.index + 1}</th>
                                    <td>
                                        <c:if test="${cartSingleEq.key.image != null}">
                                            <img src="data:image/jpg;base64,${cartSingleEq.key.base64Image}" width="55">
                                        </c:if>
                                        <c:if test="${cartSingleEq.key.image == null}">
                                            Brak zdjęcia
                                        </c:if>
                                    </td>
                                    <td>${cartSingleEq.key.name}</td>
                                    <td>
                                        <c:if test="${cartSingleEq.key.manufacturer != null}">
                                            ${cartSingleEq.key.manufacturer.manufacturerName}
                                        </c:if>
                                        <c:if test="${cartSingleEq.key.manufacturer == null}">
                                            Brak informacji o producencie
                                        </c:if>
                                    </td>
                                    <td>
                                            ${cartSingleEq.value}
                                    </td>
                                    <td>${cartSingleEq.value * cartSingleEq.key.price}</td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <th></th>
                                <td></td>
                                <td></td>
                                <td><b>TOTAL</b></td>
                                <td>${cart.totalQuantity}</td>
                                <td>${cart.totalAmount}</td>
                            </tr>
                            </tbody>
                        </c:if>
                    </table>
                </div>

                <%-- Address --%>
                <div class="width48percentage marginLeft4percentage">
                    <div align="center">
                        <h5>Adres do wysyłki / Dane kontaktowe</h5>
                    </div>

                    <div class="displayFlex">
                        <div class="width48percentage">
                            <div class="form-group">
                                <label for="email">Email</label>
                                <input type="text" class="form-control" id="email" name="email" aria-describedby="email"
                                       placeholder="Wpisz email" value="${loggedCustomer.email}">
                            </div>
                            <div class="form-group">
                                <label for="firstName">Imię</label>
                                <input type="text" class="form-control" id="firstName" name="firstName"
                                       aria-describedby="firstName"
                                       placeholder="Wpisz imię" value="${loggedCustomer.firstName}">
                            </div>
                            <div class="form-group">
                                <label for="lastName">Nazwisko</label>
                                <input type="text" class="form-control" id="lastName" name="lastName"
                                       aria-describedby="lastName"
                                       placeholder="Wpisz nazwisko" value="${loggedCustomer.lastName}">
                            </div>
                            <div class="form-group">
                                <label for="street">Ulica</label>
                                <input type="text" class="form-control" id="street" name="street"
                                       aria-describedby="street"
                                       placeholder="Wpisz nazwę ulicy" value="${loggedCustomer.street}">
                            </div>
                            <div class="form-group">
                                <label for="homeNumber">Numer domu</label>
                                <input type="text" class="form-control" id="homeNumber" name="homeNumber"
                                       aria-describedby="homeNumber"
                                       placeholder="Wpisz numer domu" value="${loggedCustomer.homeNumber}">
                            </div>
                        </div>
                        <div class="width48percentage marginLeft4percentage">
                            <div class="form-group">
                                <label for="city">Miasto</label>
                                <input type="text" class="form-control" id="city" name="city" aria-describedby="city"
                                       placeholder="Wpisz miasto" value="${loggedCustomer.city}">
                            </div>
                            <div class="form-group">
                                <label for="zipCode">Kod pocztowy</label>
                                <input type="text" class="form-control" id="zipCode" name="zipCode"
                                       aria-describedby="zipCode"
                                       placeholder="Wpisz kod pocztowy" value="${loggedCustomer.zipCode}">
                            </div>
                            <div class="form-group">
                                <label for="country">Kraj</label>
                                <input type="text" class="form-control" id="country" name="country"
                                       aria-describedby="country"
                                       placeholder="Wpisz kraj" value="${loggedCustomer.country}">
                            </div>
                            <div class="form-group">
                                <label for="phone">Numer telefonu</label>
                                <input type="text" class="form-control" id="phone" name="phone" aria-describedby="phone"
                                       placeholder="Wpisz numer telefonu" value="${loggedCustomer.phone}">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Finish transaction --%>
            <c:if test="${cart.totalQuantityOfEquipments != 0}">
                <table class="border2b57b4BorderRadius10Padding1ex">
                    <tr>
                        <td>
                            <button type="submit">
                                Przejdź dalej
                            </button>
                        </td>
                        <td>
                            <button type="button" class="btn btn-primary" id="cancel"
                                    onclick="javascript:history.go(-1);">
                                Anuluj
                            </button>
                        </td>
                    </tr>
                </table>
            </c:if>
        </form>
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
        if (confirm("Czy jestes pewny ? Jeżeli się zgodzisz cała pozycja zostanie usunięta")) {
            window.location = '../homepage/deleteFromShoppingCart?eq=' + equipmentId;
        }
    }
</script>
</html>