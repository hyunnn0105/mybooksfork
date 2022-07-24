// ---------- 함수, 변수 선언부 ---------- //

function test() {
    // console.log('js test!!');
}


// star-rate의 숫자를 별로 바꾼다
function convertStarRate() {
    // console.log("convertStarRate 함수 시작");
    const $starArr = [...document.querySelectorAll('.star-rate')];

    for (let star of $starArr) {
        let str = '';
        let starNum = star.textContent;
        // console.log(starNum);
        if (starNum > 5) starNum = 5;

        for (let i = 0; i < starNum; i++) {
            str += '★';
        }
        for (let i = 0; i < 5 - starNum; i++) {
            str += '☆';
        }
        star.textContent = str;
    }
}

// the-end의 숫자 따라 배지의 배경색과 텍스트가 바뀐다

/*
1 카카오 페이지   배경: #f9e000	글자색: #333
2 네이버 시리즈   배경: #03c75a	글자색: #000
3 리디북스        배경: #1E9EFF	글자색: #fff
4 문피아          배경: #5aa2dd/ #5f9bd1 글자색: #333
5 조아라          배경: #004c99 글자색: #a5f72c
6 기타            배경: #088F8F 글자색: #fff
*/
function convertPlatformBadge() {
    console.log('convert Platform Badge 함수 시작');
    const $platformArr = [...document.querySelectorAll('.platform')];
    for (let $platform of $platformArr) {
        const num = $platform.dataset.platformId;
        console.log(num);
        switch (num) {
            case '1':
                $platform.style.background = '#f9e000';
                $platform.style.color = '#333';
                break;
            case '2':
                $platform.style.background = '#03c75a';
                $platform.style.color = '#000';
                break;
            case '3':
                $platform.style.background = '#1E9EFF';
                $platform.style.color = '#fff';
                break;
            case '4':
                $platform.style.background = '#5aa2dd';
                $platform.style.color = '#333';
                break;
            case '5':
                $platform.style.background = '#004c99';
                $platform.style.color = '#a5f72c';
                break;
            case '6':
                $platform.style.background = '#088F8F';
                $platform.style.color = '#ffc107';
                break;
            default:
                break;
        }

    }
}


/*
0: 완결 .bg-danger / 
1: 연재 .bg-secondary
*/
function convertTheEndBadge() {
    // console.log('convert the end Badge 함수 시작');
    const $theEndArr = [...document.querySelectorAll('.the-end')];
    for (let $theEnd of $theEndArr) {
        const num = $theEnd.textContent;
        if (num == 0) {
            $theEnd.textContent = '완결';
            $theEnd.classList = 'the-end badge badge bg-danger';
        } else if (num == 1) {
            $theEnd.textContent = '연재중';
            $theEnd.classList = 'the-end badge badge bg-secondary';
        } else {
            $theEnd.textContent = '';
        }

    }
}





// ------------------ 실행부 ------------------//

(function () {
    test();
    convertStarRate();
    convertTheEndBadge();
    convertPlatformBadge();
})();