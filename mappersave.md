<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<!-- mapper태그는 sql을 매핑할때 사용하는 태그
     namespace속성에는 사용할 인터페이스의 풀 패키지경로 + 인터페이스이름
  -->
<mapper namespace="com.project.mybooks.book.repository.BookMapper">

    <!-- 게시글 등록 SQL 작성 :  id속성에는 추상메서드 이름  -->
    <insert id="save">
        INSERT INTO prj_book
        (
        book_no
        , platform_id, book_title, writer, star_rate, book_comment
        , cur_page, total_page, the_end, book_img
        )
        VALUES
        (
        TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_prj_book.nextval, 4, '0')
        , #{platformId}, #{bookTitle}, #{writer}, #{starRate}, #{bookComment}
        , #{curPage}, #{totalPage}, #{theEnd}, #{bookImg}
        )
    </insert>

    <!-- 게시글 정보 삭제 -->
    <delete id="remove">
        DELETE FROM prj_book
        WHERE book_no = #{bookNo}
    </delete>

    <!--  게시글 정보 수정  -->
    <update id="modify">
        UPDATE prj_book
        SET
        platform_id = #{platformId}
        , book_title = #{bookTitle}
        , writer = #{writer}
        , star_rate = #{starRate}
        , book_comment = #{bookComment}
        , cur_page = #{curPage}
        , total_page = #{totalPage}
        , the_end = #{theEnd}
        , book_img = #{bookImg}
        WHERE book_no = #{bookNo}
    </update>


    <resultMap id="bookMap" type="com.project.mybooks.book.domain.Book">
        <result property="userId" column="USER_ID"/>
        <result property="bookNo" column="BOOK_NO"/>
        <result property="platformId" column="PLATFORM_ID"/>
        <result property="bookTitle" column="BOOK_TITLE"/>
        <result property="starRate" column="STAR_RATE"/>
        <result property="bookComment" column="BOOK_COMMENT"/>
        <result property="curPage" column="CUR_PAGE"/>
        <result property="totalPage" column="TOTAL_PAGE"/>
        <result property="theEnd" column="THE_END"/>
        <result property="regDate" column="REG_DATE"/>
    </resultMap>

    <resultMap id="bookPlatMap" type="com.project.mybooks.book.domain.BookPlatform">
        <result property="userId" column="USER_ID"/>
        <result property="bookNo" column="BOOK_NO"/>
        <result property="platformId" column="PLATFORM_ID"/>
        <result property="platformName" column="PLATFORM_NAME"/>
        <result property="bookTitle" column="BOOK_TITLE"/>
        <result property="starRate" column="STAR_RATE"/>
        <result property="bookComment" column="BOOK_COMMENT"/>
        <result property="curPage" column="CUR_PAGE"/>
        <result property="totalPage" column="TOTAL_PAGE"/>
        <result property="theEnd" column="THE_END"/>
        <result property="regDate" column="REG_DATE"/>
        <result property="bookImg" column="book_img"/>
        <result property="platformLink" column="platform_link"/>
    </resultMap>

    <!--  전체 조회  -->

    <select id="findAll" resultMap="bookPlatMap">
        SELECT
        a.user_id, a.importance
        , a.book_no, a.platform_id, b.platform_name
        , a.book_title, a.writer, a.star_rate, a.book_comment
        , a.cur_page, a.total_page, a.the_end, a.reg_date, a.book_img, b.platform_link
        FROM prj_book a
        LEFT OUTER JOIN prj_platform b
        ON a.platform_id = b.platform_id
        ORDER BY a.book_no DESC
    </select>

    <select id="findAll2" resultMap="bookPlatMap">
        SELECT  *
        FROM (
            SELECT ROWNUM rn, v_board.*
            FROM (
                SELECT
                    a.user_id, a.importance
                    , a.book_no, a.platform_id, b.platform_name
                    , a.book_title, a.writer, a.star_rate, a.book_comment
                    , a.cur_page, a.total_page, a.the_end, a.reg_date, a.book_img, b.platform_link
                FROM prj_book a
                LEFT OUTER JOIN prj_platform b
                ON a.platform_id = b.platform_id
                WHERE 1=1
                <if test = "platformId != 0">AND a.platform_id = #{platformId} </if>
                <if test = "starRate != 0">AND a.star_Rate = #{starRate}</if>
                <if test = "bookTitle != null">AND a.book_title LIKE '%' || #{bookTitle} || '%'</if>
                <if test = "writer != null">AND a.writer LIKE '%' || #{writer} || '%'</if>
                ORDER BY a.book_no DESC
                ) v_board
            )
        WHERE rn BETWEEN (#{pageNum} - 1) * #{amount} + 1 AND (#{pageNum} * #{amount})
    </select>


    <select id="findOne" resultMap="bookPlatMap">
        SELECT
        a.user_id, a.importance
        , a.book_no, a.platform_id, b.platform_name
        , a.book_title, a.writer, a.star_rate, a.book_comment
        , a.cur_page, a.total_page, a.the_end, a.reg_date ,a.book_img, b.platform_link
        FROM prj_book a
        LEFT OUTER JOIN prj_platform b
        ON a.platform_id = b.platform_id
        WHERE a.book_no=#{bookNO}
    </select>

    <select id="getTotalCount" resultType="int">
        SELECT count(*)
        FROM prj_book
    </select>

    <select id="getTotalCount2" resultType="int">
        SELECT count(*)
        FROM (
            SELECT
                    *
            FROM prj_book
            WHERE 1=1
            <if test = "platformId != 0">AND platform_id = #{platformId} </if>
            <if test = "starRate != 0">AND star_Rate = #{starRate}</if>
            <if test = "bookTitle != null">AND book_title LIKE '%' || #{bookTitle} || '%'</if>
            <if test = "writer != null">AND writer LIKE '%' || #{writer} || '%'</if>
            )
    </select>

    <!--    BOOK findOne-->
    <select id="findBookOne" resultMap="bookMap">
        SELECT * FROM prj_book
        WHERE BOOK_NO = #{bookNo}
    </select>

    <!--  importance 필드 조작 sql  -->
    <!-- 등록  -->
    <update id="saveImportance">
        update prj_book
        set importance=(select max(importance)+1
                        from prj_book
                        )
        WHERE book_no = #{bookNo}
    </update>

    <!--  삭제  -->
    <update id="removeImportance">
        update prj_book
        set importance=0
        WHERE book_no = #{bookNo}
    </update>

    <!--  수정  -->
    <update id="modifyImportance">
        update prj_book
        set importance=#{newImportance}
        WHERE book_no = #{bookNo}
    </update>

    <!-- 전체 조회   -->
    <select id="findAllImportance" resultMap="bookPlatMap">
        SELECT
            a.user_id, a.importance
            , a.book_no, a.platform_id, b.platform_name
            , a.book_title, a.writer, a.star_rate, a.book_comment
            , a.cur_page, a.total_page, a.the_end, a.reg_date, a.book_img, b.platform_link
        FROM (
            SELECT
            *
            FROM prj_book
            WHERE importance>0
            ) a
        LEFT OUTER JOIN prj_platform b
        ON a.platform_id = b.platform_id
        ORDER BY a.importance DESC
    </select>

    <insert id="addFileUpload">
        INSERT INTO prj_file_upload
        (file_name, bno)
        VALUES
        (#{fileName}, TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(seq_prj_book.currval, 4, '0'))
    </insert>

</mapper>