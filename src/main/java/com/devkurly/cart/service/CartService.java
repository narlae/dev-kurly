package com.devkurly.cart.service;

import com.devkurly.cart.domain.Cart;
import com.devkurly.cart.dto.CartResponseDto;
import com.devkurly.cart.dto.CartSaveRequestDto;
import com.devkurly.cart.dto.CartUpdateRequestDto;
import com.devkurly.mapper.CartMapper;
import com.devkurly.product.dto.ProductDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CartService {
    private final CartMapper cartMapper;

    public List<Cart> cartList(Integer user_id) {
        return cartMapper.findAllById(user_id);
    }

    public List<CartResponseDto> viewCartProduct(Integer user_id) {
        return cartMapper.joinCartProduct(user_id);
    }
    public Integer addCart(CartSaveRequestDto requestDto) {

        // pdt_id == null
        return cartMapper.insert(requestDto.toEntity());
        // pdt_id != null
        // return cartMapper.update(requestDto.toEntity());
    }

    public Integer modifyAddCart(Integer user_id, Integer pdt_id) {
        return cartMapper.updateAdd(user_id, pdt_id);
    }
    public Integer modifyRemoveCart(Integer user_id, Integer pdt_id) {
        return cartMapper.updateRemove(user_id, pdt_id);
    }

    public Integer removeCart(Integer user_id) {
        return cartMapper.delete(user_id);
    }

    public Integer removeOneCart(Integer user_id, Integer pdt_id) {
        return cartMapper.deleteOne(user_id, pdt_id);
    }
}