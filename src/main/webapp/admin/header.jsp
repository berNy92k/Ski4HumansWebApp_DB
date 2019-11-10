<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    response.setCharacterEncoding("UTF-8");
    request.setCharacterEncoding("UTF-8");
%>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom border-top box-shadow"
     style="font-size: 10px">
    <div class="my-auto mr-md-auto">
        <img class="mb-2" src="../images/poland.png" width="15" height="10"
             style="margin-right: 5px">Wybierz język
    </div>
    <div class="my-auto mr-md-auto">
        Do kolejnej wysyłki pozostało: 12:56:11
    </div>

    <div style="font-size: 12px;">
        Welcome,
        <c:if test="${sessionScope.userEmail != null}">
            <c:out value="${sessionScope.userEmail}, "/>
            <a href="../admin/logout">Logout</a>
        </c:if>
        <c:if test="${sessionScope.userEmail == null}">
            <c:out value="Login as administrator to have access"/>
        </c:if>
    </div>
</div>

<div class="header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <div style="display: flex; justify-content: space-between; margin-bottom: 40px">
        <div>
            <a href="../homepage/index.jsp">
                <img class="mb-2" src="../images/logoAdmin.png" width="330" height="30" alt="logo">
            </a>
        </div>
        <div style="display: flex; justify-content: space-between; position: marker">
            <form class="searchForm" action="#">
                <input type="text" placeholder="Szukaj.." name="search" size="60"
                       style="font-weight: revert; border-radius: 15px; min-height: 35px;
                       max-height: 35px ;border-color: rgba(109,163,207,0.99)">
                <button type="submit" style="border-radius: 15px;  min-height: 35px; max-height: 35px">Szukaj
                </button>
            </form>
            <a href="#">
                <img class="mb-2" src="../images/register.png" width="25" height="25" style="margin-top: 5px
                         ;margin-left: 15px" alt="register">
            </a>
            <a href="#">
                <img class="mb-2" src="../images/mojeKonto.PNG" width="25" height="24" style="margin-top: 5px
                         ;margin-left: 15px" alt="mojeKonto">
            </a>
            <a href="#">
                <img class="mb-2" src="../images/koszyk.PNG" width="25" height="25"
                     style="margin-top: 5px;margin-left: 15px" alt="koszyk">
            </a>
        </div>
    </div>

    <div class="menu">
        <div class="btn-toolbar" role="toolbar" aria-label="Toolbar with button groups">
            <div class="btn-group mr-2" role="group" aria-label="First group">
                <div class="dropdown">
                    <button class="dropbtn" style="border-top-left-radius: 5px; border-bottom-left-radius: 5px">
                        <a href="admin/skis">NARTY</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="admin/shoes">BUTY</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="admin/womenSkis">KIJE</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="admin/womenSkis">KASKI</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="admin/womenSkis">GOGLE</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="admin/womenSkis">RĘKAWICE</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="admin/womenSkis">ODZIEŻ TERMOAKTYWNA</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">
                        <a href="../admin/manufacturer">PRODUCENCI</a>
                    </button>
                </div>
                <div class="dropdown">
                    <button class="dropbtn" style="border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
                        INNE INFORMACJE
                    </button>
                    <div class="dropdown-content">
                        <a href="../admin/users">UŻYTKOWNICY</a>
                        <a href="../admin/category">KATEGORIE</a>
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