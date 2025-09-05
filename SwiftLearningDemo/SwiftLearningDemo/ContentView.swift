//
//  ContentView.swift
//  SwiftLearningDemo
//
//  Created by caiwanhong on 2025/9/3.
//

import SwiftUI

struct ContentView: View {
    
     // MARK: - 运行初级示例
     private func runBeginnerExamples() {
         print("=== 变量和常量 ===")
         let beginner = Beginner()
         beginner.variableExample()
         print("------")
         
         print("=== 字符串操作 ===")
         beginner.stringExample()
         print("------")
         
         print("=== 数组与字典 ===")
         beginner.arrayDictionaryExample()
         print("------")
         
         print("=== 集合 ===")
         beginner.setExample()
         print("------")
         
         print("成绩评价 (85): \(beginner.conditionalExample(score: 85))")
         print("------")
         
         print("=== 循环 ===")
         beginner.loopExample()
         print("------")
         
         print("=== 函数 ===")
         print("\(beginner.functionExample(name: "Alice", age: 25))")
         print("------")
         
         print("=== 可选类型 ===")
         beginner.optionalExample(input: "Swift")
         beginner.optionalExample(input: nil)
         print("------")
         
         print("=== 初级示例结束 ===")
     }
     
     // MARK: - 运行中级示例
     private func runIntermediateExamples() {
         print("=== 可选链 ===")
         let intermediate = Intermediate()
         intermediate.optionalChainingExample()
         print("------")
         
         print("=== 闭包 ===")
         intermediate.closureExample()
         print("------")
         
         print("=== 枚举 ===")
         intermediate.enumExample(result: .success(data: "Request succeeded"))
         intermediate.enumExample(result: .failure(error: NSError(domain: "Test", code: -1, userInfo: nil)))
         print("------")
         
         print("=== 高阶函数 ===")
         intermediate.higherOrderFunctionExample()
         print("------")
         
         print("=== 捕获值闭包 ===")
         intermediate.capturedClosureExample()
         print("------")
         
         print("=== defer ===")
         intermediate.deferExample()
         print("------")
         
         print("=== 结构体与类 ===")
         intermediate.structVsClassExample()
         print("------")
         
         print("=== 协议与扩展 ===")
         intermediate.protocolAndExtensionExample()
         print("------")
         
         print("=== 中级示例结束 ===")
     }
    
    // MARK: - 运行高级示例
    private func runAdvancedExamples() async {
        print("=== 泛型与协议示例 ===")
        let generics = AdvancedGenerics()
        generics.containerExample()
        print("------")
        
        print("=== 泛型函数 Swap 示例 ===")
        var a = 10, b = 20
        generics.genericSwap(&a, &b)
        print("交换后 a=\(a), b=\(b)")
        print("------")
        
        print("=== 协议导向编程 POP 示例 ===")
        generics.containerExample()
        print("------")
        
        print("=== 错误处理示例 ===")
        let errorExample = AdvancedErrorHandling()
        do {
            try errorExample.throwsExample(shouldFail: false)
            try errorExample.throwsExample(shouldFail: true)
        } catch {
            print("捕获错误: \(error)")
        }
        
        do {
            let data = try errorExample.loadData(from: "https://valid.url")
            print("加载数据成功: \(data)")
        } catch {
            print("加载数据失败: \(error)")
        }
        
        print("=== 异步错误处理示例 ===")
        await errorExample.asyncThrowExample()
        print("------")
        
        print("=== 属性示例 ===")
        var prop = PropertyExample()
        print("计算属性 computed = \(prop.computed)")
        prop.stored = 5
        print("修改后 computed = \(prop.computed)")
        print("访问 lazy 属性: \(prop.lazyValue)")
        prop.willSetValue = 42
        print("------")
        
        print("=== 内存管理示例 ===")
        var person: Person? = Person(name: "小明")
        var pet: Pet? = Pet(type: "小猫")
        person?.pet = pet
        pet?.owner = person
        person = nil
        pet = nil
        print("------")
        
        print("=== 并发示例 ===")
        let concurrency = ConcurrencyExample()
        await concurrency.asyncExample()
        await concurrency.concurrentExample()
        concurrency.gcdExample()
        print("------")
        
        print("=== Actor 示例 ===")
        let manager = ConcurrencyExample.DataManager()
        await manager.increment()
        let value = await manager.getData()
        print("Actor 数据: \(value)")
        print("------")
        
        print("=== 函数派发示例 ===")
        let dispatch = DispatchExample()
        dispatch.demo()
        print("------")
        
        print("=== 高级示例结束 ===")
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Button("初级示例") {
                runBeginnerExamples()
            }
            
            Button("中级示例") {
                runIntermediateExamples()
            }
            
            Button("高级示例") {
                Task {
                    await runAdvancedExamples()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
