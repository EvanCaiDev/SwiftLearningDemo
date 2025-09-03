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
        class Person { var pet: Pet? } // pet 是可选类型
        let person = Person()
        // person.pet? 表示如果 pet 不为 nil 才访问 name
        // ?? "No pet" 表示默认值
        print(person.pet?.name ?? "No pet")
    }
    
    // MARK: - 闭包（Closure）定义与使用
    func closureExample() {
        let numbers = [1, 2, 3, 4, 5]
        
        // 1️⃣ 基本闭包定义
        // 闭包语法: { (参数列表) -> 返回类型 in 闭包体 }
        let squareClosure: (Int) -> Int = { (num: Int) -> Int in
            return num * num
        }
        print("闭包平方结果: \(squareClosure(3))") // 9
        
        // 2️⃣ 作为 map 参数的尾随闭包
        // 如果闭包是函数最后一个参数，可以省略括号直接写在 {} 里
        let squared = numbers.map { $0 * $0 }
        // $0 表示闭包第一个参数，等价于 { num in num * num }
        print("平方数组: \(squared)")
        
        // 3️⃣ 尾随闭包完整示例
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
        case .success(let data):   // 解包关联值
            print("Data: \(data)")
        case .failure(let error):
            print("Error: \(error.localizedDescription)")
        }
    }
    
    // MARK: - 高阶函数 filter / reduce / flatMap
    func higherOrderFunctionExample() {
        let numbers = [1, 2, 3, 4, 5]
        
        let even = numbers.filter { $0 % 2 == 0 }
        // filter: 过滤数组，闭包返回 true 的元素保留
        print("偶数: \(even)")
        
        let sum = numbers.reduce(0, +)
        // reduce: 从初始值 0 开始累加数组元素
        print("求和: \(sum)")
        
        let nested = [[1, 2], [3, 4]]
        let flat = nested.flatMap { $0 }
        // flatMap: 将嵌套数组展平并映射
        print("展平数组: \(flat)")
    }
    
    // MARK: - 捕获值闭包 (Closure Capturing Values)
    func capturedClosureExample() {
        // 闭包可以捕获函数作用域中的变量
        func makeCounter() -> () -> Int {
            var count = 0 // 这个变量会被闭包捕获
            return {
                count += 1
                return count
            }
        }
        let counter = makeCounter()
        print(counter()) // 输出 1
        print(counter()) // 输出 2
        print(counter()) // 输出 3
        /*
         说明：
         - count 是被捕获的变量
         - 每次调用闭包，count 会记住上一次的值
         - 相当于闭包形成了一个“私有状态”
        */
    }
    
    // MARK: - defer 延迟执行
    func deferExample() {
        print("函数开始执行")
        defer { print("defer 块，函数结束前执行") }
        print("函数中间执行")
        // 函数执行完毕前，defer 中的代码才会执行
        print("函数即将结束")
    }
    /*
     defer 使用场景：
     - 资源释放，如关闭文件、释放锁
     - 不论函数执行路径如何（中途 return 或抛错），defer 都会执行
     - 可以写多个 defer，按后进先出 (LIFO) 顺序执行
    */
}
