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
        <div class="indexCarousel1">
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

        <div class="indexCarousel2">
            <div class="indexCarousel2a">
                <div id="carouselExampleControls1" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="../images/skiiPic/alpine_skiing_hafjell_photo_gisle_johnsen_9bcc93d0-4346-4704-a0a7-0fb9f287d63e.jpg"
                                 height="365" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="../images/skiiPic/i.jpg"
                                 height="365" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="../images/skiiPic/image.jpg"
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
            <div class="indexCarousel2b">
                <div class="indexCarousel2ba">
                    <div id="carouselExampleControls2" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../images/skiiPic/Webp.net-resizeimage(5).jpg"
                                     height="365" width="345" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../images/skiiPic/Webp.net-resizeimage(6).jpg"
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
                <div class="indexCarousel2bb">
                    <div id="carouselExampleControls3" class="carousel slide" data-ride="carousel">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                                <img src="../images/skiiPic/Webp.net-resizeimage(4).jpg"
                                     height="365" width="345" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                                <img src="../images/skiiPic/Webp.net-resizeimage(3).jpg"
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

    <div class="marginBottom30px">
        <div class="firstMessage">
            <div class="lineUnderMessage"></div>
            <p class="pTitle">SKLEP NARCIARSKI SKI4HUMANS.PL - NAJLEPSZY SPRZĘT DLA
                NARCIARZY</p>
            <p class="indexFirstMessage1">Sklep Ski4Humans to ponad 20 lat doświadczeń związanych ze
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
                <p class="pTitle">PRZYKŁADOWE NASZE PRODUKTY</p>
                <div class="width95margin0auto">
                    <c:forEach var="equipment" items="${equipmentShortList}">
                        <div class=width250border07255006displayInlineBlockMargin14>
                            <div class="indexFirstMessage2aa">
                                <a href="../viewEquipment?id=${equipment.equipmentId}">
                                    <img class="book-small" src="data:image/jpg;base64,${equipment.base64Image}"
                                         width="145px" alt="Podgląd sprzętu"/>
                                </a>
                            </div>
                            <div class="textAlignCenterVerticalAlignCenterMarginTop5">
                                <div class="indexFirstMessage2aba">
                                    <b class="fontSize10"> ${equipment.name}</b>
                                </div>
                                <div>
                                    <b class="indexFirstMessage2abc">${equipment.price} [zł]</b>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </c:if>
    </div>

    <jsp:include page="../homepage/footerWithHelp.jsp"/>

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
</html>