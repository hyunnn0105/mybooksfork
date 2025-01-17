<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
        <!-- reset css -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">

        <!-- linear icons -->
        <!-- https://linearicons.com/free#cdn -->
        <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
        <!-- fontawesome css: https://fontawesome.com -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

        <!-- naver font -->
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css" rel="stylesheet">
        <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-barun-gothic.css" rel="stylesheet">

        <!-- custom css -->
        <link rel="stylesheet" href="/css/booksave.css">
        <!-- bootstrap css -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">

        
        
        <!-- custom js -->
        <!-- <script src="/js/config.js" defer></script> -->
        <!-- bootstrap js -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" defer></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>
<!-- jquery -->
<script
  src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
  integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
  crossorigin="anonymous"></script>
  <style>
    .form-group{
        width: 500px;
    }
    .fileDrop {
        height: 200px;
        width: 100%;
        background: green;
    }
    .uploaded-list {
        height: 50px;
        width: 100%;
        background: rgb(82, 164, 227);
    }
  </style>


<body>
    <div id="page" style="padding: 50px;">


        <div id="wrapper">
            <h1> 책 등록하기 </h1>

            <form action="/book/write" method="post" id="write-form" >
                <div class="input-table">

                    <div class="left">
                        <h3>이미지 링크</h3>
                    </div>
                    <!-- 이미지 링크 추가하기** -->
                    <!-- drag&drop 영역 추가해주기 -->
                    <div class="right">
                        <input type="text" name="bookImg">
                    </div>


                    <div class="left">
                        <h3>플랫폼</h3>
                    </div>
                    <div class="right">
                        <select name="platformId" class="form-select" aria-label="Default select example">
                            <option value="0" disabled>플랫폼을 선택해주세요</option>
                            <option value="1" selected>카카오 페이지</option>
                            <option value="2">네이버 시리즈</option>
                            <option value="3">리디북스</option>
                            <option value="4">문피아</option>
                            <option value="5">조아라</option>
                            <option value="6">미분류</option>
                        </select>

                    </div>



                    <div class="left">
                        <h3>책 제목</h3>
                    </div>
                    <div class="right">
                        <input id="book-name-input" maxlength="50" type="text" name="bookTitle">
                    </div>

                    <div class="left">
                        <h3>작가</h3>
                    </div>
                    <div class="right">
                        <input id="writer-input" maxlength="50" type="text" name="writer">
                    </div>



                    <div class="pageCount">
                        <div class="left">
                            <h3>현재 회차</h3>
                        </div>
                        <div class="right">
                            <input id="cur-page" maxlength="5" type="number" name="curPage">
                        </div>

                        <div class="left">
                            <h3>전체 회차</h3>
                        </div>
                        <div class="right">
                            <input id="total-page" maxlength="5" type="number" name="totalPage">
                        </div>
                    </div>

                        <div class="theend">
                            <div class="left">
                                <h3>연재중</h3>
                            </div>
                            <div class="right" id="half">
                                <input type="radio" name="theEnd" value="1" checked>
                            </div>
                            <div class="left">
                                <h3>완결</h3>
                            </div>
                            <div class="right" id="half">
                                <input type="radio" name="theEnd" value="0">
                            </div>

                        </div>

                            <div class="left">
                                <h3>별점</h3>
                            </div>

                            <div class="right">
                                <select name="starRate" class="form-select" aria-label="Default select example">
                                    <option disabled>별점을 선택해주세요</option>
                                    <option value="1" selected>★☆☆☆☆</option>
                                    <option value="2">★★☆☆☆</option>
                                    <option value="3">★★★☆☆</option>
                                    <option value="4">★★★★☆</option>
                                    <option value="5">★★★★★</option>
                                </select>
                            </div>

                            <div class="left">
                                <h3>한줄평</h3>
                            </div>
                            <div class="right">
                                <textarea id="book-comment" name="bookComment" maxlength="50" rows="2"></textarea>
                            </div>
                            <!-- Drag and Drop 영역 -->
<%--                            <div class="form-group" style="height: 50px;">--%>
<%--                                <div class="fileDrop">--%>
<%--                                    <span>Drop Here!!</span>--%>
<%--                                </div>--%>
<%--                                <div class="uploadDiv">--%>
<%--                                    <input type="file" name="files" id="ajax-file" style="display:none;" enctype="multipart/form-data">--%>
<%--                                </div>--%>
<%--                                <!-- 업로드된 파일의 썸네일을 보여줄 영역 -->--%>
<%--                                <div class="uploaded-list">--%>

<%--                                </div>--%>
<%--                            </div>--%>


                </div>

                <div id="button" style="padding: 10px;">
                    <button type="button" id="reg-btn" class="btn btn-outline-danger" style="float: right;">등록</button>
                </div>
                

            </form>

            <button type="button" id="list-btn" class="btn btn-secondary btn-sm" onclick="location.href='/book/list'">목록</button>
            <!-- <a href="/book/list">목록</a> -->
        </div>
    </div>






    <script>


        (function () {
            function validateFormValue() {

                const $bookNameInput = document.getElementById('book-name-input');
                const $writerInput = document.getElementById('writer-input');
                let flag = false;

                const $curPage = document.getElementById('cur-page');
                const $totalPage = document.getElementById('total-page');
                console.log('b: ', $bookNameInput.value);
                console.log('w: ', $writerInput.value);
                
                if ($bookNameInput.value.trim() === '') {
                    alert('제목은 필수값입니다');
                    return false;
                } else if ($writerInput.value.trim() === '') {
                    alert('작가는 필수값입니다');
                    return false;
                } 
        
                
                if($curPage.value.trim() === '') {
                    $curPage.value = 0;
                } else if($curPage.value < 0 ) {
                    alert('현재 페이지 값을 확인해주세요.');
                    return false;
                } 

                if($totalPage.value.trim() === '') {
                    $totalPage.value = 0;
                    return false;
                } else if($totalPage.value < 0){
                    alert('총 페이지 값을 다시 한번 확인해주세요.');
                    return false;
                } 
                


                if(+$totalPage.value < +$curPage.value){
                    console.log($totalPage.value);
                    console.log($curPage.value);
                    alert('총 페이지 값을 다시 한번 확인해주세요.');
                    return false;
                } 

                return true;


            }


            // 게시물 입력값 검증
        const $regBtn = document.getElementById('reg-btn');

            $regBtn.onclick = e => {
                // 입력값을 제대로 채우지 않았는지 확인
                if (!validateFormValue()) {
                    return;
                }

                // const $formSelect = document.querySelector('.form-select');
                // console.log($formSelect.value); 
                // if($formSelect.value === 0) {
                //     $formSelect.selectedIndex = 1;
                // }
                // console.log($formSelect.value);

                // 필수 입력값을 잘 채웠으면 폼을 서브밋한다.
                const $form = document.getElementById('write-form');
                $form.submit();
            };
        })();
    </script>


</body>

</html>