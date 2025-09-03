//
//  Advanced.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import Foundation

struct Advanced {
    
    // MARK: - 泛型函数
    func genericSwap<T>(_ a: inout T, _ b: inout T) {
        // T 是泛型，可以表示任意类型
        let temp = a
        a = b
        b = temp
    }
    
    // MARK: - 协议 (Protocol)
    protocol Drawable {
        func draw() // 定义协议方法
    }
    
    struct Circle: Drawable {
        func draw() { print("绘制圆形") }
    }
    
    struct Square: Drawable {
        func draw() { print("绘制正方形") }
    }
    
    func protocolExample() {
        let shapes: [Drawable] = [Circle(), Square()]
        // 多态：数组元素都是 Drawable 类型
        shapes.forEach { $0.draw() } // 调用协议方法
    }
    
    // MARK: - 并发 (async/await)
    func asyncExample() async {
        let result = await fetchData() // await 等待异步结果
        print("Async result: \(result)")
    }
    
    private func fetchData() async -> String {
        try? await Task.sleep(nanoseconds: 1_000_000_000) // 模拟异步延迟
        return "Fetched data"
    }
    
    // MARK: - 错误处理
    enum SampleError: Error {
        case failed
    }
    
    func throwsExample(shouldFail: Bool) throws {
        if shouldFail {
            throw SampleError.failed // 抛出错误
        }
        print("成功")
    }
}

