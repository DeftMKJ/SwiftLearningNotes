//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"



/// 单参数
///
/// - Parameter personName: 参数1
/// - Returns: 返回类型
func sayHello(personName:String) -> String
{
    let greeting = "Hellow," + personName + "!"
    return greeting
}

print(sayHello(personName: "MKJ"))


/// 多参数
///
/// - Parameters:
///   - num1: 参数1
///   - num2: 参数2
/// - Returns: 返回类型
func delataTwoNumber(num1:Int, num2:Int) -> Int
{
    return num1 - num2
}

print(delataTwoNumber(num1: 10, num2: 1))

let funcD = delataTwoNumber
funcD(11,111)



/// 无参数
///
/// - Returns: 返回类型
func sayHelloWorld() -> String {
    return "hello, world"
}
print(sayHelloWorld())

func printSingleSlogan(slogan:String){
    print("woca,"+slogan + "!")
}

printSingleSlogan(slogan: "CJJ")



/// 默认参数名
///
/// - Parameters:
///   - string1: 参数1
///   - string2: 参数2
///   - joiner: 参数3
/// - Returns: 返回值
func join(string1:String,string2:String,joiner:String = "+") -> String
{
    return string1 + joiner + string2
}

print(join(string1: "我", string2: "你")) // "我+你\n"
print(join(string1: "他", string2: "她", joiner: "0")) // "他0她\n"



/// 可变参数
///
/// - Parameter numers: 参数数组
/// - Returns: 返回值
func total(numers:Double...) -> Double
{
    var totalD  = 0.0
    for numer in numers {
        totalD += numer
    }
    return totalD / Double(numers.count)
}



print("total is " + "\(total(numers: 2,10,21))")



/// 输入输出参数
///
/// - Parameters:
///   - a: 外部变量地址a
///   - b: 外部变量地址b
func swapTwoInts( a: inout Int, b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
//swapTwoInts(a: &someInt, b: &anotherInt)
swapTwoInts(a: &someInt, b: &anotherInt)
print("\(someInt)" + "\(anotherInt)")




/// 使用函数类型
///
/// - Parameters:
///   - a: 参数1
///   - b: 参数2
/// - Returns: 返回值
func add(a:Int,b:Int)->Int
{
    return a+b
}

func mutiby(a:Int,b:Int)->Int
{
    return a*b
}
// 指定函数类型
var mathFunction :(Int,Int) -> Int = add

print("Result:\(mathFunction(2,3))")

mathFunction = mutiby

print("Result:\(mathFunction(3,5))")

// 自动推断函数类型
let mathFunc = add
print("Result:\(mathFunc(2,5))")



/// 函数作为参数
///
/// - Parameters:
///   - a: <#a description#>
///   - b: <#b description#>
/// - Returns: <#return value description#>
func mathAdd(a:Int,b:Int) -> Int{
    return a+b
}

func printMathResult(mathFunc:(Int,Int)->Int,a:Int  ,b:Int){
    print("Result-->\(mathFunc(a,b))")
}

printMathResult(mathFunc: mathAdd, a: 3, b: 14)





/// 函数作为返回值
///
/// - Parameter number: <#number description#>
/// - Returns: <#return value description#>
func goForward(number:Int)->Int{
    return number + 1
}

func goBackward(number:Int)-> Int{
    return number - 1
}

func chooseStepFunction(chooseFlag:Bool) -> (Int)->Int{
    
    return chooseFlag ? goBackward : goForward
}

var countingNumber = 3
let moveFunc = chooseStepFunction(chooseFlag:  countingNumber > 0)

while countingNumber != 0 {
    print(String(countingNumber))
    countingNumber = moveFunc(countingNumber)
}
print("0!")

/// 3 2 1 0!






/// 嵌套函数
///
/// - Parameter chooseFlag: <#chooseFlag description#>
/// - Returns: <#return value description#>
func nestChooseStepFunction(chooseFlag:Bool) -> (Int)->Int{
    func stepF(num:Int)->Int{return num + 1}
    func stepB(num:Int)->Int{return num - 1}
    return chooseFlag ? stepF : stepB
}

var countingNum = -5
let resultFunc = nestChooseStepFunction(chooseFlag: countingNum < 0)

while countingNum < 0 {
    print("\(countingNum)" + "!")
    countingNum = resultFunc(countingNum)
}
print("0!")














