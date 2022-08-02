package com.project.mybooks.book.service;

import com.project.mybooks.book.domain.Book;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Arrays;


@SpringBootTest
class BookServiceTest {

    @Autowired
    BookService bookService;

    @Test
    @DisplayName("작성한 것들이 들어가야한다")
    void saveTest(){
        Book b = new Book();
        b.setBookTitle("테스트1");
        b.setWriter("savwt");
        b.setStarRate(4);
        b.setPlatformId(1);
        b.setFileName(Arrays.asList("dog.jsp", "cat.jsp", "test.jsp"));
        b.setBookComment("asdfawef");
        b.setBookImg("zzz");

        bookService.saveService(b);
    }
}