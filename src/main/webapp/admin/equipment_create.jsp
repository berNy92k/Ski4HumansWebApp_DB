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

    <title>Ski4Humans - Create Equipment</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>

<div class="container">
    <header>
        <jsp:include page="header.jsp"/>
    </header>

    <div style="width: 1200px; margin: 0 auto">
        <div align="center">
            &nbsp;
            <c:if test="${equipment != null}">
                <p>Uzupełnij wszytkie pola w celu wykonania edycji.</p>
            </c:if>
            <c:if test="${equipment == null}">
                <p>Uzupełnij wszytkie pola w celu dodania nowego sprzętu.</p>
            </c:if>
            &nbsp;
        </div>

        <div>
            <c:if test="${equipment != null}">
            <form action="../admin/updateEquipment" method="post" id="updateEquipmentForm"
                  enctype="multipart/form-data" onsubmit="return validateCreateEquipmentForm()">
                <input type="hidden" id="equipmentId" name="equipmentId" value="${equipment.equipmentId}">
                </c:if>
                <c:if test="${equipment == null}">
                <form action="../admin/createNewEquipment" method="post" id="createEquipmentForm"
                      enctype="multipart/form-data" onsubmit="return validateCreateEquipmentForm()">
                    </c:if>

                    <div style="display: flex">
                        <div style="width: 550px">
                            <div class="form-group">
                                <label for="name">Nazwa sprzętu</label>
                                <input type="text" class="form-control" id="name" name="name"
                                       aria-describedby="nameEquipment" placeholder="Wpisz nazwę sprzętu"
                                       value="${equipment.name}">
                            </div>
                            <div class="form-group">
                                <label for="manufacturerName">Nazwa producenta</label>
                                <br>
                                <select class="form-control" id="manufacturerName" name="manufacturerName">
                                    <c:forEach items="${manufacturers}" var="manufacturer">
                                        <c:if test="${manufacturer.manufacturerId eq equipment.manufacturer.manufacturerId}">
                                            <option value="${manufacturer.manufacturerId}" selected>
                                        </c:if>
                                        <c:if test="${manufacturer.manufacturerId ne equipment.manufacturer.manufacturerId}">
                                            <option value="${manufacturer.manufacturerId}">
                                        </c:if>
                                        ${manufacturer.manufacturerName}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="price">Cena sprzętu [zł]</label>
                                <input type="number" class="form-control" id="price" name="price"
                                       aria-describedby="priceEquipment" placeholder="Podaj cenę za sprzęt"
                                       value="${equipment.price}">
                            </div>
                        </div>
                        <div style="margin-left: 50px; width: 550px">
                            <div class="form-group">
                                <label for="lengthOrSize">Długość sprzętu lub jego rozmiar</label>
                                <input type="text" class="form-control" id="lengthOrSize" name="lengthOrSize"
                                       aria-describedby="lengthOrSizeEquipment"
                                       placeholder="Podaj długość lub rozmiar (w zależności od sprzętu)"
                                       value="${equipment.lengthOrSize}">
                            </div>
                            <div class="form-group">
                                <label for="sex">Płeć</label>
                                <select class="form-control" id="sex" name="sex">
                                    <option value="MAN">MAN</option>
                                    <option value="WOMAN">WOMAN</option>
                                    <option value="CHILD">CHILD</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="categoryName">Kategoria</label>
                                <br>
                                <select class="form-control" id="categoryName" name="categoryName">
                                    <c:forEach items="${categories}" var="category">
                                        <c:if test="${category.categoryId eq equipment.category.categoryId}">
                                            <option value="${category.categoryId}" selected>
                                        </c:if>
                                        <c:if test="${category.categoryId ne equipment.category.categoryId}">
                                            <option value="${category.categoryId}">
                                        </c:if>
                                        ${category.name}
                                        </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div style="width: 1150px;">
                        <div class="form-group">
                            <label for="shortDescription">Krótki opis sprzętu</label>
                            <input type="text" class="form-control" id="shortDescription" name="shortDescription"
                                   aria-describedby="shortDescription"
                                   placeholder="Wpisz krótki opis sprzętu"
                                   value="${equipment.shortDescription}">
                        </div>
                    </div>
                    <div style="display: flex; margin-top: 30px">
                        <div style="width: 550px">
                            <div class="form-group">
                                <label for="longDescription">Długi opis sprzętu</label>
                                <textarea class="form-control" id="longDescription" name="longDescription"
                                          rows="30" placeholder="Wpisz długi opis sprzętu">
                                    ${equipment.longDescription}
                                </textarea>
                            </div>
                        </div>

                        <div style="margin-left: 50px;width: 550px">
                            <div class="form-group">
                                <label for="equipmentImage">Zdjęcie sprzętu</label>
                                <input type="file" class="form-control" id="equipmentImage" name="equipmentImage">
                                <img id="smallEquipmentImage" alt="Podgląd zdjęcia"
                                     style="width: 500px; margin-top: 10px"
                                     src="data:image/jpg;base64, ${equipment.base64Image}">
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Zatwierdź</button>
                    <button type="button" class="btn btn-primary" id="cancel" onclick="javascript:history.go(-1);">
                        Anuluj
                    </button>
                </form>
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

<script type="text/javascript">
    function validateCreateEquipmentForm() {
        var name = document.getElementById("name");
        var manufacturerName = document.getElementById("manufacturerName");
        var price = document.getElementById("price");
        var lengthOrSize = document.getElementById("lengthOrSize");
        var sex = document.getElementById("sex");
        var categoryName = document.getElementById("categoryName");
        var shortDescription = document.getElementById("shortDescription");
        var longDescription = document.getElementById("longDescription");
        var equipmentImage = document.getElementById("equipmentImage");

        if (name.value.length == 0) {
            alert("Nazwa sprzętu jest wymagana");
            name.focus();
            return false;
        }
        if (manufacturerName.value.length == 0) {
            alert("Producent jest wymagany");
            manufacturerName.focus();
            return false;
        }
        if (price.value.length == 0) {
            alert("Cena za produkt jest wymagana");
            price.focus();
            return false;
        }
        if (lengthOrSize.value.length == 0) {
            alert("Długość lub rozmiar jest wymagany");
            lengthOrSize.focus();
            return false;
        }
        if (sex.value.length == 0) {
            alert("Płeć jest wymagana");
            sex.focus();
            return false;
        }
        if (categoryName.value.length == 0) {
            alert("Nazwa kategorii jest wymagana");
            categoryName.focus();
            return false;
        }
        if (shortDescription.value.length == 0) {
            alert("Krótki opis jest wymagany");
            shortDescription.focus();
            return false;
        }
        if (longDescription.value.length == 0) {
            alert("Długi opis jest wymagany");
            longDescription.focus();
            return false;
        }
        <c:if test="${equipment == null}">
        if (equipmentImage.value.length == 0) {
            alert("Zdjęcie jest wymagane");
            equipmentImage.focus();
            return false;
        }
        </c:if>

        return true;
    }

    $(document).ready(function () {
        $('#equipmentImage').change(function () {
            showPreviewImage(this);
        })
    });

    function showPreviewImage(fileInput) {
        var file = fileInput.files[0];
        var reader = new FileReader();

        reader.onload = function (ev) {
            $('#smallEquipmentImage').attr('src', ev.target.result)
        };

        reader.readAsDataURL(file);
    }
</script>
</html>