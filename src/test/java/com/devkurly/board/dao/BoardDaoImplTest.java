package com.devkurly.board.dao;

import com.devkurly.board.domain.BoardDto;
import com.devkurly.board.domain.CommentDto;
import com.devkurly.board.service.BoardService;
import com.devkurly.product.dao.ProductDao;
import com.devkurly.product.domain.ProductDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BoardDaoImplTest {
    @Autowired
    BoardDao boardDao;
    @Autowired
    BoardService boardService;
    @Autowired
    ProductDao productDao;

    public static int rand(int min, int max)
    {
        if (min > max || (max - min + 1 > Integer.MAX_VALUE)) {
            throw new IllegalArgumentException("Invalid range");
        }
        return new Random().nextInt(max - min + 1) + min;
    }

    @Test
    public void insert() throws Exception {
        boardService.deleteAll();
        assertTrue(boardDao.boardAllCnt()==0);

        int insertBoardCnt = 22; // 작성할 글의 갯수
        Integer pdt_id = 120; // 작성할 게시판의 상품 ID
        String bbs_clsf_cd = "1"; // 리뷰글
        Integer user_id = 1;

        for (int i = 1; i < insertBoardCnt+1; i++) {
            BoardDto boardDto = new BoardDto(pdt_id, user_id, i+"번째 리뷰글입니다.", i+"번째 리뷰글의 내용입니다.", 0, 0, "image",false, false, "youngjun", bbs_clsf_cd, "1", "1", '0');
            boardDao.insert(boardDto); //BOARD_TB 생성
            Integer bbs_id = boardDao.selectAll().get(0).getBbs_id();
            boardDto.setBbs_id(bbs_id);
            assertTrue(boardDao.insertCn(boardDto)==1); //생성되는 BOARD_TB과 같은 bbs_id를 가지는 BOARD_CN_TB 생성
            boardDao.insertReview(bbs_id, user_id); //생성되는 BOARD_TB과 같은 bbs_id를 가지는 REVIEW_BOARD_TB 생성
        }
        assertTrue(boardDao.boardAllCnt()==insertBoardCnt);
    }

    @Test
    public void delete() throws Exception{
        boardDao.deleteAll();
        assertTrue(boardDao.boardAllCnt()==0);



    }
    @Transactional
    @Test
    public void selectCn() throws Exception {
        Map map = new HashMap();
        Integer pdt_id = rand(1, 30);
        map.put("bbs_clsf_cd", "1");
        map.put("offset", 0);
        map.put("pageSize", 10);
        map.put("pdt_id", pdt_id);

        boardService.isValidPdt(pdt_id);

    }

    @Test
    public void count() throws Exception{
        String bbs_clsf_cd = "1";
        Integer pdt_id = 1;
        Map map = new HashMap<>();
        map.put("bbs_clsf_cd", bbs_clsf_cd);
        map.put("pdt_id", pdt_id);
        int Cnt = boardDao.count(map);
        System.out.println(Cnt);

    }
    @Test
    public void selectReviewPage() throws Exception {
        Integer page = 1;
        Integer pageSize = 10;
        Integer pdt_id = 1;
        Map map = new HashMap();
        map.put("offset", (page - 1) * pageSize);
        map.put("pageSize", pageSize);
        map.put("pdt_id", pdt_id);


        List list = boardDao.selectReviewPage(map);
        System.out.println("list = " + list);

    }




    @Test
    public void select() throws Exception{
         CommentDto commentDto= boardDao.selectAnswer(3682);
        System.out.println("commentDto = " + commentDto);
    }

    @Test
    public void selectPage() {

    }



    @Test
    public void update() throws Exception{
//        boardDao.deleteAll();
//        BoardDto boardDto = new BoardDto(1,1,"asdf","youngjun","1","1","1");
//        assertTrue(boardDao.insert(boardDto)==1);
//
//        Integer bbs_id = boardDao.selectAll().get(0).getBbs_id();
//        System.out.println("boardDao.selectAll() = " + boardDao.selectAll());
//
//        boardDto.setBbs_id(bbs_id);
//        boardDto.setBbs_title("title2");
//
//        System.out.println("boardDto.getBbs_id() = " + boardDto.getBbs_id());
//        System.out.println("boardDto.getBbs_title() = " + boardDto.getBbs_title());
//
//        assertTrue(boardDao.update(boardDto)==1);


    }

    @Test
    public void increaseLike() {
    }
}