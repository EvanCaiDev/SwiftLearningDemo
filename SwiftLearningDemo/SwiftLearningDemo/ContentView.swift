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
                // MARK: - 测试代码
                // 运行所有函数，展示输出结果，方便复习
                let intermediate = Intermediate()
                intermediate.optionalChainingExample()
                intermediate.closureExample()
                intermediate.enumExample(result: .success(data: "Request succeeded"))
                intermediate.enumExample(result: .failure(error: NSError(domain: "Test", code: -1, userInfo: nil)))
                intermediate.higherOrderFunctionExample()
                intermediate.capturedClosureExample()
                intermediate.deferExample()
                intermediate.structVsClassExample()
                intermediate.protocolAndExtensionExample()
            }
            
            Button("高级示例") {
                Task { //  这里开启异步上下文
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
                    
                    print("=== 完整示例结束 ===")
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
