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

    <title>Ski4Humans - Create Manufacturer</title>

    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script type="text/javascript" src="../js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../js/jquery-ui.min.js"></script>
</head>

<body>

<div class="container">
    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <div class="width500pxMargin0auto">
        <div align="center">
            &nbsp;
            <c:if test="${manufacturer != null}">
                <p>Zmień wartości pól w celu wykonania edycji producenta.</p>
            </c:if>
            <c:if test="${manufacturer == null}">
                <p>Dodaj wartości pól w celu stworzenia nowego producenta.</p>
            </c:if>
            &nbsp;
        </div>

        <div>
            <c:if test="${manufacturer != null}">
            <form action="../admin/updateManufacturer" method="post" id="updateManufacturerForm"
                  enctype="multipart/form-data" onsubmit="return validateCreateManufacturerForm()">
                <input type="hidden" id="manufacturerId" name="manufacturerId" value="${manufacturer.manufacturerId}">
                </c:if>
                <c:if test="${manufacturer == null}">
                <form action="../admin/createNewManufacturer" method="post" id="createManufacturerForm"
                      enctype="multipart/form-data" onsubmit="return validateCreateManufacturerForm()">
                    </c:if>

                    <div class="form-group">
                        <label for="manufacturerName">Nazwa producenta</label>
                        <input type="text" class="form-control" id="manufacturerName" name="manufacturerName"
                               placeholder="Wpisz nazwę producenta" value="${manufacturer.manufacturerName}">
                    </div>
                    <div class="form-group">
                        <label for="description">Opis</label>
                        <textarea rows="5" cols="68" id="description"
                                  name="description">${manufacturer.description}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="manufacturerImage">Zdjęcie</label>
                        <input type="file" class="form-control" id="manufacturerImage" name="manufacturerImage">
                        <img id="smallPic" alt="Podgląd zdjęcia" class="width300 marginTop5"
                             src="data:image/jpg;base64, ${manufacturer.base64Image}">
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
</body>

<script type="text/javascript">

    function validateCreateManufacturerForm() {
        var manufacturerName = document.getElementById("manufacturerName");
        var description = document.getElementById("description");
        var manufacturerImage = document.getElementById("manufacturerImage");

        if (manufacturerName.value.length == 0) {
            alert("Nazwa producenta jest wymagana");
            manufacturerName.focus();
            return false;
        }
        if (description.value.length == 0) {
            alert("Opis jest wymagany");
            description.focus();
            return false;
        }
        <c:if test="${manufacturer == null}">
        if (manufacturerImage.value.length == 0) {
            alert("Zdjęcie jest wymagane");
            manufacturerImage.focus();
            return false;
        }
        </c:if>

        return true;
    }

    $(document).ready(function () {
        $('#manufacturerImage').change(function () {
            showSmallImage(this);
        });
    });

    function showSmallImage(fileInput) {
        var file = fileInput.files[0];

        var reader = new FileReader();

        reader.onload = function (ev) {
            $('#smallPic').attr('src', ev.target.result)
        };

        reader.readAsDataURL(file);
    }
</script>
</html>