package com.project.mybooks.book.domain;

import lombok.*;

import java.util.Date;
import java.util.List;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class BookPlatform {

    private String userId; // userID (나중에)
    private int importance;  // 중요도 DEFAULT 0
    private String bookNo;  // 글번호(PK)
    private int platformId; // 플랫폼 아이디
    private String platformName; // 플랫폼 이름
    private String bookTitle; // 책 제목
    private String writer; // 작가
    private int starRate; // 별점
    private String bookComment; // 한줄평
    private int curPage; // 현재 회차
    private int totalPage; // 총 회차
    private int theEnd; // 완결 여부
    private Date regDate; // 등록 날짜
    private String bookImg; // 책 표지 이미지
    private String platformLink; // 플랫폼 링크

    private List<String> fileName;
}