//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// 类和结构体共同点
/*
 1.定义属性用于存储值
 2.定义方法用于提供功能
 3.定义附属脚本用于访问值
 4.定义构造器用于生成初始化值
 5.通过扩展以增加默认实现的功能
 6.符合协议以对某类提供标准功能
 */

/*
 类的特有功能
 1.继承允许一个类继承另一个类的特征
 2.类型转换允许在运行时检查和解释一个类实例的类型
 3.解构器允许一个类实例释放任何其所被分配的资源
 4.引用计数允许对一个类的多次引用
 */

// 类和结构体有着类似的定义方式。我们通过关键字class和struct来分别表示类和结构体，并在一对大括号中定义它们的具体内容
/*
 class SomeClass {
 // class definition goes here
 }
 struct SomeStructure {
 // structure definition goes here
 }
 */

struct Area {
    var width = 0
    var height = 0
}

class JackModel{
    var area = Area()
    var isFemale = false
    var name : String?
}


let someArea = Area()
let someJackModel = JackModel()

print("The width of Area is \(someArea.width)")
someJackModel.area.width = 1040
print("The width of Area is \(someJackModel.area.width)")
// 注意： 与 Objective-C 语言不同的是，Swift 允许直接设置结构体属性的子属性。上面的最后一个例子，就是直接设置了someVideoMode中resolution属性的width这个子属性，以上操作并不需要重新设置resolution属性

// 结构体类型的成员逐一构造器 类就没有这种逐一构造方法
let hehe = Area(width:100,height:200)
print(hehe.height)


/*
 1.结构体和枚举--->值类型被赋予给一个变量，常数或者本身被传递给一个函数的时候，实际上操作的是其的拷贝。
 2.类——————>与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，操作的是引用，其并不是拷贝。因此，引用的是已存在的实例本身而不是其拷贝
 */


// 恒等运算符
/*
 因为类是引用类型，有可能有多个常量和变量在后台同时引用某一个类实例。（
 对于结构体和枚举来说，这并不成立。因为它们作为值类型，在被赋予到常量、变量或者传递到函数时，其值总是会被拷贝。
 1.请注意“等价于"（用三个等号表示，===） 与“等于"（用两个等号表示，==）的不同
 2.“等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
 3.“等于”表示两个实例的值“相等”或“相同”
 */


// 类和结构体的选择
/*
 然而，结构体实例总是通过值传递，类实例总是通过引用传递。
 这意味两者适用不同的任务。当你在考虑一个工程项目的数据构造和功能的时候，你需要决定每个数据构造是定义成类还是结构体。
 1.结构体的主要目的是用来封装少量相关简单数据值。
 2.有理由预计一个结构体实例在赋值或传递时，封装的数据将会被拷贝而不是被引用。
 3.任何在结构体中储存的值类型属性，也将会被拷贝，而不是被引用。
 4.结构体不需要去继承另一个已存在类型的属性或者行为。
 5.实际中，这意味着绝大部分的自定义数据构造都应该是类，而非结构体。
 */


/*
 Swift 中字符串（String）,数组（Array）和字典（Dictionary）类型均以结构体的形式实现。
 这意味着String，Array，Dictionary类型数据被赋值给新的常量(或变量），或者被传入函数（或方法）中时，它们的值会发生拷贝行为（值传递方式
 
 Objective-C中字符串（NSString）,数组（NSArray）和字典（NSDictionary）类型均以类的形式实现，这与Swfit中以值传递方式是不同的。NSString，NSArray，NSDictionary在发生赋值或者传入函数（或方法）时，不会发生值拷贝，而是传递已存在实例的引用。
 */


// 属性
/*
 简单来说，一个存储属性就是存储在特定类或结构体的实例里的一个常量或变量，
 存储属性可以是变量存储属性（用关键字var定义），也可以是常量存储属性（用关键字let定义）
 */

// 主要介绍下延迟存储属性 lazy关键字
/*
 1.可以理解为懒加载，这里有关键字给属性辅助
 2.必须将延迟存储属性声明成变量（使用var关键字），因为属性的值在实例构造完成之前可能无法得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
 */


class DataImporter {
    /*
     DataImporter 是一个将外部文件中的数据导入的类。
     这个类的初始化会消耗不少时间。
     因此一开始没用到就初始化会没必要 用懒加载进行操作
     */
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = String()
    // 这是提供数据管理功能
}

let manager = DataManager()
manager.data.append("mikejing")
manager.data.append("!!!")
print(manager.data)
// DataImporter 实例的 importer 属性还没有被创建
print(manager.importer.fileName)
// DataImporter 实例的 importer 属性现在被创建了
// 输出 "data.txt”







// getter setter willSet didSet
class StepCounter {
    var totalSteps: Int = 0 {
        
//        get {
//            return totalSteps
//        }
//        set {
//            totalSteps = newValue
//        }
        
        willSet(newTotalSteps) {
            print("will set \(newTotalSteps)")
        }
        didSet {
            print("did set")
            if totalSteps > oldValue  {
                print("add \(totalSteps - oldValue) steps")
            }
        }
    }
}

let name = StepCounter()
name.totalSteps = 100
// will set 100
// did set
// add 100 steps
name.totalSteps = 540
/*
 will set 540
 did set
 add 440 steps
 */
name.totalSteps = 775
/*
 will set 775
 did set
 add 235 steps
 */


// 方法
/*
 结构体和枚举能够定义方法是 Swift 与 C/Objective-C 的主要区别之一。在 Objective-C 中，类是唯一能定义方法的类型。但在 Swift 中，你不仅能选择是否要定义一个类/结构体/枚举，还能灵活的在你创建的类型（类/结构体/枚举）上定义方法。
 */
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    // by是外部参数  amount 是内部参数
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
let counter = Counter()
// the initial counter value is 0
counter.increment()
// the counter's value is now 1
counter.increment(by: 5)
// the counter's value is now 6
counter.reset()
// the counter's value is now 0

/* 1.在示例方法中修改值类型 Modifying Value Types from Within Instance Methods
 * 2.结构体和枚举是值类型。一般情况下，值类型的属性不能在它的实例方法中被修改。
 * 3.mutating方法就可以从方法内部改变它的属性
 */

struct Point{
    var x = 0.0
    var y = 0.0
    mutating func movePoint(x deltaX:Double,y deltaY:Double) {
        x += deltaX
        y += deltaY
    }
}

var pointA = Point(x:1.0,y:1.0)
print("x=\(pointA.x),y=\(pointA.y)")
pointA.movePoint(x: 9, y: 9)
print("x=\(pointA.x),y=\(pointA.y)")

// 注意：不能在结构体类型常量上调用变异方法，因为常量的属性不能被改变，即使想改变的是常量的变量属性也不行


// 另一种替换的方法  self 创建出来的对象会替换之前的值

struct PointB{
    var x1 = 0.0
    var y1 = 0.0
    mutating func movePointB(x deltaX:Double,y deltaY:Double){
        self = PointB(x1:x1 + deltaX,y1:y1+deltaY)
    }
}

var pointB = PointB(x1:200,y1:200)
print("x=\(pointB.x1),y=\(pointB.y1)")
pointB.movePointB(x: 9, y: 9)
print("x=\(pointB.x1),y=\(pointB.y1)")






