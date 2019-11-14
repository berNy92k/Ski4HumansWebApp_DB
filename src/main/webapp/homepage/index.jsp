<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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

    <title>Ski4Humans - Home Page - WELCOME</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
</head>

<body>
<div class="container">
    <header>
        <jsp:directive.include file="header.jsp"/>
    </header>

    <div>
        <div style="width: 500px; height: 750px; float: left; margin: 10px 10px 10px 0;">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="../images/skiiPic/Webp.net-resizeimage.png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../images/skiiPic/Webp.net-resizeimage(2).png" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="../images/skiiPic/Webp.net-resizeimage(1).png" class="d-block w-100" alt="...">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>

        <div style="width: 690px; height: 750px; float: left; margin: 10px 0 10px 10px;">
            <div style="height: 365px; margin: 0px 0 10px 0px;">
                <div id="carouselExampleControls1" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="../images/skiiPic/alpine_skiing_hafjell_photo_gisle_johnsen_9bcc93d0-4346-4704-a0a7-0fb9f287d63e.jpg"
                                 height="365" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <a class="carousel-control-prev" href="#carouselExampleControls1" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="carousel-control-next" href="#carouselExampleControls1" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div style="margin: 10px 0 10px 0;">
                <div style="float: left; height: 365px;width: 335px;margin: 10px 10px 0 0;">
                    <div id="carouselExampleControls2" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../images/skiiPic/alpine_skiing_hafjell_photo_gisle_johnsen_9bcc93d0-4346-4704-a0a7-0fb9f287d63e.jpg"
                                     height="365" width="345" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls2" role="button"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls2" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div style="float: left; height: 365px;width: 335px;margin: 10px 0 0 10px;">
                    <div id="carouselExampleControls3" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../images/skiiPic/alpine_skiing_hafjell_photo_gisle_johnsen_9bcc93d0-4346-4704-a0a7-0fb9f287d63e.jpg"
                                     height="365" width="345" class="d-block w-100" alt="...">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleControls3" role="button"
                           data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleControls3" role="button"
                           data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="margin-bottom: 30px">
        <div class="firstMessage">
            <div class="lineUnderMessage"></div>
            <p class="pTitle" style="font-size: 25px">SKLEP NARCIARSKI SKI4HUMANS.PL - NAJLEPSZY SPRZĘT DLA
                NARCIARZY</p>
            <p style="font-size: 14px;text-align: justify">Sklep Ski4Humans to ponad 20 lat doświadczeń związanych ze
                sprzedażą sprzętu zimowego.<br>
                Dzięki ogromnej wiedzy, pasji i determinacji z sukcesem budujemy pozycję lidera sprzedaży nart i sprzętu
                narciarskiego on-line w Polsce. Każdego roku zdobywamy kolejne tysiące zadowolonych klientów. Jako
                pierwszy sklep narciarski w Polsce rozpoczęliśmy sprzedaż nart carvingowych. Już od 1997 roku głęboko
                wierzyliśmy, że nie jest to jedynie tymczasowa moda, ale przyszłość, dlatego rozpoczęliśmy szeroką
                edukację polskich narciarzy, czego efekty widać gołym okiem.
                <br><br>
                Nasz sklep narciarski oferuje Państwu narty najlepszych producentów, wysokiej jakości buty narciarskie,
                niezawodne i bezpieczne kaski, a także gogle i wiele innych akcesoriów niezbędnych na stoku. Znane marki
                to nasza mocna strona: Atomic, Head, Volkl, Rossignol, Salomon, Uvex to tylko niektóre z brandów, które
                znajdziesz w ofercie naszego sklepu.</p>
        </div>

        <c:if test="${messageEmpty == false}">
            <div class="firstMessage">
                <div class="lineUnderMessage"></div>
                <p class="pTitle" style="font-size: 25px">PRZYKŁADOWE NASZE PRODUKTY</p>
                <div style="width: 95%; margin: 0 auto">
                    <c:forEach var="equipment" items="${equipmentShortList}">
                        <div style="width: 250px; border: 1px solid rgba(0,7,255,0.02); display: inline-block;
                                    margin: 14px;">
                            <div style="width: 145px; margin: 0 auto">
                                <a href="viewEquipment?id=${equipment.equipmentId}">
                                    <img class="book-small" src="data:image/jpg;base64,${equipment.base64Image}"
                                         width="145px" alt="Podgląd sprzętu"/>
                                </a>
                            </div>
                            <div style="text-align: center; vertical-align: center; margin-top: 5px">
                                <div style="height: 115px">
                                    <b style="font-size: 10px"> ${equipment.name}</b>
                                </div>
                                <div>
                                    <b style="color: #bf0004;font-size: 10px">${equipment.price} [zł]</b>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>

    <jsp:include page="../homepage/footerWithHelp.jsp"/>

    <footer>
        <div style="height: 30px"></div>
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
</html>