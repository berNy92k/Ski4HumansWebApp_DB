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

    <title>Ski4Humans - home page - WELCOME</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <div align="center">
        &nbsp;
        <c:if test="${user != null}">
            <p>Please change fields value to update user.</p>
        </c:if>
        <c:if test="${user == null}">
            <p>Please update all fields to create new user.</p>
        </c:if>
        &nbsp;
    </div>

    <div>
        <c:if test="${user != null}">
            <form action="../admin/updateUser" method="post" id="updateUserForm" onsubmit="return validateCreateUserForm()">
            <input type="hidden" id="userId" name="userId" value="${user.userId}">
        </c:if>
        <c:if test="${user == null}">
             <form action="../admin/createNewUser" method="post" id="createUserForm" onsubmit="return validateCreateUserForm()">
        </c:if>

            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" class="form-control" id="email" name="email" aria-describedby="emailHelp"
                       placeholder="Enter email" value="${user.email}">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.
                </small>
            </div>
            <div class="form-group">
                <label for="fullName">Full name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter full name"
                       value="${user.fullName}">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter password"
                       value="${user.password}">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="button" class="btn btn-primary" id="cancel" onclick="javascript:history.go(-1);">Cancel</button>
        </form>
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

<script type="text/javascript">
    function validateCreateUserForm() {
        var email = document.getElementById("email");
        var fullName = document.getElementById("fullName");
        var password = document.getElementById("password");

        if (email.value.length == 0) {
            alert("Email is required");
            email.focus();
            return false;
        }
        if (fullName.value.length == 0) {
            alert("Full name is required");
            fullName.focus();
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