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
        <c:if test="${category != null}">
            <p>Please change fields value to update category.</p>
        </c:if>
        <c:if test="${category == null}">
            <p>Please update all fields to create new category.</p>
        </c:if>
        &nbsp;
    </div>

    <div>
        <c:if test="${category != null}">
            <form action="../admin/updateCategory" method="post" id="createCategoryForm" onsubmit="return validateCreateCategoryForm()">
            <input type="hidden" id="categoryId" name="categoryId" value="${category.categoryId}">
        </c:if>
        <c:if test="${category == null}">
             <form action="../admin/createNewCategory" method="post" id="createCategoryForm" onsubmit="return validateCreateCategoryForm()">
        </c:if>

            <div class="form-group">
                <label for="name">Category name</label>
                <input type="text" class="form-control" id="name" name="name" aria-describedby="nameCategory"
                       placeholder="Enter category name" value="${category.name}">
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
            <button type="button" class="btn btn-primary" id="cancel">Cancel</button>
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
    function validateCreateCategoryForm() {
        var name = document.getElementById("name");

        if (name.value.length == 0) {
            alert("Name category is required");
            name.focus();
            return false;
        }

        return true;
    }
</script>
</html>