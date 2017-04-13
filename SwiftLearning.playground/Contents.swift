//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/*
 * 1.声明
 */
//: 隐身声明
let interNum = 50

//: 显示声明
let expliceNum :Double = 40

/*
 * 2.字符串拼接
 */
//:1. 字符串拼接（数字转字符串）
let lable = "mmikejing"

let width = 30

let lableWidth = lable + String(width)
print(lable + "\(width)")

//:2.字符串拼接（\()）
let xiaoming = 10
let xiaohong = 20
let sumAge = "all ages is \(xiaoming + xiaohong)"

let xiaohei :Double = 99.1
let sumLeave = "xiaohei de age \(xiaohei)"

/*
 * 3.字典和数组的创建和访问
 */

//: 1.数组
var shoppingList = ["ta","he","she","her","we"]
print(shoppingList[1])
shoppingList[1] = "666"
print(shoppingList)


//: 2.字典
var dic :Dictionary = ["JSON":20,"LUSIA":30]
print(dic["JSON"]!) // 不加！是optional(20),强行拆包
dic["MKJ"] = 100
print(dic);

//: 3.空数组和空字典的创建
let emptyArray = [String]()  // 类型 + （）
var emptyArray1 = Array<Int>() // 类型 + （）
var emptyArray2:Array<Int> = [] // 显示声明 + 直接[]初始化


let empryDict = [String:Float]() // 类型 + ()
let empryDict1 = Dictionary<String,Float>() // 字典(,分割) + ()
let emtpryDict2:Dictionary<String,Float> = [:]


/*
 * 4.控制流 if switch for-in  while  do while
 */

//: 示例 1   if else
let scroes = [10,50,80,98,17]
var teamScroes = 0
for score in scroes {
    if score > 50 { // ---> if语句中必须是一个bool表达式  不能直接写score，系统不会进行默认的和0判断
        print(score)
        teamScroes += 3
    }
    else
    {
        teamScroes += 1
    }
}
print(teamScroes)


//: 示例 2  let常量的nil判断
var optionStr :String? = "woshiyizhizhu"
print(optionStr == nil)

// requires a contextual type
// let hehe = nil  
// let声明的变量不能为nil，因此可以拿这个点来做if判断，因为swift不可以直接把值弄上去，系统不会自动和0进行比对，一定要给表达式

var optionalStr : String? = "mikejing"
var greeting = "Hello!"
if let name = optionalStr {
    greeting = greeting + optionalStr!
}
else
{
    greeting = greeting + "chengjinjiao"
}
print(greeting)


//: 示例 3 switch支持任意类型的数据以及各种比较操作——不仅仅是整数以及测试相等。
// 声明'let'可用于匹配某部分固定值的模式 这句话有待琢磨。。。
let vagetable = "red tiger"
var vagetaleComment = ""
switch vagetable {
case "hehe":
    vagetaleComment = "add some numb"
case "wuyu":
    vagetaleComment = "that is a pig"
case let x where x.hasPrefix("red"):
    vagetaleComment = "yes get it \(x)"
default:
    vagetaleComment = "done"
}
print(vagetaleComment)

//: 示例 4 for in字典  查找最大值以及对应的key
let interestingNums = ["Prime":[1,2,3,4,5,6,7,40],"Fibonacci":[1,1,2,3,5,8],"Squre":[1,4,9,16,25,36]]
var largest = 0
var largestKey :String? = nil
for (key,value) in interestingNums {
    for num in value {
        if num > largest {
            largest = num
            largestKey = key
        }
    }
}
//print(largestKey! + " + " + String(largest))
print(largestKey! + "+" + "\(largest)")

//: 示例 5 简单的循环使用
// ..<不包含最大   ...包含最大值
var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
print(firstForLoop)



/*
 * 5.函数
 */
//: 示例1 基本函数
func greet(name:String,today:String,food:String) -> String{
    return "Hello \(name) today is \(today) eat \(food) im very happy"
}

print(greet(name: "MKJ", today: "4月10日", food: "🐂肉干"))



//: 示例2 利用元祖返回多个值
// 参数的值对应的写法的两种不同表现形式
// 例如是数组  1.scroes:[Int]  2.scroes:Array<Int>
// 例如是字典 1.scroes:[String:Int]  2.Dictionary<String,Int> 注意字典这里用的是逗号，不是冒号
func calculateStatics(scroes:Array<Int>) -> (min:Int , max:Int ,sum:Int)
{
    var min = scroes[0]
    var max = scroes[0]
    var sum = 0
    for sc in scroes {
        if sc > max {
            max = sc
        }
        else if sc < min {
            min = sc
        }
        sum += sc
    }
    return(min,max,sum)
}
let result = calculateStatics(scroes: [1,3,5,45,4])
print("max--->\(result.max),min--->\(result.min),sum--->\(result.sum)" + "--->mikekeing")


/*
 * 5.闭包  
 * 函数可以被嵌套，被嵌套的函数可以访问外侧函数的变量
 */
//: 示例1 最简单的闭包 函数嵌套
func closure_func () -> Int{
    var x = 0
    func add(){
        x += 10
    }
    add()
    return x
}
print("\(closure_func())")


//: 示例2 函数作为返回值  注意这里需要用函数作为返回值的时候参数一定要用括号，swift2.3的时候貌似不需要多好都行
//: error ---> single argument function types require parentheses
func makeImprove() -> ((Int) -> Int)
{
    func addCount(number:Int) -> Int{
        return number + 2
    }
    return addCount
}

var method = makeImprove()
print("\(method(10))")


//: 示例3 函数作为参数
func hasAnyMatch(list:Array<Int>,condition: (Int) -> Bool) -> Bool
{
    for score in list {
        if condition(score) {
            return true
        }
    }
    return false
}


func largeThan(number:Int) -> Bool
{
    return number > 100
}

var counts = [54,53,67,37,9,75]

print("是否有值大于100--->\(hasAnyMatch(list: counts, condition: largeThan))")

/*
 * 注意：1.闭包就是函数内嵌，内部函数可以访问其外部变量
 *      2.函数作为参数或者作为返回值，表达函数指针的时候一定要把参数类型加上括号，不然就error
 */


//: 示例4 函数其实就是一个特殊的闭包，使用{}来创建一个闭包，然后使用in 来分离参数返回值和函数体
let testResult = counts.map { (number:Int) -> Int in
    let result =  3 * number
    return result;
}
print(testResult)

// 示例5 匿名函数体的创建和使用例子 使用$0  $1来省略参数类型返回值和in，保留函数体
let cast = ["Vibim","John","Kibui","Koikis","YiYOLLLLLL"]
let lowcaseNames = cast.map {$0.lowercased()}
print(lowcaseNames)
let lowcaseCount = cast.map {$0.characters.count}
print(lowcaseCount)


// 示例6 正常和缩写的对比
let sortNumber = [1,55,6,3,75,43,73,4,64,66]
let sortedNum = sortNumber.sorted { (a, b) -> Bool in
    return a < b
}
print(sortedNum)


let sortenNum1 = sortedNum.sorted {$0 > $1}
print(sortenNum1)


// 示例7 重写闭包 对所有的奇数返回0
func testOdd(list:[Int]) -> [Int]
{
    var oddList = Array<Int>()
    func isOdd(num:Int) -> (){
        oddList.append(num % 2 == 0 ? num : 0)
    }
    for value in list {
        isOdd(num: value)
    }
    return oddList
}
print(testOdd(list: sortNumber))




// 类与对象的创建
// 形状基础类
class BaseShape {
    // 可以声明的时候初始化
    var numberOfSide:Int = 0
    var name:String
    init(name:String) {
        // 也可以析构的时候设置
        self.name = name
    }
    func baseDescription() -> String {
        return "a shape with \(numberOfSide) sides."
    }
}
var shape = BaseShape(name:"base shape")
shape.numberOfSide = 100
print(shape.baseDescription())

// 正方形
class Square : BaseShape{
    var sideLength:Double
    init(sideL:Double,name:String) {
        self.sideLength = sideL
        super.init(name: name)
        numberOfSide = 4
    }
    func areaSquare() -> Double {
        return sideLength * sideLength
    }
    override func baseDescription() -> String {
        return "square shpe with \(self.numberOfSide) sides."
    }
}

var squareShape = Square(sideL:8.8,name:"正方形")
print(squareShape.name + "area-->\(squareShape.areaSquare())  "+squareShape.baseDescription())

// 圆形
class Circle : BaseShape{
    var radi :Double
    init(radi:Double,name:String) {
        self.radi = radi
        super.init(name: name)
        self.numberOfSide = 1000
    }
    
    func areaCircle() -> Double {
        return 2 * 3.14 * radi * radi
    }
    
    var perimeter:Double{
        get{
            return 2 * 3.14 * radi * radi
        }
        set{
            self.radi = newValue
        }
    }
    
    override func baseDescription() -> String {
        return "Circle shpe with \(self.numberOfSide) sides."
    }
    
}

var circleShape = Circle(radi:5,name:"圆")
print(circleShape.name + "area-->\(circleShape.areaCircle())  "+circleShape.baseDescription())
circleShape.perimeter = 10.0
print(circleShape.name + "area-->\(circleShape.perimeter)  "+circleShape.baseDescription())

// ? 修饰
let optionalSquare: Square? = Square(sideL: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

// 枚举
enum Rank:Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack,Queen,Kink
    func comparision(a:Rank) -> Bool {
        return self.rawValue > a.rawValue
    }
    
    func descriptionSimple() -> String {
        switch self {
        case .Ace,.Two, .Three, .Four, .Five, .Six, .Seven, .Eight, .Nine, .Ten:
            return "ACE"
        case .Jack:
            return "JACK"
        case .Queen:
            return "QUEUE"
        case .Kink:
            return "KINK"
        default:
            return String(self.rawValue)
        }
    }
}

print("左值大于右值？--->\(Rank.Jack.comparision(a: Rank.Six))   " + Rank.Four.descriptionSimple())
Rank.Queen.rawValue // 正向装换
Rank(rawValue:12)?.descriptionSimple() // 逆向转换


// 枚举无非就是指定一个值 一个引用针对某一个值  元祖的参数方式有所不同
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}
// 创建第一个
let success = ServerResponse.Result("6:00 am", "8:09 pm")
// 创建第二个
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}


// 协议
/*
 // 定义
protocol SomeProtocol {
    // 这里是协议的定义部分
}
 // 创建
struct SomeStructure: FirstProtocol, AnotherProtocol {
 // 这里是结构体的定义部分
}

 // 拥有父类的写法
class SomeClass: SomeSuperClass, FirstProtocol,     AnotherProtocol {
 // 这里是类的定义部分
}
 它只指定属性的名称和类型。此外，协议还指定属性是只读的还是可读可写的。
 协议通常用 var 关键字来声明变量属性，在类型声明后加上 { set get } 来表示属性是可读可写的，只读属性则用 { get } 来表示
 
 // 协议的方法要求 不需要大括号和方法体。
 protocol RandomNumberGenerator {
 func random() -> Double
 }
 
*/
protocol sampleProtocol{
    // 任何sampleProtocol类型都得有一个只读的protocolProperty属性，类型为String 不能通过setter进行设值，只getter进行取值 计算类型
    var protocolProperty:String {get}
    // 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改  mutating
    // 实现协议中的 mutating 方法时，若是类类型，则不用写 mutating 关键字。而对于结构体和枚举，则必须写 mutating 关键字  修改值类型关键字
    mutating func appending()
}

class ExampleEntity : sampleProtocol{
    var protocolProperty: String = "mikejing  "
    // 类是对象属性，有地址，因此可以在方法中直接进行值的修改
    func appending() {
        protocolProperty += "class option protocol"
    }
}
var entityE = ExampleEntity()
entityE.appending()
print(entityE.protocolProperty)

// struct和enum都是值类型，不能在方法中进行属性值得修改，如果需要修改，必须加上mutating关键字
struct StructValue : sampleProtocol{
    var protocolProperty :String = "chengjingjiao  "
    mutating func appending() {
        protocolProperty += "struct option protocol"
    }
}

var structE = StructValue()
structE.appending()
print(structE.protocolProperty)

// 扩展 扩展int类型，自增一倍
extension Int : sampleProtocol{
    var protocolProperty: String{
        return "the number \(self)"
    }
    mutating func appending() {
        self += self
    }
}
var intNum = 200
intNum.appending()







