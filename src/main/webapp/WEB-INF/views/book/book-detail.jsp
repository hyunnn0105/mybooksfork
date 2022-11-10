<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <%@ include file="../include/static-head.jsp" %>
    <!-- naver font -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">


    <style>
        @font-face {
            font-family: 'KOTRAHOPE';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/KOTRAHOPE.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

        .notosanskr * {
            font-family: 'Noto Sans KR', sans-serif;
        }

        body {
            position: relative;
            background: #eee;
            font-family: 'NanumSquareRound', sans-serif;
        }

        body a {
            text-decoration: none;
            color: #000;
            font-weight: bold;
        }
        #content-box{
            display: flex;
        }
    </style>
</head>

<body>
    <div class="wrap">
        <header id="header">
            <div class="inner-header">
                <span class="lnr lnr-pencil"></span>
                <h1> My Books</h1>
            </div>
        </header>


        <div class="detail-page">
            <div class="content">
                <div id="content-box">
                    <div class="img">
                        <img src="${book.bookImg}" class="rounded mx-auto d-block custom-img" alt="책 표지">
                    </div>

                    <div class="detail-content">
                        <!-- ${book.theEnd} 추가하기 -->
                        <div class="left">
                            <h2>플랫폼</h2>
                        </div>
                        <div class="right">
                            <h3>${book.platformName}</h3>
                        </div>
                        <div class="left">
                            <h2>제목</h2>
                        </div>
                        <div class="right">
                            <h3>${book.bookTitle}</h3>

                        </div>
                        <div class="left">
                            <h2>작가</h2>
                        </div>
                        <div class="right">
                            <h3>${book.writer}</h3>
                        </div>
                        <div class="left">
                            <h2>별점</h2>
                        </div>
                        <div class="right">
                            <h3>${book.starRate}</h3>
                        </div>
                        <!-- <div class="page"> -->
                        <div class="left">
                            <h2>현재 회차</h2>
                        </div>
                        <div class="right">
                            <h3>${book.curPage}</h3>
                        </div>
                        <div class="left">
                            <h2>전체 회차</h2>
                        </div>
                        <div class="right">
                            <h3 class="bookmark-check-page">${book.totalPage}</h3>
                        </div>
                    <!-- </div> -->
                    </div>
                </div>

                <div class="book-comment">
                    <h2 class="a">한줄평</h2>
                    <div class="bookComment">
                        <h4>${book.bookComment}</h4>
                    </div>

                </div>


            </div>



            <ul class="modi-remo-list detail-btn">
                <li>
                    <a href="/book/modify?bookNo=${book.bookNo}" class="btn-atag">
                        <button type="button" class="btn btn-warning btn-yellow btn-custom">
                            <h3>수정</h3>
                        </button>
                    </a>
                </li>
                <li>
                    <a href="/book/delete?bookNo=${book.bookNo}" class="btn-atag">
                        <button type="button" class="btn btn-warning btn-yellow btn-custom">
                            <h3>삭제</h3>
                        </button>
                    </a>
                </li>
                <li>
                    <a href="/book/list" class="btn-atag">
                        <button type="button" class="btn btn-warning btn-yellow btn-custom">
                            <h3>목록</h3>
                        </button>
                    </a>
                </li>
            </ul>
        </div>

        <!-- <div class="div-null"></div> -->

        <div class="mkme-head">
            <div class="bookmark-container">
                <h1 class="bookmarkHead">북마크</h1>
                <div>
                    <!-- 북마크 등록 -->
                    <ul class="bookmark-custom">
                        <li>
                            <form id="bookmark-insert-form" action="/book/bookmark-save" method="post">
                                <br>
                                <input type="hidden" name="bookNo" value="${book.bookNo}" readonly>
                                <label class="form-floating mb-3">
                                    페이지 <input type="text" name="bookmarkPage" id="bookmarkPage-input" maxlength="5"
                                        size="3">
                                    <!-- <input class="form-control" id="bookmarkPage-input floatingInput" maxlength="5" type="text" name="bookmarkPage"> -->
                                    <!-- <label for="floatingInput">Page</label> -->
                                </label>
                                <br>
                                <label class="form-floating mb-3">
                                    <!-- <br><input type="text" id="bookmarkContent-input" name="bookmarkContent" size=""> -->
                                    북마크 내용 <br><textarea name="bookmarkContent" id="bookmarkContent-input" cols="30"
                                        rows="5"></textarea>
                                    <!-- <input class="form-control" type="text" id="bookmarkContent-input floatingInput" name="bookmarkContent"> -->
                                    <!-- <label for="floatingInput">Content</label> -->
                                </label>
                                <br>
                                <button id="bookmark-reg-btn" type="button">등록</button>
                                <!-- <button class="btn btn-warning" id="bookmark-reg-btn" type="button"></button> -->
                            </form>
                        </li>
                    </ul>


                    <!-- 북마크 리스트 -->
                    <ul>
                        <li id="bookmark-list">

                            <c:forEach var="mk" items="${bmkl}">
                                <div class="bookmark-list-wrap d-flex flex-column">
                                    <label>
                                        <input type="hidden" name="bookNo" value="${mk.bookNo}" readonly>
                                    </label>
                                    <label>
                                        <!--  <input type="text" name="bookmarkNo" value="${mk.bookmarkNo}" readonly> -->
                                        <span class="hide" name="bookmarkNo">${mk.bookmarkNo}</span>
                                    </label>
                                    <label>
                                        <!-- <input maxlength="5" type="text" name="bookmarkPage" value="${mk.bookmarkPage}"> -->
                                        <span name="bookmarkPage">${mk.bookmarkPage}</span>p
                                        <br>
                                    </label>
                                    <label>
                                        <!-- <input type="text" name="bookmarkContent" value="${mk.bookmarkContent}"> -->
                                        <br><span name="bookmarkContent">${mk.bookmarkContent}</span>
                                    </label>
                                    <label>
                                        <input type="hidden" name="regDate" value="${mk.regDate}" readonly>
                                    </label>
                                    <button type="button" class="btn bookmark-btn-event" data-bs-toggle="modal"
                                        data-bs-target="#exampleModal">
                                        편집
                                    </button>
                                </div>
                            </c:forEach>
                        </li>
                    </ul>


                </div>
            </div>

            <div class="bookmeme-container">
                <h2 class="bookmemoHead">메모</h2>
                <!-- 메모 등록 -->
                <div>
                    <ul class="bookmemo-custom">
                        <li>
                            <form id="bookmemo-insert-form" action="/book/bookmemo-save" method="post">
                                <br><br><br>
                                <input type="hidden" name="bookNo" value="${book.bookNo}" readonly>
                                <label>
                                    메모 <br>
                                    <!-- <input type="text" id="bookmemoContent-input" name="bookMemoContent"> -->
                                    <textarea name="bookMemoContent" id="bookmemoContent-input" cols="30"
                                        rows="5"></textarea>
                                </label>
                                <button id="bookmemo-reg-btn" type="button">등록</button>
                            </form>
                        </li>
                    </ul>

                    <!-- 메모 리스트 -->
                    <ul>
                        <li id="memo-list">
                            <c:forEach var="ml" items="${bmml}">
                                <div class="bookmemo-list-wrap d-flex flex-column">
                                    <label>
                                        <input type="hidden" name="bookNo" value="${ml.bookNo}" readonly>
                                    </label>
                                    <label>
                                        <!-- <input type="text" name="bookMemoNo" value="${ml.bookMemoNo}" readonly> -->
                                        <span name="bookMemoNo" hidden>${ml.bookMemoNo}</span>
                                        <br>
                                    </label>
                                    <label>
                                        <!-- <input type="text" name="bookMemoContent" value="${ml.bookMemoContent}"> -->
                                        <span name="bookMemoContent">${ml.bookMemoContent}</span>
                                        <br>
                                    </label>
                                    <label>
                                        <input type="hidden" name="regDate" value="${ml.regDate}" disabled>
                                    </label>
                                    <button type="button" class="btn memo-btn-custom" data-bs-toggle="modal"
                                        data-bs-target="#memo">
                                        편집
                                    </button>
                                </div>
                            </c:forEach>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- footer -->
        <div id="footer">
            <h3>Copyright 2021. My Books. all rights reserved.</h3>
        </div>
    </div>


    <!-- Button trigger modal -->
    <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
        Launch demo modal
    </button> -->

    <!-- bookmark Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="bookmark-form">
                    <form id="bookmark-modify-form" action="/book/bookmark-modify" method="post">
                        <label>
                            <input type="hidden" name="bookNo" readonly>
                        </label>
                        <label>
                            북마크 번호 : <input type="text" maxlength="5" name="bookmarkNo" readonly>
                        </label>
                        <label>
                            페이지 : <input id="bookmarkPage-modify" type="text" maxlength="5" name="bookmarkPage">
                        </label>
                        <label>
                            내용 : <input id="bookmarkContent-modify" type="text" name="bookmarkContent">
                        </label>
                        <br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="bookmark-modify-btn" type="button" class="btn btn-primary">수정</button>
                    <%-- </form> --%>
                    <form action="/book/bookmark-delete" method="post">
                        <input id="bookmarkDelete" type="hidden" name="bookmarkNo" readonly>
                        <button type="submit" class="btn btn-primary">삭제</button>
                    </form>
                </div>
            </div>
        </div>
    </div>



    <!-- memo modal -->
    <div class="modal fade" id="memo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body" id="bookmemo-form">
                    <form id="bookmemo-modify-form" action="/book/bookmemo-modify" method="post">
                        <label>
                            <input type="hidden" name="bookNo" readonly>
                        </label>
                        <label>
                            bookMemoNo : <input type="text" maxlength="5" name="bookMemoNo" readonly>
                        </label>
                        <label>
                            bookMemoContent : <input id="bookmemoContent-modify" type="text" name="bookMemoContent">
                        </label>
                        <br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button id="bookmemo-modify-btn" type="button" class="btn btn-primary">수정</button>
                    </form>
                    <form action="/book/bookmemo-delete" method="post">
                        <input id="bookmemoDelete" type="hidden" name="bookmemoNo" readonly>
                        <button type="submit" class="btn btn-primary">삭제</button>
                    </form>
                </div>
            </div>
        </div>

    </div>







</body>

</html>