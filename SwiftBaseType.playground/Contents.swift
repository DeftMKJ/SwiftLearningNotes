//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
// Swift提供了8，16，32和64有符号和无符号整数，例如16位无符号UInt16，32位有符号Int32

// 整数范围
// 无符号
let minValue = UInt64.min
let maxValue = UInt64.max
// 有符号
let minValue1 = Int8.min
let maxValue2 = Int8.max

// 我们不需要指定具体位数，在32位机器上，就是Int就是Int32，64位机器上就是Int64，统一使用Int就可


// 浮点型
// 1. Double表示64位浮点数。当你需要存储很大或者很高精度的浮点数时请使用此类型
// 2. Float表示32位浮点数。精度要求不高的话可以使用此类型
// Double精确度很高，至少有15位数字，而Float最少只有6位数字


// 类型安全和类型推断
// swift是一个类型安全的语言，编译器能准确的知道需要处理什么类型的值，如果你给String传入一个Int，会马上报错
// 类型推断，当你没有显示声明类型的时候
let numberOfLife = 10 // 编译器会自动推断出为Int
let numberOfWork = 10.3 // Double  Swift 总是会选择Double而不是Float
let numberOfMoview = 3 + 5.6 // Double


// 数值型字面量
/*
 1.十进制数，没有前缀
 2.二进制数，0b
 3.八进制数，0o
 4.十六进制数，0x
 */
let decimalInt = 35
let binaryInt = 0b100011
let octalInt = 0o43
let hexInt = 0x23

/*
 浮点字面量可以是十进制，也可以是16进制，十进制中指数用e 10的阶乘，16进制中用p  2的阶乘
 
 3.12e2 --- > 312
 3.12e-1 ---> 0.312
 
 0xCp2 ---- > 48
 0xCp-2 ----> 3
 */

// 示例66.666
let decNum =  15.666
let expDecNum = 1.5666e1
let hexExpNum = 0xf.aa7ef9db22d1p0


// 数值类型转换  SomeType(ofInitialValue)是调用 Swift 构造器并传入一个初始值的默认方法
let oneone : UInt8 = 10
let twotwo : UInt64 = 2000
let oneAndTwo = UInt64(oneone) + twotwo  // UInt64类型


// 整数和浮点型转换
let three = 3
let floatNum = 7.998
let result = Double(three) + floatNum // Double

let intResult = Int(floatNum) //浮点会被截断，只会取整，不会四舍五入，例如9.8-->9,8.1-->8,-2.1-->-2



// 类型别名 类似于OC的typeOf
typealias mikejing = Int
let testMax = mikejing.max // 9223372036854775807


/*
 把多个值组合成一个复合值。元组内的值可以是任意类型，并不要求是相同类型 --> 元祖 最有用的地方还是作为函数的返回值使用，可以返回多种多样
 */
let http404Error = (404, "Not Found")
// http404Error 的类型是 (Int, String)，值是 (404, "Not Found")
//(404, "Not Found")元组把一个Int值和一个String值组合起来表示 HTTP 状态码的两个部分：一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为(Int, String)的元组”

// 访问方式1
let (statusCode,statusMessage) = http404Error
print("访问方式1  \(statusMessage)--->\(statusCode)")

// 访问方式2 如果你只关心一部分
let (statusCode1,_) = http404Error
print("访问方式2  \(statusCode)")

// 访问方式3 下标
print("访问方式3  \(http404Error.0)--->\(http404Error.1)")

// 访问方式4 指定名称
let http200Succeed = (code:200,msg:"Succeed")
print("访问方式4  \(http200Succeed.code)--->\(http200Succeed.msg)")


/*
 可选类型 ？
 C 和 Objective-C 中并没有可选类型这个概念。最接近的是 Objective-C 中的一个特性，一个方法要不返回一个对象要不返回nil，nil表示“缺少一个合法的对象”。然而，这只对对象起作用——对于结构体，基本的 C 类型或者枚举类型不起作用。对于这些类型，Objective-C 方法一般会返回一个特殊值（比如NSNotFound）来暗示值缺失。这种方法假设方法的调用者知道并记得对特殊值进行判断。然而，Swift 的可选类型可以让你暗示任意类型的值缺失，并不需要一个特殊值
 */
// 这里resultNum被推断出是Int？可选类型，这里字符串转换Int可能出现nil的情况 也就是说可能包含Int值也可能不包含值
// 当你确定有值得时候，可以用！来进行强制解析，但是如果是nil,你用！强制解析就会报错
// fatal error: unexpectedly found nil while unwrapping an Optional value  let originNum = "123e" 解出来就是nil


// Ex 1
let originNum = "123"
let resultNum = Int(originNum)
//print("hehe---\(resultNum)")  hehe---Optional(123)
print("hehe---\(resultNum!)")   // hehe---123


// Ex 2
let originNum1 = "123ddd"
let resutlNum1 = Int(originNum1)
print("\(String(describing: resutlNum1))") // nil 如果直接resultNum1！进行强制解析 ——————> error

// Ex 3
let originNum2 = "123mkj"
let resutlNum2 = Int(originNum2)
if let value = resutlNum2 {
    print("has value ---> \(value)")
}
else{
    print("no value ---> \(String(describing: resutlNum2))")  // no value ---> nil
}


/*
 if 语句以及强制解析
 */

if resutlNum2 != nil {
    print("force par \(resutlNum2!)")
}
else
{
    print("不能强制解析")
}


/*
 可选绑定
 optional binding
 对可选类型的值进行判断并把值赋给一个常量或者变量
 */

//if let constantName = someOptional {
//    // session
//}
/* 
 重写上面if语句的强制解析
 “如果Int(originNum2)返回的可选类型包含一个确切的值，那么创建一个常量并赋值，如果转换成功，if分支就可以使用它，由于它已经被可选类型的值初始化了，因此不需要进行强制解析！，可以理解为，给常量能赋值并初始化，这个if判断必定存在值，而且能成功赋值使用，不然就走下一个分支了，如果你需要使用变量，用var就可以了”
 */
if let constantName = Int(originNum2){
    print("optional bingding has value \(constantName)")
}else{
    print("optional bingding has no value")
}


/*
 隐式解析可选类型
 1.可选类型按时常量或者变量可以没有值，可以用if进行nil判断，也可以通过可选绑定来解析值
 2.如果一个程序中变量或者常量你可以保证肯定有值，每次判断就没必要了，就可以被定义为隐式解析类型  声明 String？ --> String！
 3.可以理解为自动解析的可选类型，只是在声明的时候加上！就可以了，不需要每次获取的时候进行强制解析，直接拿
 4.既然可以理解为自动解析的可选类型，那么如果没有值，类似于nil的时候进行！强制解析，一样崩溃
 */
// 隐式解析的对比
let exString : String! = "隐式解析"
print(exString)

let exString1 : String? = "可选类型"
print(exString1!)



/*
 可选类型：
 1.当你一个方法的转换他有可能失败，因此他有可能不是你想要的值，而是nil，因此例如你要返回的是String，可选类型就是String？，要么返回string要么返回nil
 2.当你使用的时候，如果你确定可选类型包含值之后，可以使用！来进行强制解析（我确定这个东西有值，给我强制解析使用），这就是可选值类型的强制解析
    force unwrapping
 3.但是当你用！来解析一个可选类型，如果你确保不了他是否有值，如果是nil，这样解析的话就会崩溃
 4.optional binding可选绑定 对可选类型的值判断并赋值给一个常量或变量，例如`if let constantName = Int(originNum2)`，可选有值，就能赋值初始化成功，进入分支，否则就跳出
 5.nil不可用于常量和变量，如果要使用，必须声明为可选类型，例如 `var varluse : String?`没有显示赋值，系统给的是nil 注意：
 Swift 的nil和 Objective-C 中的nil并不一样。在 Objective-C 中，nil是一个指向不存在对象（空对象）的指针。在 Swift 中，nil不是指针——它是一个确定的值，用来表示值缺失。任何类型的可选状态都可以被设置为nil，不只是对象类型。
 6.隐式解析 首先保证声明周期存在必定有值，可以把可选类型？声明为！，可以理解为自动解析的可选类型，只是声明的时候统一加！罢了，需要的时候直接取即可
 */


/*
 断言：Assert
 断言一个条件语句是否为true，如果是，继续执行，如果false，代码停止，你的应用被终止 （打印调试语句）
 */
// 如果是负数，代码直接终止，打印log信息
let testNum = 0
assert(testNum >= 0, "number cannot less than zero")
/*
整数类型的下标索引被传入一个自定义下标脚本实现，但是下标索引值可能太小或者太大。
需要给函数传入一个值，但是非法的值可能导致函数不能正常执行。
一个可选值现在是nil，但是后面的代码运行需要一个非nil值。
*/











