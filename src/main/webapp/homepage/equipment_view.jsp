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
        <jsp:directive.include file="header.jsp"/>
    </header>

    <div class="width98Margin30auto40">
        <div class="displayFlex">
            <div class="marginRight15Width610Border0d0e48">
                <img src="data:image/jpg;base64, ${equipment.base64Image}" width="600px">
            </div>
            <div class="width50"></div>
            <div class="width500">
                <div class="marginBottom40px">
                    <h3 class="color0d0e48"><b>${equipment.name}</b></h3>
                </div>
                <div class="marginBottom40displayFlex">
                    <h6 class="colorb60001">Cena:</h6> &nbsp;
                    <h2 class="colorb60001"><b>${equipment.price}</b> zł</h2>
                </div>
                <div class="marginBottom40px">
                    <h6>Długość (cm) / Rozmiar (EU)</h6>
                    <h3>${equipment.lengthOrSize}</h3>
                </div>
                <div class="marginBottom40displayFlex">
                    <div>
                        <div>
                            <h5>Producent:</h5>
                        </div>
                        <div>
                            <h3>${equipment.manufacturer.manufacturerName}</h3>
                        </div>
                    </div>
                    <div class="marginLeft50">
                        <img src="data:image/jpg;base64,${equipment.manufacturer.base64Image}" width="250px">
                    </div>
                </div>
                <div class="marginBottom40displayFlex">
                    <div>
                        <div>
                            <h5>Ocena:</h5>
                            <c:if test="${reviewsAverageFull != null}">
                                <c:forEach begin="1" end="6" var="i">
                                    <c:if test="${i <= reviewsAverageFull}">
                                        <img src="../images/stars/fullStar.png" alt="fullStar" width="25px">
                                    </c:if>
                                    <c:if test="${i > reviewsAverageFull}">
                                        <c:if test="${reviewsAverageHalf == 1 && i == (reviewsAverageFull + 1)}">
                                            <img src="../images/stars/halfStar.png" alt="fullStar" width="25px">
                                        </c:if>
                                        <c:if test="${reviewsAverageHalf != 1 || i > (reviewsAverageFull + 1)}">
                                            <img src="../images/stars/emptyStar.png" alt="fullStar" width="25px">
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${reviewsAverageFull == null}">
                                Brak oceny
                            </c:if>
                        </div>
                    </div>
                </div>
                <div class="marginBottom40TextAlignCenter">
                    <a href="../homepage/addToShoppingCart?eq=${equipment.equipmentId}">
                        <button type="button" class="btn btn-primary" id="cancel">
                            DODAJ DO KOSZYKA
                        </button>
                    </a>
                </div>
                <div class="marginBottom20px">
                    <table class="margin0autoTableLayoutFixedWhiteSpaceNormalImportantWordWrapBreakWord">
                        <thead>
                        <tr class="backgroundColorRgba0117255023">
                            <th>
                                <h7>Krótki opis produktu:</h7>
                            </th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td>
                                <h5>${equipment.shortDescription}</h5>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="clearBothMarginTop40">
            <table class="margin0autoTableLayoutFixedWhiteSpaceNormalImportantWordWrapBreakWordWidth1200">
                <thead>
                <tr class="backgroundColorRgba0117255023">
                    <th>
                        <h5>Opis produktu: </h5>
                    </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        <h4>${equipment.longDescription}</h4>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>

    <jsp:include page="../homepage/footerWithHelp.jsp"/>

    <div class="clearBothMarginTop50">
        <table class="table table-striped margin0autoTableLayoutFixedWhiteSpaceNormalImportantWordWrapBreakWordWidth1200">
            <thead>
            <tr>
                <th scope="col">
                    <div>
                        <div class="displayFlex">
                            <div class="width900">
                                <h5>Recenzja: </h5>
                            </div>
                            <c:if test="${sessionScope.customerLogged != null}">
                                <div>
                                    <a href="../homepage/preCreateReview?eqId=${equipment.equipmentId}">
                                        <h7>Dodaj nową recenzję</h7>
                                    </a>
                                </div>
                            </c:if>
                        </div>
                        <div class="displayFlex fontSize10">
                            <div class="width295">Data wpisu:</div>
                            <div class="marginLeft5MarginRight5">|</div>
                            <div class="width790">Tytuł:</div>
                            <div class="marginLeft5MarginRight5">|</div>
                            <div class="width195">Autor:</div>
                        </div>
                    </div>

                </th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${reviews == null}">
                <tr>
                    <td>
                        <div>
                            Brak komentarzy.
                        </div>
                    </td>
                </tr>
            </c:if>
            <c:if test="${reviews != null}">
                <c:forEach items="${reviews}" var="review">
                    <tr>
                        <td>
                            <div>
                                <div class="displayFlex">
                                    <div class="width295">${review.reviewTime}</div>
                                    <div class="marginLeft5MarginRight5">|</div>
                                    <div class="width790">${review.headline}</div>
                                    <div class="marginLeft5MarginRight5">|</div>
                                    <div class="width195">${review.customer.firstName} ${review.customer.lastName.substring(0,1)}.</div>
                                </div>
                                <div class="clearBothDisplayFlexMarginTop10">
                                    <div class="width1090">${review.comment}</div>
                                    <div class="marginLeft5MarginRight5">|</div>
                                    <div class="width195">
                                        Ocena:
                                        <c:forEach begin="1" end="6" var="i">
                                            <c:if test="${i <= review.rating}">
                                                <img src="../images/stars/fullStar.png" alt="fullStar" width="12px">
                                            </c:if>
                                            <c:if test="${i > review.rating}">
                                                <img src="../images/stars/emptyStar.png" alt="emptyStar" width="12px">
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            </tbody>
        </table>
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
</html>