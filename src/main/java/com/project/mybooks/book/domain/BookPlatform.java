package com.project.mybooks.book.domain;

import lombok.*;

@Setter
@Getter
@ToString
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class BookPlatform {

    private String userId; // userID (나중에)
    private int importance;  // 중요도 DEFAULT 0 (나중에)
    private String bookNo;  // 글번호(PK)
    private int platformId; // 플랫폼 아이디
    private String platformName; // 플랫폼 이름
    private String bookTitle; // 책 제목
    private String writer; // 작가
    private int starRate; // 별점
    private String bookComment; // 한줄평
    private int curPage; // 현재 회차
    private int totalPage; // 총 회차
    private String theEnd; // 완결 여부
    private Data regDate; // 등록 날짜

}