package com.project.mybooks.book.repository;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.common.paging.Page;
import com.project.mybooks.common.search.Search;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Rollback;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class BookMapperTest {

    @Autowired
    BookMapper mapper;
    
    @Test
    @DisplayName("테스트가 실행돼야 한다")
    void test(){
        System.out.println("!! test !!");
    }

     @Test
    @DisplayName("Book이 DB에 등록돼야 한다")
    void saveTest(){
        System.out.println("startstart");
        Book b = new Book();
        System.out.println("b = " + b);
        b.setPlatformId(1);
        b.setBookTitle("test title1");
        b.setWriter("test writer1");
        b.setStarRate(3);
        b.setBookComment("test comment1");
        b.setCurPage(10);
        b.setTotalPage(100);
        b.setTheEnd(0);
        System.out.println("b = " + b);

//        boolean flag = mapper.save(b);

//        assertTrue(flag);
    }

    @Test
    @DisplayName("DB에서 정보가 삭제돼야 한다")
    void removeTest(){
        String bookNo = "2207220025";
        boolean flag = mapper.remove(bookNo);
        assertTrue(flag);
    }

    @Test
    @DisplayName("DB에서 정보가 수정돼야 한다")
    void modifyTest(){
        Book b = mapper.findBookOne("2207220002");
        b.setBookTitle("test");

        boolean flag = mapper.modify(b);
        assertTrue(flag);
    }

    @Test
    @DisplayName("DB에서 prj_book과 prj_platform가 조인돼서 전체 조회돼야 한다")
    void findAllTest(){
        List<BookPlatform> all = mapper.findAll();
        for (BookPlatform b : all) {
            System.out.println(b);
        }
    }

    @Test
    @DisplayName("DB에서 특정 정보가 조회돼야 한다")
    void findOneTest(){
        String bn = "2207220027";
        BookPlatform one = mapper.findOne(bn);
        System.out.println(one);
    }

    @Test
    @DisplayName("prj_book 테이블의 데이터 수 리턴")
    void getTotalCount(){
        int totalCount = mapper.getTotalCount();
        assertEquals(3, totalCount);
    }

    @Test
    @DisplayName("FindBookOne이 실행되어야한다")
    void findOneBook(){
        Book bookOne = mapper.findBookOne("2207220001");

        System.out.println(bookOne);
    }

    @Test
    @DisplayName("즐겨찾기 등록: importance가 max+1로 수정돼야 한다")
    void saveImportanceTest(){
        String bn = "2207250002";
        boolean flag = mapper.saveImportance(bn);
        assertTrue(flag);
    }

    @Test
    @DisplayName("즐겨찾기 삭제: importance가 0으로로 수정돼야 한다")
    void removeImportanceTest(){
        String bn = "2207240021";
        boolean flag = mapper.removeImportance(bn);
        assertTrue(flag);
    }

    @Test
    @DisplayName("즐겨찾기 수정: importance가 원하는 숫자로 수정돼야 한다")
    void modifyImportanceTest(){
        String bn = "2207240021";
        boolean flag = mapper.modifyImportance(bn, 2);
        assertTrue(flag);
    }

    @Test
    @DisplayName("즐겨찾기 전체 조회: importance가 0보다 큰 모든 데이터가 조회된다")
    void findAllImportance(){
        List<BookPlatform> allImportance = mapper.findAllImportance();
        for (BookPlatform b : allImportance) {
            System.out.println(b);
        }

    }

/*    @Test
    @DisplayName("페이징과 서치를 추가한 findAll2")
    void findAll2Test(){
        Search search = new Search(2, 2, "platformId", "1");
        List<BookPlatform> all2 = mapper.findAll2(search);
        for (BookPlatform a : all2) {
            System.out.println(a);
        }
    }*/

/*    @Test
    @DisplayName("서치를 매개변수로 준 getTotalCount2")
    void getTotalCount2Test(){
        Search search = new Search(1, 10, "platformId", "1");
        int t = mapper.getTotalCount2(search);
        System.out.println("t = " + t);
        assertEquals(5, t);
    }*/
}