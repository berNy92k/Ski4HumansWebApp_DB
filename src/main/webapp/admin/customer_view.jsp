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

    <div style="width: 98%; margin: 30px auto 0">
        <div style="background-color: #d7e6f3; padding: 15px 15px 15px 40px; margin-bottom: 50px">
            <h2 style="color: #0d0e48">#${customer.customerId} ${customer.firstName} ${customer.lastName}</h2>
        </div>
        <div style="display: flex">
            <div style="margin-right: 15px; width: 500px;">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h4 style="color: #b60001">ID:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.customerId}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Data rejestracji:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.registerDate}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Email:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.email}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Imię:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.firstName}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Nazwisko:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.lastName}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Ulica:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.street}</h3>
                    </li>
                </ul>
            </div>
            <div style="width: 50px"></div>
            <div style="margin-right: 15px; width: 500px;">
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Numer domu:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.homeNumber}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Miasto:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.city}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Kod pocztowy:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.zipCode}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Kraj:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.country}</h3>
                    </li>
                    <li class="list-group-item">
                        <h4 style="color: #b60001">Numer telefonu:</h4> &nbsp;
                        <h3 style="color: #0d0e48">${customer.phone}</h3>
                    </li>
                </ul>
            </div>
            <div style="width: 100px; margin-left: 20px">
                <div>
                    <h5>Akcje:</h5>
                </div>
                <div>
                    <p><a href="../admin/editCustomer?id=${customer.customerId}">EDYCJA</a></p>
                    <p><a href="javascript:deleteCustomer(${customer.customerId})">USUŃ</a></p>
                </div>
            </div>
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
    function deleteCustomer(customerId) {
        if (confirm("Czy jestes pewny ? Jeżeli się zgodzisz klient z '" + customerId + "' id zostanie usunięty")) {
            window.location = '../admin/deleteCustomer?id=' + customerId;
        }
    }
</script>
</html>