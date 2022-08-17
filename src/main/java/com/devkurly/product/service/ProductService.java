package com.devkurly.product.service;

import com.devkurly.board.domain.BoardDto;
import com.devkurly.product.domain.ProductDto;

import java.util.List;
import java.util.Map;

public interface ProductService {

    // C
    int write(ProductDto productDto) throws Exception;



    // R
    int getCount() throws Exception;



    ProductDto read(Integer pdt_id) throws Exception;

    List<ProductDto> ProductList(Map map) throws Exception;

    List<ProductDto> ProductThriftyList(Map map) throws Exception;

    List<ProductDto> ProductBestList(Map map) throws Exception;

    List<ProductDto> ProductNewList(Map map) throws Exception;


    // U
    int modify(ProductDto productDto) throws Exception;


    // D
    int remove(Integer pdt_id) throws Exception;


    List<ProductDto> ProductListDESC(Map map);

}



















