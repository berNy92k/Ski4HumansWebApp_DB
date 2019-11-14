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

    <div style="width: 1200px; margin: 0 auto">
        <div align="center">
            &nbsp;
            <c:if test="${equipment != null}">
                <p>Please change fields value to update equipment.</p>
            </c:if>
            <c:if test="${equipment == null}">
                <p>Please update all fields to create new equipment.</p>
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
                                <label for="name">Equipment name</label>
                                <input type="text" class="form-control" id="name" name="name"
                                       aria-describedby="nameEquipment" placeholder="Enter equipment name"
                                       value="${equipment.name}">
                            </div>
                            <div class="form-group">
                                <label for="manufacturerName">Manufacturer name</label>
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
                                <label for="price">Equipment price</label>
                                <input type="number" class="form-control" id="price" name="price"
                                       aria-describedby="priceEquipment" placeholder="Enter equipment price"
                                       value="${equipment.price}">
                            </div>
                        </div>
                        <div style="margin-left: 50px; width: 550px">
                            <div class="form-group">
                                <label for="lengthOrSize">Equipment length or size</label>
                                <input type="text" class="form-control" id="lengthOrSize" name="lengthOrSize"
                                       aria-describedby="lengthOrSizeEquipment"
                                       placeholder="Enter equipment length or size"
                                       value="${equipment.lengthOrSize}">
                            </div>
                            <div class="form-group">
                                <label for="sex">Equipment sex</label>
                                <select class="form-control" id="sex" name="sex">
                                    <option value="MAN">MAN</option>
                                    <option value="WOMAN">WOMAN</option>
                                    <option value="CHILD">CHILD</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="categoryName">Category</label>
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
                            <label for="shortDescription">Equipment short description</label>
                            <input type="text" class="form-control" id="shortDescription" name="shortDescription"
                                   aria-describedby="shortDescription"
                                   placeholder="Enter equipment short description"
                                   value="${equipment.shortDescription}">
                        </div>
                    </div>
                    <div style="display: flex; margin-top: 30px">
                        <div style="width: 550px">
                            <div class="form-group">
                                <label for="longDescription">Equipment long description</label>
                                <textarea class="form-control" id="longDescription" name="longDescription"
                                          rows="30" placeholder="Enter long description">
                                    ${equipment.longDescription}
                                </textarea>
                            </div>
                        </div>

                        <div style="margin-left: 50px;width: 550px">
                            <div class="form-group">
                                <label for="equipmentImage">Equipment image</label>
                                <input type="file" class="form-control" id="equipmentImage" name="equipmentImage">
                                <img id="smallEquipmentImage" alt="Preview equipment image"
                                     style="width: 500px; margin-top: 10px"
                                     src="data:image/jpg;base64, ${equipment.base64Image}">
                            </div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">Submit</button>
                    <button type="button" class="btn btn-primary" id="cancel" onclick="javascript:history.go(-1);">
                        Cancel
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

        if (name.value.length == 0) {
            alert("Name category is required");
            name.focus();
            return false;
        }

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