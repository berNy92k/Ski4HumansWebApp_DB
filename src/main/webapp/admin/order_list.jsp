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
        <jsp:include page="header.jsp"/>
    </header>

    <div style="width: 98%; margin: 0 auto">

        <div align="center">
            <h5><p style="color: #950002;">${message}</p></h5>
        </div>

        <div>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col">CustomerID</th>
                    <th scope="col">ShippingAddressID</th>
                    <th scope="col">Metoda płatności</th>
                    <th scope="col">Kwota [zł]</th>
                    <th scope="col">Status zamówienia</th>
                    <th scope="col">Data zamówienia</th>
                    <th scope="col">Akcje</th>
                </tr>
                </thead>
                    <tbody>
                    <c:forEach var="order" items="${orderList}" varStatus="status">
                        <tr>
                            <th scope="row">${status.index + 1}</th>
                            <td>${order.orderId}</td>
                            <td>${order.customer.customerId}</td>
                            <td>${order.shippingAddress.shippingAddressId}</td>
                            <td>${order.paymentMethod}</td>
                            <td>${order.total}</td>
                            <td>${order.status}</td>
                            <td>${order.orderDate}</td>
                            <td>
                                <p><a href="javascript:deleteOrder(${order.orderId})">USUŃ</a></p>
                                <p><a href="../admin/viewOrder?id=${order.orderId}">PODGLĄD</a></p>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
            </table>
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

<script>
    function deleteOrder(orderId) {
        if (confirm("Czy jestes pewny ? Jeżeli się zgodzisz zamówienie z '" + orderId + "' id oraz powiązane z " +
            "nim informację zostaną usunięte")) {

            window.location = '../admin/deleteOrder?id=' + orderId;
        }
    }
</script>
</html>