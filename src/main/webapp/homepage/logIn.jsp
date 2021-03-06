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
            <p>Uzupełnij wszystkie pola aby zalogować się jako użytkownik</p>
            &nbsp;
        </div>

        <c:if test="${message != null}">
            <div align="center">
                <h5><p class="color950002">${message}</p></h5>
            </div>
        </c:if>

        <form action="../homepage/login" method="post" onsubmit="return validateLoginForm()">
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Podaj email">
            </div>
            <div class="form-group">
                <label for="password">Hasło:</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Podaj hasło">
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
    function validateLoginForm() {
        var email = document.getElementById("email");
        var password = document.getElementById("password");

        if (email.value.length == 0) {
            alert("Email is required");
            email.focus();
            return false;
        }
        if (password.value.length == 0) {
            alert("Password is required");
            password.focus();
            return false;
        }

        return true;
    }
</script>
</html>