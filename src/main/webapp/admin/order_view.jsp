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

    <div class="width98Margin30auto0 displayFlex">
        <div class="marginRight10 width94percentage">
            <div>
                <h4 class="colorb60001">Dane klienta: </h4>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Email</th>
                        <th scope="col">Imie</th>
                        <th scope="col">Nazwisko</th>
                        <th scope="col">Telefon</th>
                        <th scope="col">Akcje</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${order.customer.customerId}</td>
                        <td>${order.customer.email}</td>
                        <td>${order.customer.firstName}</td>
                        <td>${order.customer.lastName}</td>
                        <td>${order.customer.phone}</td>
                        <td>
                            <a href="../admin/viewCustomer?id=${order.customer.customerId}">PODGLĄD</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div>
                <h4 class="colorb60001">Dane do wysyłki: </h4>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Email</th>
                        <th scope="col">Imie</th>
                        <th scope="col">Nazwisko</th>
                        <th scope="col">Miasto i kod pocztowy</th>
                        <th scope="col">Adres</th>
                        <th scope="col">Państwo</th>
                        <th scope="col">Telefon</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${order.shippingAddress.shippingAddressId}</td>
                        <td>${order.shippingAddress.email}</td>
                        <td>${order.shippingAddress.firstName}</td>
                        <td>${order.shippingAddress.lastName}</td>
                        <td>${order.shippingAddress.city} ${order.shippingAddress.zipCode}</td>
                        <td>${order.shippingAddress.streetName} ${order.shippingAddress.houseOrApartmentNr}</td>
                        <td>${order.shippingAddress.country}</td>
                        <td>${order.shippingAddress.phone}</td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div>
                <h4 class="colorb60001">Zamówiony sprzęt: </h4>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">ID</th>
                        <th scope="col">Nazwa</th>
                        <th scope="col">Nazwa producenta</th>
                        <th scope="col">Sztuk</th>
                        <th scope="col">Kwota [zł]</th>
                        <th scope="col">Zdjęcie</th>
                        <th scope="col">Akcje</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="singleEq" items="${order.orderEquipmentDetails}" varStatus="status">
                        <tr>
                            <th scope="row">${status.index + 1}</th>
                            <td>${singleEq.equipment.equipmentId}</td>
                            <td>${singleEq.equipment.name}</td>
                            <td>${singleEq.equipment.manufacturer.manufacturerName}</td>
                            <td>${singleEq.quantity}</td>
                            <td>${singleEq.subtotal}</td>
                            <td>
                                <img src="data:image/jpg;base64,${singleEq.equipment.base64Image}"
                                     width="80">
                            </td>
                            <td>
                                <p><a href="../admin/viewEquipment?id=${singleEq.equipment.equipmentId}">PODGLĄD</a>
                                </p>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <th scope="row"></th>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>${order.totalOfOrder}</td>
                        <td>${order.total}</td>
                        <td></td>
                        <td>SUMA</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="width100">
            <div>
                <h5>Akcje:</h5>
            </div>
            <div>
                <p><a href="javascript:deleteOrder(${order.orderId})">USUŃ</a></p>
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
    function deleteOrder(orderId) {
        if (confirm("Czy jestes pewny ? Jeżeli się zgodzisz zamówienie z '" + orderId + "' id oraz powiązane z " +
            "nim informację zostaną usunięte")) {

            window.location = '../admin/deleteOrder?id=' + orderId;
        }
    }
</script>
</html>