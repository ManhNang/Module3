package com.codegym.service;

import com.codegym.model.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceImpl implements ProductService {
    private static Map<String, Product> products = new HashMap<>();

    static {
        products.put("Keyboard", new Product(1, "Keyboard", 200000, "Bàn phím máy tính", "Logitech"));
        products.put("Mouse", new Product(2, "Mouse", 150000, "Chuột máy tính", "Logitech"));
        products.put("CPU", new Product(3, "CPU", 4500000, "Bộ xử lý trung tâm máy tính", "Intel"));
        products.put("Mainboard", new Product(4, "Mainboard", 2100000, "Bo mạch chủ máy tính", "MSI"));
        products.put("Headphone", new Product(5, "Headphone", 350000, "Tai nghe máy tính", "Dareu"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getName(), product);
    }

    @Override
    public Product findByName(String name) {
        return products.get(name);
    }

    @Override
    public void update(String name, Product product) {
        products.put(name, product);
    }

    @Override
    public void remove(String name) {
        products.remove(name);

    }

    @Override
    public List<Product> search(String name) {
        name = name.toLowerCase().trim();
        List<Product> searchs = new ArrayList<>();
        for (String product : products.keySet()) {
            if (product.toLowerCase().trim().startsWith(name)) {
                searchs.add(products.get(product));
            }
        }
        return searchs;
    }
}
