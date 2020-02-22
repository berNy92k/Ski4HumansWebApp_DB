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

    <title>Ski4Humans - Create User</title>
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
            <c:if test="${user != null}">
                <p>Uzupełnij wszytkie pola w celu wykonania edycji.</p>
            </c:if>
            <c:if test="${user == null}">
                <p>Uzupełnij wszytkie pola w celu dodania nowego użytkownika.</p>
            </c:if>
            &nbsp;
        </div>

        <div>
            <c:if test="${user != null}">
            <form action="../admin/updateUser" method="post" id="updateUserForm">
                <input type="hidden" id="userId" name="userId" value="${user.userId}">
                </c:if>
                <c:if test="${user == null}">
                <form action="../admin/createNewUser" method="post" id="createUserForm"
                      onsubmit="return validateCreateUserForm()">
                    </c:if>

                    <div class="form-group">
                        <label for="email">Adres email</label>
                        <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp"
                               placeholder="Wpisz adres email" value="${user.email}">
                        <small id="emailHelp" class="form-text text-muted">
                            Nigdy nikomu nie udostępnimy Twojego adresu email.
                        </small>
                    </div>
                    <div class="form-group">
                        <label for="fullName">Nazwa użytkownika</label>
                        <input type="text" class="form-control" id="fullName" name="fullName"
                               placeholder="Wpisz nazwę użytkownika"
                               value="${user.fullName}">
                    </div>
                    <div class="form-group">
                        <label for="password">Hasło</label>
                        <input type="password" class="form-control" id="password" name="password"
                               placeholder="Wpisz hasło"
                               value="${user.password}">
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
    function validateCreateUserForm() {
        var email = document.getElementById("email");
        var fullName = document.getElementById("fullName");
        var password = document.getElementById("password");

        if (email.value.length == 0) {
            alert("Email sie wymagany");
            email.focus();
            return false;
        }
        if (fullName.value.length == 0) {
            alert("Nazwa użytkownika wymagana");
            fullName.focus();
            return false;
        }
        if (password.value.length == 0) {
            alert("Hasło jest wymagane");
            password.focus();
            return false;
        }

        return true;
    }
</script>
</html>