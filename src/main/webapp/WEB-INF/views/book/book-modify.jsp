<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
</head>


<body>
    <h1> # modify page </h1>


 <form action="/book/modify" method="post">
        <ul>
                <input type="hidden" value="${modibook.bookNo}" name="bookNo">
            <label>
                <input type="text" name="${modibook.platformId}" name="platformId">
            </label>            

            <label>
                <input type="text" value="${modibook.platformId}" name="platformId">
            </label>
            <label>
                <input type="text" value="${modibook.bookTitle}" name="bookTitle">
            </label>
            <label>
                <input type="text" value="${modibook.writer}" name="writer">
            </label>
            <label>
                <input type="text" value="${modibook.starRate}" name="starRate">
            </label>
            <label>
                <input type="text" value="${modibook.curPage}" name="curPage">
            </label>
            <label>
                <input type="text" value="${modibook.totalPage}" name="totalPage">
            </label>
            <label>
                <input type="text" value="${modibook.bookComment}" name="bookComment">
            </label>
        </ul>
        <button type="post">
            수정완료
        </button>
    
    </form>

    <div class="modi-remo-list">
        <a href="/book/list/">목록</a>
    </div>



</body>

</html>