//
//  Intermediate.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import Foundation

// MARK: - 中级部分
// 本文件用于展示 Swift 中级/进阶特性，包含：
// - 闭包（Closure）
// - 高阶函数（map/filter/reduce/flatMap）
// - 协议导向编程（POP）
// - 错误处理（Error Handling）
// - 属性（计算属性、存储属性、lazy、观察器）
// - 内存管理（值类型 vs 引用类型、weak/unowned）
// - 可选链（Optional Chaining）
// - 枚举（Enum）及关联值
// - defer 延迟执行
//
// 每个知识点均附用途说明、好处及与 Objective-C 对比，便于教学

// 文件作用域定义协议，确保在整个文件中可见
// 好处：协议可在多个类型间复用，类似 OC 的 @protocol
// 与 OC 对比：OC 的协议也需在文件作用域，但无默认实现
protocol Describable {
    func describe() -> String
}

// 协议继承，扩展 Describable 功能
// 好处：支持多级抽象，增强类型系统
// 与 OC 对比：OC 的协议继承类似，但无此灵活性
protocol Named: Describable {
    var name: String { get }
}

// 扩展 Int 类型，添加 Describable 协议实现
// 好处：为已有类型添加功能，无需修改原始定义
// 与 OC 对比：OC 用 Category 实现类似功能，但无协议扩展
extension Int: Describable {
    func describe() -> String { return "Number: \(self)" }
}

// 协议扩展：提供默认实现
// 好处：减少重复代码，类似 OC 的 Category 默认方法
// 注意：默认实现仅在未重写时生效
extension Describable {
    func describe() -> String { return "Default description" }
}

struct Intermediate {
    
    // MARK: - 可选链
    // 展示可选链（Optional Chaining）用于安全访问嵌套属性或方法
    // 好处：避免手动检查 nil，简化代码，类似 OC 的 if (obj != nil) 检查
    // 与 OC 对比：OC 需手动检查每一层 nil，Swift 的 ?. 更简洁安全
    func optionalChainingExample() {
        class Pet { var name = "Tommy" }
        class Person { var pet: Pet? } // pet 是可选类型，可能为 nil
        let person = Person()
        
        // 可选链：person.pet?.name 如果 pet 为 nil，返回 nil，不会崩溃
        // ?? 提供默认值，类似 OC 的三元运算符 (person.pet ? person.pet.name : @"No pet")
        // 输出示例：No pet（因 person.pet 未赋值）
        print("宠物名字: \(person.pet?.name ?? "No pet")")
        
        // 示例：设置 pet，展示非 nil 情况
        person.pet = Pet()
        print("宠物名字（设置后）: \(person.pet?.name ?? "No pet")") // 输出: Tommy
    }
    
    // MARK: - 闭包（Closure）定义与使用
    // 展示闭包作为匿名函数，支持尾随闭包、参数简写、函数作为一等公民
    // 好处：灵活传递逻辑，简化高阶函数调用，增强代码复用
    // 与 OC 对比：类似 OC 的 Block，但 Swift 闭包更简洁，支持 $0 简写
    func closureExample() {
        let numbers = [1, 2, 3, 4, 5]
        
        // 基本闭包定义
        // 闭包语法: { (参数) -> 返回类型 in 语句 }
        // 类似 OC 的 ^int(int num) { return num * num; }
        let squareClosure: (Int) -> Int = { (num: Int) -> Int in
            return num * num
        }
        print("闭包平方结果: \(squareClosure(3))") // 输出: 9
        
        // 尾随闭包
        // 当闭包是最后一个参数时，可省略括号，写为 { ... }
        // $0 表示第一个参数，省略参数名，类似 OC Block 的 ^(int num) { ... }
        let squared = numbers.map { $0 * $0 }
        print("平方数组: \(squared)") // 输出: [1, 4, 9, 16, 25]
        
        // 函数作为一等公民
        // 函数可作为参数传递，类似 OC 的 Block 参数
        func operate(numbers: [Int], action: (Int) -> Int) -> [Int] {
            return numbers.map(action)
        }
        let doubled = operate(numbers: numbers) { $0 * 2 } // 尾随闭包
        print("翻倍数组: \(doubled)") // 输出: [2, 4, 6, 8, 10]
    }
    
    // MARK: - 枚举（Enum） + 关联值
    // 展示枚举支持关联值，结合 switch 进行模式匹配
    // 好处：枚举增强类型安全，关联值携带额外信息
    // 与 OC 对比：OC 的 enum 只支持整数，Swift 枚举更强大
    enum NetworkResult {
        case success(data: String)
        case failure(error: Error)
    }
    
    func enumExample(result: NetworkResult) {
        // switch 匹配枚举，解包关联值
        // Swift 的 switch 无需 break，支持复杂模式匹配
        // OC 等价：if-else 或 switch，但无法携带关联值
        switch result {
        case .success(let data):
            print("数据: \(data)") // 输出: 数据: <传入的字符串>
        case .failure(let error):
            print("错误: \(error.localizedDescription)")
        }
    }
    
    // MARK: - 高阶函数 filter / reduce / flatMap
    // 展示 Swift 的高阶函数，操作数组，简化数据处理
    // 好处：函数式编程风格，代码简洁，逻辑清晰
    // 与 OC 对比：OC 需用 for 循环或 NSPredicate，代码更冗长
    func higherOrderFunctionExample() {
        let numbers = [1, 2, 3, 4, 5]
        
        // filter：过滤满足条件的元素，闭包返回 true 则保留
        // 类似 OC 的 [array filteredArrayUsingPredicate:...]
        let even = numbers.filter { $0 % 2 == 0 }
        print("偶数: \(even)") // 输出: [2, 4]
        
        // reduce：从初始值开始聚合，+ 是简写闭包
        // 类似 OC 的 for 循环累加
        let sum = numbers.reduce(0, +)
        print("求和: \(sum)") // 输出: 15
        
        // flatMap：展平嵌套数组并映射
        // OC 无直接等价，需手动循环处理
        let nested = [[1, 2], [3, 4]]
        let flat = nested.flatMap { $0 }
        print("展平数组: \(flat)") // 输出: [1, 2, 3, 4]
    }
    
    // MARK: - 捕获值闭包 (Closure Capturing Values)
    // 展示闭包捕获外部变量，维持状态
    // 好处：实现私有状态，适合计数器、状态机等场景
    // 与 OC 对比：类似 OC 的 __block 变量，但 Swift 更简洁
    func capturedClosureExample() {
        // 函数返回闭包，闭包捕获 count 变量
        func makeCounter() -> () -> Int {
            var count = 0 // 被闭包捕获，维持状态
            return {
                count += 1 // 每次调用修改捕获的 count
                return count
            }
        }
        let counter = makeCounter()
        print("计数器: \(counter())") // 输出: 1
        print("计数器: \(counter())") // 输出: 2
        print("计数器: \(counter())") // 输出: 3
    }
    
    // MARK: - defer 延迟执行
    // 展示 defer 用于延迟执行，确保资源清理
    // 好处：保证代码执行，无论函数如何退出（return/抛错）
    // 与 OC 对比：OC 需手动在每个出口清理，易遗漏
    func deferExample() {
        print("函数开始执行")
        defer { print("defer 块，函数结束前执行") } // 延迟执行
        print("函数中间执行")
        if true {
            print("早期退出")
            return // defer 仍会执行
        }
        print("函数即将结束")
    }
    
    // MARK: - 结构体与类
    // 展示结构体（值类型）与类（引用类型）的区别
    // 好处：值类型提供安全性和可预测性，类适合共享状态
    // 与 OC 对比：OC 只有类（引用类型），Swift 结构体更灵活
    func structVsClassExample() {
        struct Point {
            var x: Int
            var y: Int
            mutating func moveBy(x: Int) { self.x += x }
        }
        
        class Person {
            var name: String
            init(name: String) { self.name = name }
        }
        
        var point1 = Point(x: 1, y: 2)
        var point2 = point1 // 复制，独立副本
        point2.x = 3
        print("point1: \(point1.x), point2: \(point2.x)") // 输出: point1: 1, point2: 3
        
        let person1 = Person(name: "Alice")
        let person2 = person1 // 引用，共享同一实例
        person2.name = "Bob"
        print("person1: \(person1.name), person2: \(person2.name)") // 输出: person1: Bob, person2: Bob
        
        point1.moveBy(x: 5)
        print("point1 moved: \(point1.x)") // 输出: 6
    }
    
    // MARK: - 协议与扩展
    // 展示协议定义、继承、扩展，以及扩展添加功能
    // 好处：协议提供抽象，扩展增强复用性和解耦
    // 与 OC 对比：类似 OC 的 @protocol，但 Swift 扩展更强大
    func protocolAndExtensionExample() {
        // 实现协议的结构体
        struct Animal: Named {
            var name: String
            func describe() -> String { return "Animal: \(name)" }
        }
        
        // 示例
        let dog = Animal(name: "Max")
        print(dog.describe()) // 输出: Animal: Max
        print(3.describe()) // 输出: Number: 3
        
        // 使用协议扩展的默认实现
        // 好处：协议扩展提供默认行为，减少重复代码
        struct DefaultDescribable: Describable {}
        let defaultDesc = DefaultDescribable()
        print(defaultDesc.describe()) // 输出: Default description
    }
}

