//
//  Advanced.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import Foundation

// MARK: - 高级部分（进阶与底层）
// 本文件用于展示 Swift 高级特性，包含泛型、协议导向编程、错误处理、属性、内存管理、访问控制、并发、函数派发等
// 每个知识点均有用途说明、好处及与 Objective-C 对比，便于教学

// MARK: - 1. 协议与泛型

// Drawable 协议示例
protocol Drawable {
    func draw()
}

// Circle/ Square 遵守 Drawable 协议
struct Circle: Drawable {
    func draw() { print("绘制圆形") } // 输出: 绘制圆形
}

struct Square: Drawable {
    func draw() { print("绘制正方形") } // 输出: 绘制正方形
}

// Container 协议示例
protocol Container {
    // associatedtype: 定义协议中的占位类型
    // 用途: 提高协议的通用性，适配不同数据类型
    // 好处: 支持泛型协议设计
    // 与 OC 对比: OC 协议无法使用关联类型，需手动指定类型
    associatedtype Item
    
    // mutating: 允许修改协议实现者的实例状态（通常用于结构体或枚举）
    // 好处：支持值类型的可变性，避免不必要的复制
    // 与 OC 对比：OC 中方法默认可变，无需显式声明
    mutating func append(_ item: Item)
    
    // var: 定义属性，{ get } 表示只读访问
    // 好处：提供协议的公共接口，约束实现者的行为
    // 与 OC 对比：OC 用 @property 定义属性，需显式声明 getter
    var count: Int { get }
    
    // subscript: 定义下标访问方式，{ get } 表示只读下标
    // 好处：提供数组或字典-like 的访问语法，增强可读性
    // 与 OC 对比：OC 无原生下标支持，需用方法如 objectAtIndex:
    subscript(i: Int) -> Item { get }
}

// 泛型结构体 GenericArray
// 用途：作为 Container 协议的具体实现，封装了一个泛型数组
// 好处：演示如何用泛型和协议结合，实现高度复用的数据结构
// 与 OC 对比：OC 中通常使用 NSMutableArray，但缺乏类型安全，Swift 泛型保证数组类型一致
struct GenericArray<T>: Container {
    private var items: [T] = []
    
    // mutating func append:
    // mutating: 标记此方法会修改结构体自身（值类型默认方法不可修改自身，需要显式声明）
    // 用途：向数组追加一个新元素
    // 好处：支持值类型修改，保证泛型一致性
    // 与 OC 对比：NSMutableArray 的 addObject: 没有类型检查，且 OC 中类是引用类型，方法默认可修改属性，无需 mutating
    mutating func append(_ item: T) {
        items.append(item)
    }
    
    // var count: Int
    // 返回当前数组中元素的数量
    // 好处：提供统一的访问接口
    // 与 OC 对比：NSArray 的 count 属性，语义一致
    var count: Int { items.count }
    
    // subscript: 下标访问
    // 通过索引访问元素，语法类似原生 Array
    // 好处：提升可读性和使用体验
    // 与 OC 对比：OC 使用 objectAtIndex:，语法更冗长
    subscript(i: Int) -> T { items[i] }
}

// Container 协议扩展
// 用途：为所有遵守 Container 的类型提供默认实现
// 好处：代码复用，避免每个类型都单独实现
// 与 OC 对比：OC 协议无法直接提供默认实现，需要通过 Category 或基类实现
extension Container {
    // 方法 isEmpty:
    // 判断容器是否为空
    // 好处：提供通用功能，减少重复代码
    // 与 OC 对比：NSMutableArray 需要自己写 count == 0 判断
    func isEmpty() -> Bool { count == 0 }
}

// 扩展带条件约束
extension Container where Item: Equatable {
    // 方法 contains:
    // 判断容器中是否包含指定元素
    // 好处：提供通用功能，减少重复代码
    // 与 OC 对比：OC 需要自己遍历 NSArray 对象实现 contains
    func contains(_ item: Item) -> Bool {
        for i in 0..<count {
            if self[i] == item { return true }
        }
        return false
    }
}

// 泛型结构体 Pair
// 用途：将两个不同（或相同）类型的值打包在一起
// 好处：提供灵活的数据组合方式，避免为不同类型组合单独定义结构体
// 与 OC 对比：OC 需要手动定义类来存储两个值，泛型支持较弱
struct Pair<T, U> {
    var first: T
    var second: U
    
    init(_ first: T, _ second: U) {
        self.first = first
        self.second = second
    }
}

// MARK: - 2. 泛型函数示例

struct AdvancedGenerics {
    // 泛型函数 swap
    // 用途：交换任意类型变量
    // 好处：类型安全复用代码，无需重复实现
    // 与 OC 对比：OC 无原生泛型，只能使用 id 或宏模板
    func genericSwap<T>(_ a: inout T, _ b: inout T) {
        let temp = a
        a = b
        b = temp
    }
    
    // 协议 + 泛型使用示例
    func containerExample() {
        var array = GenericArray<Int>()
        array.append(1)
        array.append(2)
        print("数组元素: \(array[0]), 数量: \(array.count)") // 输出: 数组元素: 1, 数量: 2
        print("数组是否为空: \(array.isEmpty())") // 输出: 数组是否为空: false
        print("是否包含 2: \(array.contains(2))") // 输出: 是否包含 2: true
        
        let shapes: [Drawable] = [Circle(), Square()]
        shapes.forEach { $0.draw() } // 输出: 绘制圆形 -> 绘制正方形
    }
}

// MARK: - 3. 错误处理

struct AdvancedErrorHandling {
    // 简单错误示例
    enum SampleError: Error { case failed }
    
    func throwsExample(shouldFail: Bool) throws {
        if shouldFail { throw SampleError.failed }
        print("成功") // 输出: 成功（如果不抛错）
    }
    
    // 模拟网络请求错误
    enum NetworkError: Error { case badURL, requestFailed }
    
    func loadData(from url: String) throws -> String {
        guard url == "https://valid.url" else {
            throw NetworkError.badURL
        }
        return "数据加载成功"
    }
    
    // 异步错误处理示例
    func asyncThrowExample() async {
        do {
            let result = try await fetchData()
            print("异步数据: \(result)") // 输出: 异步数据: Fetched data
        } catch {
            print("异步错误: \(error)")
        }
    }
    
    // 异步获取数据
    private func fetchData() async throws -> String {
        try await Task.sleep(nanoseconds: 1_000_000_000) // 模拟 1 秒延迟
        return "Fetched data"
    }
    
    // 强制 try! 示例
    func forceFetchData() async -> String {
        try! await fetchData() // 强制解包异步结果，可能崩溃
    }
}

// MARK: - 4. 属性示例

struct PropertyExample {
    var stored: Int = 0 // 存储属性
    var computed: Int { stored * 2 } // 计算属性
    
    lazy var lazyValue: String = {
        print("lazy 初始化") // 延迟初始化输出
        return "Lazy"
    }()
    
    var willSetValue: Int = 0 {
        willSet { print("将设置为: \(newValue)") }
        didSet { print("已设置为: \(willSetValue), 之前是: \(oldValue)") }
    }
}

// MARK: - 5. 内存管理示例

class Person {
    var name: String
    weak var pet: Pet? // 防止循环引用
    init(name: String) { self.name = name }
    deinit { print("\(name) 释放") }
}

class Pet {
    var type: String
    weak var owner: Person? // 防止循环引用
    init(type: String) { self.type = type }
    deinit { print("\(type) 释放") }
}

// MARK: - 6. 访问控制示例

struct AccessControlExample {
    private var privateVar = "Private" // 文件外不可见
    fileprivate func fileprivateFunc() { print("Fileprivate") } // 文件内可见
    internal func internalFunc() { print("Internal") } // 模块内可见
    public func publicFunc() { print("Public") } // 全局可见
}

// MARK: - 7. 并发示例
struct ConcurrencyExample {
    
    // 异步示例：简单 async/await
    func asyncExample() async {
        let result = try? await fetchData()
        print("Async result: \(result ?? "Default value")")
    }
    
    private func fetchData() async throws -> String {
        try await Task.sleep(nanoseconds: 1_000_000_000) // 模拟 1 秒延迟
        return "Fetched data"
    }
    
    // GCD 示例
    func gcdExample() {
        DispatchQueue.global().async {
            print("GCD 异步任务") // 输出: GCD 异步任务（后台线程）
        }
    }
    
    // Actor 示例，保证线程安全
    actor DataManager {
        private var data = 0
        func increment() { data += 1 }
        func getData() -> Int { data }
    }
    
    // MARK: - 并发多个任务示例
    // 教学点：
    // 1. async let 支持并发任务
    // 2. fetchData() 为 async throws，需要使用 try
    // 3. await 每个 async let 变量，不能直接 await 数组
    func concurrentExample() async {
        // 并发创建两个异步任务
        async let first = try fetchData()
        async let second = try fetchData()
        
        // 分别 await 并捕获错误
        do {
            let firstResult = try await first
            let secondResult = try await second
            
            // 合并结果到数组
            let results = [firstResult, secondResult]
            
            // 输出结果
            print("Concurrent results: \(results)") // 输出: Concurrent results: ["Fetched data", "Fetched data"]
            
        } catch {
            // 异步任务出错处理
            print("并发任务出错: \(error)")
        }
    }
}


// MARK: - 8. 函数派发机制
struct DispatchExample {
    // 静态派发
    struct DispatchObject {
        static func staticMethod() -> String { "Static" }
    }
    
    // 表派发
    class DispatchClass {
        func tableMethod() -> String { "Table" }
    }
    
    // Objective-C 消息派发
    @objc class ObjCMethod: NSObject {
        @objc func messageDispatch() -> String { "Message" }
    }
    
    func demo() {
        print(DispatchObject.staticMethod()) // 输出: Static
        let obj = DispatchClass()
        print(obj.tableMethod()) // 输出: Table
        let objcObj = ObjCMethod()
        print(objcObj.messageDispatch()) // 输出: Message
    }
}
