//
//  Beginner.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import Foundation

struct Beginner {
    
    // MARK: - 变量和常量
    func variableExample() {
        var mutable = 10    // var 表示可变变量
        let constant = 20   // let 表示不可变常量
        mutable += 5        // 变量可以修改
        print("mutable = \(mutable), constant = \(constant)")
    }
    
    // MARK: - 数组与字典
    func arrayDictionaryExample() {
        let fruits = ["Apple", "Banana", "Orange"] // 数组，顺序存储
        let prices = ["Apple": 3, "Banana": 2]    // 字典，键值对存储
        print(fruits[0]) // 访问数组第一个元素
        print(prices["Banana"] ?? 0) // 可选值解包，若没有默认 0
    }
    
    // MARK: - 条件语句
    func conditionalExample(_ score: Int) {
        if score >= 60 {
            print("及格")
        } else {
            print("不及格")
        }
    }
    
    // MARK: - 循环
    func loopExample() {
        for i in 1...3 {   // 1...3 表示闭区间，从1到3
            print("循环第 \(i) 次")
        }
    }
    
    // MARK: - 可选类型
    func optionalExample() {
        let text: String? = "Swift" // ? 表示可选类型，可能为 nil
        if let unwrapped = text {   // 安全解包，如果有值则进入 if 块
            print("Value: \(unwrapped)")
        } else {
            print("No value")
        }
    }
}

