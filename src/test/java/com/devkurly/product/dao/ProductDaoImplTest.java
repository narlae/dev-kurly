package com.devkurly.product.dao;


import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.domain.SearchCondition;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.junit.Test;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertTrue;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ProductDaoImplTest {
    @Autowired

    ProductDao productDao;


    @Transactional
    @Test
    public void selectProductId() throws Exception {
        System.out.println(productDao.selectProductId());


    }
}
