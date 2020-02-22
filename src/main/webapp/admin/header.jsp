<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom border-top box-shadow fontSize10">
    <div class="my-auto mr-md-auto">
        <img class="mb-2 marginRight5" src="../images/poland.png" width="15" height="10">Wybierz język
    </div>
    <div class="my-auto mr-md-auto">
        Do kolejnej wysyłki pozostało: 12:56:11
    </div>

    <div class="fontSize12">
        Witaj,
        <c:if test="${sessionScope.userEmail != null}">
            <c:out value="${sessionScope.userEmail}, "/>
            <a href="../admin/logout">Wyloguj się</a>
        </c:if>
        <c:if test="${sessionScope.userEmail == null}">
            <c:out value="Zaloguj się jako administrator aby mieć dostęp"/>
        </c:if>
    </div>
</div>

<div class="header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <div class="displayFlex justifyContentSpaceBetween marginBottom40px">
        <div>
            <a href="../admin/">
                <img class="mb-2" src="../images/logoAdmin.png" width="330" height="30" alt="logo">
            </a>
        </div>
        <div class="displayFlex justifyContentSpaceBetween positionMarker">
            <form class="search" action="../search">
                <input type="text" placeholder="Szukaj.." name="search" size="60"
                       class="fontWeightRevert borderRadius15MinHeight35MaxHeight35 borderColorRgba109163207099">
                <button type="submit" class="borderRadius15MinHeight35MaxHeight35">Szukaj</button>
            </form>
        </div>
    </div>

    <div class="menu">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group mr-2" role="group" aria-label="First group">
                <div class="dropdown">
                    <button class="dropbtn borderTopLeftRadius5BorderBottomLeftRadius5">
                        <a href="../admin/skis.jsp">NARTY</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/skiShoes.jsp">BUTY</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/skiPoles.jsp">KIJE</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/skiHelmets.jsp">KASKI</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/skiGoggles.jsp">GOGLE</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/skiGloves.jsp">RĘKAWICE</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/thermoactiveClothing.jsp">ODZIEŻ TERMOAKTYWNA</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/manufacturer">PRODUCENCI</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn borderTopRightRadius5BorderBottomRightRadius5">
                        INNE INFORMACJE
                    </button>
                    <div class="dropdown-content">
                        <a href="../admin/users">UŻYTKOWNICY</a>
                        <a href="../admin/categories">KATEGORIE</a>
                        <a href="../admin/customers">KLIENCI</a>
                        <a href="../admin/reviews">RECENZJE</a>
                        <a href="../admin/orders">ZAMÓWIENIA</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="lineUnderMenu"></div>