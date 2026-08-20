package com.codegym.service;

import java.util.List;

import com.codegym.model.Product;

public interface ProductService {
    List<Product> findAll();

    void save(Product product);

    Product findByName(String name);

    void update(String name, Product product);

    void remove(String name);

    List<Product> search(String name);
}
