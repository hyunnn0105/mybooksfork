package com.project.mybooks.book.service;

import com.project.mybooks.book.domain.Book;
import com.project.mybooks.book.domain.BookPlatform;
import com.project.mybooks.book.repository.BookMapper;
import com.project.mybooks.bookMemo.repository.BookMemoMapper;
import com.project.mybooks.bookmark.repository.BookmarkMapper;
import com.project.mybooks.common.search.Search;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Log4j2
@RequiredArgsConstructor
public class BookService {

    private final BookMapper bMapper;
    private final BookmarkMapper bmkMapper;
    private final BookMemoMapper bmmMapper;

    @Transactional
    public boolean saveService(Book book) {
        log.info(" /bookService Book - {}", book);
        boolean flag = bMapper.save(book);

        // 이미지 파일 저장
        List<String> fileName = book.getFileName();
        if (fileName != null && fileName.size() != 0){
            for (String filenames : fileName){
                bMapper.addFileUpload(filenames);
            }
        }

        return flag;
    }

    public boolean modifyService(Book book) {
        return bMapper.modify(book);
    }

    public boolean removeService(String bookNo) {
        return bMapper.remove(bookNo);
    }

    public List<BookPlatform> findAllService() {
        return bMapper.findAll();
    }

    public List<BookPlatform> findAll2service(Search search) {
        return bMapper.findAll2(search);
    }

    public BookPlatform findOneService(String bookNo) {
        return bMapper.findOne(bookNo);
    }

    public Book findBookOne(String bookNo){
        return bMapper.findBookOne(bookNo);
    }

    public int getTotalService() {
        return bMapper.getTotalCount();
    }
    public int getTotal2Service(Search search) {return bMapper.getTotalCount2(search);}

    public List<BookPlatform> findAllImportanceService() {
        return bMapper.findAllImportance();
    }

    public boolean importanceSaveService(String bookNo){
        return bMapper.saveImportance(bookNo);
    }
    public boolean importanceRemoveService(String bookNo){
        return bMapper.removeImportance(bookNo);
    }
}
