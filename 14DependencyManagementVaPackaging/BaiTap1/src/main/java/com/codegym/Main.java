package com.codegym;

import java.security.NoSuchAlgorithmException;

public class Main {
    public static void main(String[] args) {
        System.out.println("Kết quả gọi từ thư viện đóng gói (.jar):");
        QuadraticSolver.findRoots(5, 7, 8);
    }
}