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
        <a href="logIn.jsp" style="margin-right: 15px">Zaloguj się</a>
        <a href="register.jsp" style="color:red">Zarejestruj się</a>
    </div>
</div>

<div class="header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
    <div style="display: flex; justify-content: space-between; margin-bottom: 40px">
        <div>
            <a href=""><img class="mb-2" src="../images/logo.png" width="250" height="30" alt="logo"></a>
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
                        NARTY
                    </button>
                    <div class="dropdown-content">
                        <a href="#">NARTY DAMSKIE</a>
                        <a href="#">NARTY MĘSKIE</a>
                        <a href="#">NARTY JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">BUTY</button>
                    <div class="dropdown-content">
                        <a href="#">BUTY DAMSKIE</a>
                        <a href="#">BUTY MĘSKIE</a>
                        <a href="#">BUTY JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">KIJE</button>
                    <div class="dropdown-content">
                        <a href="#">KIJE DAMSKIE</a>
                        <a href="#">KIJE MĘSKIE</a>
                        <a href="#">KIJE UNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">KASKI</button>
                    <div class="dropdown-content">
                        <a href="#">KASKI DAMSKIE</a>
                        <a href="#">KASKI MĘSKIE</a>
                        <a href="#">KASKI JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">GOGLE</button>
                    <div class="dropdown-content">
                        <a href="#">GOGLE DAMSKIE</a>
                        <a href="#">GOGLE MĘSKIE</a>
                        <a href="#">GOGLE JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">RĘKAWICE</button>
                    <div class="dropdown-content">
                        <a href="#">RĘKAWICE DAMSKIE</a>
                        <a href="#">RĘKAWICE MĘSKIE</a>
                        <a href="#">RĘKAWICE JUNIORSKIE</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn">ODZIEŻ TERMOAKTYWNA</button>
                    <div class="dropdown-content">
                        <a href="#">BIELIZNA DAMSKA</a>
                        <a href="#">BIELIZNA MĘSKA</a>
                    </div>
                </div>
                <div class="dropdown">
                    <button class="dropbtn"
                            style="border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
                        PRODUCENCI
                    </button>
                    <div class="dropdown-content">
                        <a href="#">Link 1</a>
                        <a href="#">Link 2</a>
                        <a href="#">Link 3</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="lineUnderMenu"></div>