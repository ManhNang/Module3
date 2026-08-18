package com.codegym;

public class Calculator {
    public static double calculate(double firstOperand, double secondOperand, String operator) throws ArithmeticException, IllegalArgumentException {
        switch (operator) {
            case "+":
                return firstOperand + secondOperand;
            case "-":
                return firstOperand - secondOperand;
            case "*":
                return firstOperand * secondOperand;
            case "/":
                if (secondOperand == 0) {
                    throw new ArithmeticException("Không thể chia cho 0 (Division by zero)!");
                }
                return firstOperand / secondOperand;
            default:
                throw new IllegalArgumentException("Toán tử không hợp lệ: " + operator);
        }
    }
}
