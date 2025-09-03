//
//  Intermediate.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import Foundation

struct Intermediate {
    
    // MARK: - 可选链
    func optionalChainingExample() {
        class Pet { var name = "Tommy" }
        class Person { var pet: Pet? } // Pet 是可选类型
        let person = Person()
        print(person.pet?.name ?? "No pet")
        // person.pet? 表示可选链，如果 pet 不为 nil 才访问 name
        // ?? "No pet" 表示默认值
    }
    
    // MARK: - 闭包（Closure）
    func closureExample() {
        let numbers = [1, 2, 3, 4, 5]
        
        // map 是高阶函数，对数组每个元素做转换
        let squared = numbers.map { $0 * $0 } // $0 表示闭包第一个参数
        print("平方数组: \(squared)")
        
        // 尾随闭包语法：如果闭包是最后一个参数，可以写在括号外
        func operate(numbers: [Int], action: (Int) -> Int) -> [Int] {
            return numbers.map(action)
        }
        let doubled = operate(numbers: numbers) { $0 * 2 } // 尾随闭包
        print("翻倍数组: \(doubled)")
    }
    
    // MARK: - 枚举（Enum） + 关联值
    enum NetworkResult {
        case success(data: String) // 成功时附带数据
        case failure(error: Error) // 失败时附带错误对象
    }
    
    func enumExample(result: NetworkResult) {
        switch result {
        case .success(let data):   // case 解包关联值
            print("Data: \(data)")
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - 高阶函数 filter / reduce / flatMap
    func higherOrderFunctionExample() {
        let numbers = [1, 2, 3, 4, 5]
        
        let even = numbers.filter { $0 % 2 == 0 }
        // filter: 过滤数组，闭包返回 true 保留
        print("偶数: \(even)")
        
        let sum = numbers.reduce(0, +)
        // reduce: 从初始值 0 开始，对数组累加
        print("求和: \(sum)")
        
        let nested = [[1, 2], [3, 4]]
        let flat = nested.flatMap { $0 }
        // flatMap: 展平嵌套数组
        print("展平数组: \(flat)")
    }
    
    // MARK: - 捕获值闭包
    func capturedClosureExample() {
        func makeCounter() -> () -> Int {
            var count = 0
            return {
                count += 1
                return count
            }
            // 闭包捕获 count 变量，每次调用都会记住上一次的值
        }
        let counter = makeCounter()
        print(counter()) // 1
        print(counter()) // 2
    }
    
    // MARK: - defer
    func deferExample() {
        defer { print("最后执行") } // defer 延迟执行，函数结束前执行
        print("中间执行")
    }
}

