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
        <div align="center" class="clearBoth">
            <h2>Podsumowanie zamówienia</h2>
        </div>

        <%-- Form for transaction --%>
        <form action="../homepage/payment" method="post" id="shoppingCart">

            <%-- hidden object for final transaction --%>
            <input type="hidden" id="transactionData" name="transactionData" value="${transactionData}">

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
                        <tbody>
                        <c:forEach var="cartSingleEq" items="${transactionData.shoppingCart.shoppingCart}"
                                   varStatus="status">
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
                            <td>${transactionData.shoppingCart.totalQuantity}</td>
                            <td>${transactionData.shoppingCart.totalAmount}</td>
                        </tr>
                        </tbody>
                    </table>
                </div>

                <%-- Address --%>
                <div class="width48percentage marginLeft4percentage">
                    <div align="center">
                        <h5>Adres do wysyłki / Dane kontaktowe</h5>
                    </div>

                    <div class="displayFlex">
                        <div class="width50percentage">
                            <table class="table table-striped">
                                <tbody>
                                <tr>
                                    <th scope="row">Email:</th>
                                    <td>${transactionData.shippingAddress.email}</td>
                                    <th scope="row"></th>
                                    <td></td>
                                </tr>
                                <tr>
                                    <th scope="row">Imię:</th>
                                    <td>${transactionData.shippingAddress.firstName}</td>
                                    <th scope="row">Miasto:</th>
                                    <td>${transactionData.shippingAddress.city}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Nazwisko:</th>
                                    <td>${transactionData.shippingAddress.lastName}</td>
                                    <th scope="row">Kod pocztowy:</th>
                                    <td>${transactionData.shippingAddress.zipCode}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Ulica:</th>
                                    <td>${transactionData.shippingAddress.streetName}</td>
                                    <th scope="row">Państwo:</th>
                                    <td>${transactionData.shippingAddress.country}</td>
                                </tr>
                                <tr>
                                    <th scope="row">Numer:</th>
                                    <td>${transactionData.shippingAddress.houseOrApartmentNr}</td>
                                    <th scope="row">Telefon:</th>
                                    <td>${transactionData.shippingAddress.phone}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <%-- Finish transaction --%>
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
</html>