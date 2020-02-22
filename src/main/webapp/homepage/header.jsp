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
        <%-- TODO - finish time by using JS --%>
        Do kolejnej wysyłki pozostało: 12:56:11
    </div>

    <div class="fontSize12">
        <c:if test="${sessionScope.customerLogged != null}">
            Witaj,
            <c:out value="${sessionScope.customerLogged.email} || "/>
            <a href="../homepage/logout">Wyloguj się</a>
        </c:if>
        <c:if test="${sessionScope.customerLogged == null}">
            <a href="../homepage/login" class="marginRight15">Zaloguj się</a>
            <a href="../homepage/register" class="colorRed">Zarejestruj się</a>
        </c:if>
    </div>
</div>

<div class="header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <div class="displayFlex justifyContentSpaceBetween marginBottom40px">
        <div>
            <a href="../"><img class="mb-2" src="../images/logo.png" width="250" height="30" alt="logo"></a>
        </div>
        <div class="displayFlex justifyContentSpaceBetween positionMarker">
            <form class="searchForm" action="../search">
                <input type="text" placeholder="Szukaj.." name="search" size="60"
                       class="fontWeightRevertBorRad15MinH35MaxH35BorCol109163207099">
                <button type="submit" class="borderRadius15MinHeight35MaxHeight35">Szukaj</button>
            </form>
            <c:if test="${sessionScope.customerLogged == null}">
                <a href="../homepage/register">
                    <img class="mb-2 marginLeft5MarginRight15" src="../images/register.png" width="25" height="25"
                         alt="register">
                </a>
            </c:if>
            <c:if test="${sessionScope.customerLogged != null}">
                <a href="../homepage/myAccount">
                    <img class="mb-2 marginLeft5MarginRight15" src="../images/mojeKonto.PNG" width="25" height="24"
                         alt="mojeKonto">
                </a>
            </c:if>
            <a href="../homepage/shoppingCart">
                <img class="mb-2 marginLeft5MarginRight15" src="../images/koszyk.PNG" width="25" height="25"
                     alt="koszyk">
            </a>
        </div>
    </div>

    <div class="menu">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group mr-2" role="group" aria-label="First group">
                <div class="dropdown">
                    <button class="dropbtn borderTopLeftRadius5BorderBottomLeftRadius5">
                        NARTY
                    </button>
                    <div class="dropdown-content">
                        <a href="../equipment?eq=skis&sex=woman">NARTY DAMSKIE</a>
                        <a href="../equipment?eq=skis&sex=man">NARTY MĘSKIE</a>
                        <a href="../equipment?eq=skis&sex=child">NARTY JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">BUTY</button>
                    <div class="dropdown-content">
                        <a href="../equipment?eq=skiShoes&sex=woman">BUTY DAMSKIE</a>
                        <a href="../equipment?eq=skiShoes&sex=man">BUTY MĘSKIE</a>
                        <a href="../equipment?eq=skiShoes&sex=child">BUTY JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">KIJE</button>
                    <div class="dropdown-content">
                        <a href="../equipment?eq=skiPoles&sex=woman">KIJE DAMSKIE</a>
                        <a href="../equipment?eq=skiPoles&sex=man">KIJE MĘSKIE</a>
                        <a href="../equipment?eq=skiPoles&sex=child">KIJE UNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">KASKI</button>
                    <div class="dropdown-content">
                        <a href="../equipment?eq=skiHelmets&sex=woman">KASKI DAMSKIE</a>
                        <a href="../equipment?eq=skiHelmets&sex=man">KASKI MĘSKIE</a>
                        <a href="../equipment?eq=skiHelmets&sex=child">KASKI JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">GOGLE</button>
                    <div class="dropdown-content">
                        <a href="../equipment?eq=skiGoggles&sex=woman">GOGLE DAMSKIE</a>
                        <a href="../equipment?eq=skiGoggles&sex=man">GOGLE MĘSKIE</a>
                        <a href="../equipment?eq=skiGoggles&sex=child">GOGLE JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">RĘKAWICE</button>
                    <div class="dropdown-content">
                        <a href="../equipment?eq=skiGloves&sex=woman">RĘKAWICE DAMSKIE</a>
                        <a href="../equipment?eq=skiGloves&sex=man">RĘKAWICE MĘSKIE</a>
                        <a href="../equipment?eq=skiGloves&sex=child">RĘKAWICE JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">ODZIEŻ TERMOAKTYWNA</button>
                    <div class="dropdown-content">
                        <a href="../equipment?eq=thermoactiveClothing&sex=woman">ODZIEŻ DAMSKA</a>
                        <a href="../equipment?eq=thermoactiveClothing&sex=man">ODZIEŻ MĘSKA</a>
                        <a href="../equipment?eq=thermoactiveClothing&sex=child">ODZIEŻ JUNIORSKA</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn borderTopRightRadius5BorderBottomRightRadius5">
                        <a href="../manufacturer">PRODUCENCI</a>
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="lineUnderMenu"></div>