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
                let beginner = Beginner()
                beginner.variableExample()
                beginner.arrayDictionaryExample()
                beginner.conditionalExample(70)
                beginner.loopExample()
                beginner.optionalExample()
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
