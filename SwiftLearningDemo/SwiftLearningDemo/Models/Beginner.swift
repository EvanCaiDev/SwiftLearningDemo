//
//  Beginner.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import Foundation

// MARK: - 初级部分
// 本文件用于展示 Swift 基础语法，包含：
// - 常量与变量
// - 数据类型
// - 控制流（if/for/while/switch）
// - 函数定义与调用
// - 可选类型与安全解包
// - 基本数组与字典操作
//
// 每个知识点均附用途说明、好处及与 Objective-C 对比，便于教学

struct Beginner {
    
    // MARK: - 变量和常量
    // 展示 Swift 的 var（可变变量）和 let（不可变常量），以及基本数据类型
    // 与 OC 对比：OC 使用 NSMutableArray 或 NSNumber 等，Swift 类型推断更简洁
    func variableExample() {
        var mutableInt = 10         // 可变变量 (Int)，类似 OC 的 int
        let constantDouble = 20.5   // 不可变常量 (Double)，类似 OC 的 const double
        mutableInt += 5
        let isPassing = true        // Bool 类型，类似 OC 的 BOOL
        let initial: Character = "S" // Character 类型，类似 OC 的 unichar
        print("mutableInt = \(mutableInt), constantDouble = \(constantDouble), isPassing = \(isPassing), initial = \(initial)")
        // 提示：尝试取消注释下面这行，会导致编译错误（常量不可修改）
        // constantDouble = 30.0 // 错误：类似 OC 的 const 变量不可改
    }
    
    // MARK: - 字符串操作
    // 展示字符串拼接和插值，Swift 的 \(var) 比 OC 的 stringWithFormat 更简洁
    func stringExample() {
        let name = "Swift"
        let greeting = "Hello, " + name + "!" // 字符串拼接，类似 OC 的 [NSString stringWithFormat:@"%@", name]
        let interpolation = "Learn \(name) in \(2025)!" // 字符串插值，OC 无直接等价
        print(greeting)
        print(interpolation)
    }
    
    // MARK: - 数组与字典
    // 展示数组和字典操作，包含条件语句（if 和 if let）
    // Swift 的 isEmpty 和 if let 提供安全访问，OC 需手动检查 nil 或 count
    func arrayDictionaryExample() {
        var fruits = ["Apple", "Banana", "Orange"] // 可变数组，类似 OC 的 NSMutableArray
        let prices = ["Apple": 3.0, "Banana": 2.0, "Orange": 1.5] // 不可变字典，类似 OC 的 NSDictionary
        
        fruits.append("Mango") // 添加元素
        
        // 检查数组是否为空，防止越界访问
        // Swift 的 if 条件不需要括号，isEmpty 比 count == 0 更高效
        // OC 等价：if (fruits.count > 0) { ... }
        if !fruits.isEmpty {
            // 安全访问第一个元素，字符串插值类似 OC 的 %@ 格式化
            print("第一个水果: \(fruits[0])") // 输出: 第一个水果: Apple
        } else {
            print("数组为空")
        }
        
        // 字典访问返回 Optional<Double>，需解包
        // if let 是 Swift 特有的可选绑定语法，检查并解包 prices["Banana"]
        // OC 等价：NSNumber *price = prices[@"Banana"]; if (price) { ... }
        // 注意：Swift 的 if let 不需要括号，编译器自动解析
        if let bananaPrice = prices["Banana"] {
            print("香蕉价格: $\(bananaPrice)") // 输出: 香蕉价格: $2.0
        } else {
            print("未找到香蕉价格")
        }
        
        // 补充：nil 合并操作符 ?? 提供默认值，简化可选值处理
        // OC 无直接等价，需用 if-else 或三元运算符
        let price = prices["Grape"] ?? 0.0
        print("葡萄价格（默认 0.0）: $\(price)") // 输出: 葡萄价格（默认 0.0）: $0.0
    }
    
    // MARK: - 集合
    // 展示 Set 的去重特性，类似 OC 的 NSSet
    func setExample() {
        var uniqueFruits: Set = ["Apple", "Banana", "Apple"] // Set 自动去重
        print("唯一水果: \(uniqueFruits)") // 输出: ["Apple", "Banana"]
        uniqueFruits.insert("Orange")
        print("添加 Orange 后: \(uniqueFruits)")
    }
    
    // MARK: - 条件语句
    // 展示 Swift 的 switch 语句，支持范围匹配，优于 OC 的 switch
    // 返回 String 类型，类似 OC 的 NSString * 返回
    func conditionalExample(score: Int) -> String {
        // switch 语句支持模式匹配（如范围 90...100），无需 break
        // OC 的 switch 需手动 break，且不支持范围匹配
        // 注意：Swift 的 switch 条件不需要括号
        switch score {
        case 90...100:
            return "优秀"
        case 60..<90:
            return "及格"
        default:
            return "不及格"
        }
    }
    
    // MARK: - 循环
    // 展示 for、while、repeat-while 循环，类似 OC 的 for 和 while
    func loopExample() {
        // for 循环，1...3 是闭区间，类似 OC 的 for (int i = 1; i <= 3; i++)
        for i in 1...3 {
            print("For 循环第 \(i) 次")
        }
        
        // while 循环，类似 OC 的 while (count <= 3)
        // 注意：Swift 的 while 条件不需要括号
        var count = 1
        while count <= 3 {
            print("While 循环第 \(count) 次")
            count += 1
        }
        
        // repeat-while 循环，类似 OC 的 do-while
        count = 1
        repeat {
            print("Repeat-while 循环第 \(count) 次")
            count += 1
        } while count <= 3
    }
    
    // MARK: - 函数与参数标签
    // 展示外部/内部参数名，增强调用可读性和内部逻辑清晰性
    // 与 OC 对比：类似 - (NSString *)methodWithName:(NSString *)name age:(NSInteger)age
    // 好处：外部名 (name) 让调用像句子，内部名 (externalName) 适合函数逻辑
    func functionExample(name externalName: String, age: Int) -> String {
        // 外部名 name 使调用清晰：functionExample(name: "Alice", age: 25)
        // 内部名 externalName 在函数体内更具体，避免与局部变量冲突
        // age 无需外部名，因其语义已足够清晰
        return "\(externalName) 今年 \(age) 岁" // 输出格式化字符串，类似 OC 的 [NSString stringWithFormat:]
    }
    
    // MARK: - 可选类型
    // 展示多种可选值处理方式（if let、guard let、??）
    // Swift 的 Optional 比 OC 的 nil 更安全，强制处理 nil 情况
    func optionalExample(input: String?) {
        // if let 解包：检查 input 是否为 nil，并绑定到 unwrapped
        // OC 等价：if (input != nil) { NSString *unwrapped = input; ... }
        // 注意：if let 不需要括号，Swift 自动解析绑定逻辑
        if let unwrapped = input {
            print("if let 解包: \(unwrapped)")
        } else {
            print("if let: 无值")
        }
        
        // guard let 解包：提前退出函数，减少嵌套
        // OC 无直接等价，需用 if-else 和 return
        // 注意：guard let 条件也不需要括号
        guard let unwrapped = input else {
            print("guard let: 无值")
            return
        }
        print("guard let 解包: \(unwrapped)")
        
        // nil 合并操作符 ??：提供默认值，简化 nil 处理
        // OC 等价：NSString *value = input ? input : @"默认值";
        let value = input ?? "默认值"
        print("Nil 合并: \(value)")
    }
}
