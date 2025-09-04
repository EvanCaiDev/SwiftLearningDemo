//
//  ContentView.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Button("初级示例") {
                // MARK: - 测试代码
                // 运行所有函数，展示输出结果，方便复习
                let beginner = Beginner()
                beginner.variableExample()
                beginner.stringExample()
                beginner.arrayDictionaryExample()
                beginner.setExample()
                print(beginner.conditionalExample(score: 85))
                beginner.loopExample()
                print(beginner.functionExample(name: "Alice", age: 25))
                beginner.optionalExample(input: "Swift")
                beginner.optionalExample(input: nil)
            }
            
            Button("中级示例") {
                let intermediate = Intermediate()
                intermediate.optionalChainingExample()
                intermediate.closureExample()
                intermediate.higherOrderFunctionExample()
                intermediate.capturedClosureExample()
                intermediate.deferExample()
                
                // 枚举示例
                let result = Intermediate.NetworkResult.success(data: "Hello")
                intermediate.enumExample(result: result)
            }
            
            Button("高级示例") {
                let advanced = Advanced()
                
                // 泛型
                var a = 10, b = 20
                advanced.genericSwap(&a, &b)
                print("交换后 a: \(a), b: \(b)")
                
                // 协议示例
                advanced.protocolExample()
                
                // 错误处理
                do {
                    try advanced.throwsExample(shouldFail: false)
                    try advanced.throwsExample(shouldFail: true)
                } catch {
                    print("捕获到错误: \(error)")
                }
                
                // 并发示例
                Task {
                    await advanced.asyncExample()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
