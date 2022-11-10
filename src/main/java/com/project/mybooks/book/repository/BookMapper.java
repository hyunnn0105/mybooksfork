package com.project.mybooks.book.repository;


import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.common.paging.Page;
import com.project.mybooks.common.search.Search;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BookMapper {

        // 게시글 쓰기 기능
        boolean save(Book book);

        // 게시글 전체 조회
        List<BookPlatform> findAll();
        List<BookPlatform> findAll2(Search search);

        // 게시글 상세 조회
        BookPlatform findOne(String bookNo);
        // BOOK 조회
        Book findBookOne(String bookNo);

        // 게시글 삭제
        boolean remove(String bookNo);

        // 게시글 수정
        boolean modify(Book book);

        // 전체 게시물 수 조회
        int getTotalCount();
        int getTotalCount2(Search search);



        // 즐겨찾기 등록
        boolean saveImportance(String bookNo);

        //즐겨찾기 삭제
        boolean removeImportance(String bookNo);

        //즐겨찾기기 수정
        boolean modifyImportance(String bookNo, int newImportance);

        // 즐겨찾기 전체 조회
        List<BookPlatform> findAllImportance();

        // 즐겨찾기 개별 조회
//        BookPlatform findOneImportance();

}
