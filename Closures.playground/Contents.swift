//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 闭包
// 自包含的代码块，可以在代码中被传递和使用
// 闭包可以捕获和存储其所在上下文任意常量和变量的引用 这就是所谓的闭包并包裹着这些常量和变量，俗称闭包
// 闭包三种形式
// 1.全局函数是一个有名字但不会捕获任何值得闭包
// 2.嵌套函数是一个有名字并且可以捕获其封闭函数内值得闭包
// 3.闭包表达式是一个利用轻量级语法所写的可以捕获其上下文的变量和常量的匿名闭包

// 闭包的语法优化
// 1.利用上下文推断参数和返回值类型
// 2.隐式返回单表达式闭包，即单表达式可以省略return
// 3.参数名字缩写
// 4.尾随闭包（Training）

// 以sorted函数为例 public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]
// func someFunction(externalParameterName localParameterName: Int) {
// function body goes here, and can use localParameterName
// to refer to the argument value for that parameter
// }
// 如果你希望函数的使用者在调用函数时提供参数名字，那就需要给每个参数除了局部参数名外再定义一个外部参数名。外部参数名写在局部参数名之前，用空格分隔。



// 参数1 已知类型的数组 (目前的写法是只有一个参数,只需要一个闭包)
// 参数2 闭包函数 该闭包函数需要传入与数组类型相同的两个值，并返回一个布尔类型值来告诉sorted函数当排序结束后传入的第一个参数排在第二个参数前面还是后面。如果第一个参数值出现在第二个参数值前面，排序闭包函数需要返回true，反之返回false
let names = ["aaaa","ccc","fff","ggggg","tttt","hhhh"]

func sortClosureFunc(s1:String,s2:String)->Bool{
    return s1 > s2
}

var results = names.sorted(by: sortClosureFunc)



// 闭包写法
// 语法
//{
//    (parameters) -> returenType in
//        statement
//}

results = names.sorted(by: { (s1:String, s2:String) -> Bool in
    return s1 > s2
})

// 闭包的函数体部分由关键字in引入。 该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始。
// 因此也可以搞成一行
//results = names.sorted(by: { (s1:String, s2:String) -> Bool in return s1 > s2})


// 根据上下文推断类型
// 实际上任何情况下，通过内联闭包表达式构造的闭包作为参数传递给函数时，都可以推断出闭包的参数和返回值类型，这意味着您几乎不需要利用完整格式构造任何内联闭包
results = names.sorted(by: { s1,s2 in
    return s1 > s2
})

// 单表达式可以通过隐藏return关键字来隐藏单行返回的结果
results = names.sorted(by: {s1,s2 in s1 > s2})
print(results)


// 参数名称缩写
results = names.sorted(by: {$0 < $1})
print(results)

// 运算符函数
results = names.sorted(by: >)
print(results)

results = names.sorted{$0<$1}
print(results)


// 尾随闭包 Closure Training
func someFunctionClosure(closure:()->()){
    // 函数体
}

// 老式写法
someFunctionClosure(closure: {})

// 尾随写法
someFunctionClosure(){}


// 如果函数只需要闭包表达式一个参数，当您使用尾随闭包时，您甚至可以把()省略掉。  推荐写法
someFunctionClosure {
    
}

// 官方文档的闭包例子
enum HTTPResponse {
    case ok
    case error(Int)
}

let responses: [HTTPResponse] = [.error(500), .ok, .ok, .error(404), .error(403)]
let sortedResponses = responses.sorted {
    switch ($0, $1) {
    // Order errors by code
    case let (.error(aCode), .error(bCode)):
        return aCode < bCode
        
    // All successes are equivalent, so none is before any other
    case (.ok, .ok): return false
        
    // Order errors before successes
    case (.error, .ok): return true
    case (.ok, .error): return false
    }
}
print(sortedResponses)
//      Prints "[.error(403), .error(404), .error(500), .ok, .ok]"









// map numbers.map(<#T##transform: (Int) throws -> T##(Int) throws -> T#>)
// 使用 map 来遍历集合并对集合中每一个元素进行同样的操作
// 基本上就是默认尾随闭包，参数只有闭包，省略（），省略return 单行表达式闭包可以通过隐藏return关键字来隐式返回单行表达式的结果

let digistName = [0:"zore",1:"one",2:"two",3:"three",4:"four",5:"five",6:"six",7:"seven",8:"eight",9:"nine"]
let numbers = [213,44,658]

let stringNumbers = numbers.map { (num:Int) -> String in
    var num1 = num
    var string = ""
    while num1 > 0{
        string = digistName[num1 % 10]! + string
        num1 = num1 / 10
    }
    return string
}
print(stringNumbers)
// ["twoonethree", "fourfour", "sixfiveeight"]

let stringNumber2 = numbers.map {NumberFormatter.localizedString(from: NSNumber.init(value: $0), number: .spellOut) }
print(stringNumber2)
// ["two hundred thirteen", "forty-four", "six hundred fifty-eight"]


// 捕获值

// 闭包可以在其定义的上下文中捕获常量或变量。 即使定义这些常量和变量的原域已经不存在，闭包仍然可以在闭包函数体内引用和修改这些值。
// Swift最简单的闭包形式是嵌套函数，也就是定义在其他函数的函数体内的函数。 嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。

func makeIncreaseFunc(extensionNumber localNumber: Int) -> ()->Int{
    var totalAmount = 0;
    func increaseMent()->Int{
        totalAmount += localNumber
        return totalAmount
    }
    return increaseMent
}

let inc = makeIncreaseFunc(extensionNumber: 20)
inc() // 20
inc() // 40

let inc2 = makeIncreaseFunc(extensionNumber: 50)
inc2() // 50
inc2() // 100
//我们将函数赋给变量，这样我们可以通过变量来调用函数。运行结果使得我们可以发现，每次调用makeIncreaseFunc其实是创建了一个新的对象，inc1，和inc2并不一样。它们有着自己的值，之间并不共享。这说明，这些函数是一等函数，它们是对象，可以有多个实例，可以被赋给变量


// makeIncreaseFunc 函数里面嵌套了 increaseMent，嵌套函数increaseMent从上下文捕获了两个值 totalAmount 和 localNumber 之后 makeIncreaseFunc把 increaseMent作为返回值返回，每次外部调用 返回值的时候，就会返回totalAmount的值
/*
func increaseMent()->Int{
    totalAmount += localNumber
    return totalAmount
}
*/
// 单独看这个函数，没有传任何参数，而是通过值捕获和increaseMent一样保存在的内存中  捕获是强引用，保证makeIncreaseFunc挂了的时候，其参数和内部参数都能继续使用


// 如果单纯的函数嵌套，局部变量使用完之后就会被回收，再次调用函数的时候就会是原先的数据
func add(num:Int)->Int
{
    var value = 100
    func addDouble()->Int{
        value += num
        return value
    }
    return addDouble()
}
let testFun = add
testFun(200) // 300
testFun(200) // 300
testFun(200) // 300



// 内部嵌套函数通过返回值返回，外部进行引用，让局部变量常驻内存，这才算是个闭包
func add2(num:Int)->()->Int
{
    var value = 100
    
    func addDouble()->Int{
        value += num
        return value
    }
    return addDouble
}

let testFunc2 = add2(num: 200)
testFunc2() // 300
testFunc2() // 500
testFunc2() // 700









