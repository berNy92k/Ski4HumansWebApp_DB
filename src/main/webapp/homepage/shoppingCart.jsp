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

    <div style="width: 98%; margin: 20px auto 0;">

        <div align="center">
            <h5>Koszyk</h5>
        </div>

        <div align="center">
            <h5><p style="color: #950002;">${message}</p></h5>
        </div>

        <form action="../homepage/updateEquipmentInShoppingCart" method="get" id="shoppingCart">
            <div>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Zdjęcie</th>
                        <th scope="col">Nazwa</th>
                        <th scope="col">Nazwa producenta</th>
                        <th scope="col">Kwota [zł] / szt.</th>
                        <th scope="col">Ilość</th>
                        <th scope="col">Kwota [zł]</th>
                        <th scope="col">Akcje</th>
                    </tr>
                    </thead>
                    <c:if test="${cart.totalQuantityOfEquipments == 0}">
                        <tbody>
                        <tr>
                            <th scope="row">${status.index + 1}</th>
                            <td></td>
                            <td>BRAK</td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        </tbody>
                    </c:if>
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
                                <td>${cartSingleEq.key.price}</td>
                                <td>
                                    <label id="quantity${status.index + 1}">
                                        <input type="text" id="quantity${status.index + 1}"
                                               name="quantity${status.index + 1}"
                                               value="${cartSingleEq.value}">
                                    </label>
                                    <input type="hidden" id="eqId${status.index + 1}"
                                           name="eqId${status.index + 1}"
                                           value="${cartSingleEq.key.equipmentId}">
                                </td>
                                <td>${cartSingleEq.value * cartSingleEq.key.price}</td>

                                <td>
                                    <a href="javascript:deleteEquipment(${cartSingleEq.key.equipmentId})">USUŃ</a>
                                    <p>
                                        <a href="../viewEquipment?id=${cartSingleEq.key.equipmentId}">PODGLĄD</a>
                                    </p>
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <th></th>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>${cart.totalQuantity}</td>
                            <td>${cart.totalAmount}</td>
                            <td><b>TOTAL</b></td>
                        </tr>
                        </tbody>
                    </c:if>
                </table>
            </div>
            <div>
                <table style="border: 2px solid #2b57b4; border-radius: 10px; padding: 1ex;">
                    <tr>
                        <td>
                            <button type="submit">Zaaktualizauj dane</button>
                        </td>
                        <td>
                            <a href="../homepage/clear_shopping_cart">
                                <input type="button" value="Wyczyść kartę"/>
                            </a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/">
                                <input type="button" value="Kontynuuj zakupy"/>
                            </a>
                        </td>
                        <td>
                            <a href="../homepage/checkout">
                                <input type="button" value="Zakup"/>
                            </a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>

        <footer>
            <div style="height: 30px"></div>
            <jsp:include page="footer.jsp"/>
        </footer>
    </div>
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