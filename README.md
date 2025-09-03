#  Swift 学习大纲

##  初级部分（基础语法）

1. **变量与常量**

   * `var` 可变
   * `let` 不可变

2. **基本数据类型**

   * Int, Double, Float, String, Bool, Character

3. **字符串与数组**

   * 字符串拼接、插值 `\(var)`
   * 数组增删改查

4. **字典与集合**

   * Dictionary：键值对存储
   * Set：去重集合

5. **控制语句**

   * if / else
   * switch / case（支持模式匹配）
   * for / while / repeat-while

6. **函数**

   * 基本定义、参数与返回值
   * 参数标签（外部名 / 内部名）

7. **可选类型（Optional）**

   * `?` 表示可能为 `nil`
   * `!` 强制解包
   * `if let`、`guard let` 安全解包


##  中级部分（进阶语法）

1. **闭包（Closure）**

   * 基本定义：匿名函数
   * 尾随闭包
   * 参数简写：`$0`, `$1`
   * 捕获环境（捕获外部变量）

2. **函数是一等公民**

   * 函数可以作为参数或返回值
   * 高阶函数

3. **高阶函数**

   * `map`: 映射
   * `filter`: 过滤
   * `reduce`: 聚合
   * `flatMap`: 展平并映射

4. **可选链**

   * `object?.property`
   * `object?.method()`
   * 与 `??`（空合并运算符）结合

5. **枚举（Enum）**

   * 关联值
   * 原始值
   * `switch` 搭配模式匹配

6. **结构体（Struct）与类（Class）**

   * 值类型 vs 引用类型
   * mutating 方法
   * 构造器 `init`

7. **协议（Protocol）**

   * 协议定义
   * 协议继承
   * 协议扩展（Protocol Extension）

8. **扩展（Extension）**

   * 给已有类型添加功能
   * 常用于解耦和代码复用

9. **defer**

   * 延迟执行，用于资源释放

##  高级部分（进阶与底层）

1. **泛型（Generics）**

   * 泛型函数
   * 泛型类型
   * 关联类型（associatedtype）

2. **协议导向编程（POP）**

   * 协议扩展默认实现
   * 与面向对象的区别

3. **错误处理**

   * `throws / try / catch`
   * `try?` 与 `try!`

4. **属性**

   * 存储属性 vs 计算属性
   * `lazy` 延迟属性
   * 属性观察器：`willSet`、`didSet`

5. **内存管理**

   * ARC（自动引用计数）
   * 强引用 / 弱引用 / 无主引用

6. **访问控制**

   * `public`、`internal`、`fileprivate`、`private`

7. **并发（Concurrency）**

   * GCD (Grand Central Dispatch)
   * async / await（Swift 5.5+）
   * Task、Actor

8. **函数派发机制**

   * 静态派发（编译期）
   * 表派发（vtable）
   * 消息派发（Objective-C runtime）

