//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

/// 转义字符\0(空字符)、\\(反斜线)、\t(水平制表符)、\n(换行符)、\r(回车符)、\"(双引号)、\'(单引号)。

/// Unicode 标量，写成\u{n}(u为小写)，其中n为任意的一到八位十六进制数。
let windoe = "\"我要成为海贼王的男人\"- 路飞"
let dorllar = "\u{24}"
let blackHeart = "\u{2665}"
let sparklingHeart = "\u{1F496}"


// 空字符串
let emptyString = ""
let anatherString = String()
if emptyString.isEmpty {
    print("空的，我擦")
}


// 可变和不可变字符串
var varString = "MKJ"
varString += "CJJ"
//let letString = "MKJ111"
//letString += "CJJ"
//在 Objective-C 和 Cocoa 中，您通过选择两个不同的类(NSString和NSMutableString)来指定该字符串是否可以被修改，Swift 中的字符串是否可以修改仅通过定义的是变量还是常量来决定，实现了多种类型可变性操作的统一。

// Swift 的String类型表示特定序列的Character（字符） 类型值的集合。 每一个字符值代表一个 Unicode 字符。 您可利用for-in循环来遍历字符串中的每一个字符 这里和之前的不同需要调用characters进行遍历

for charater in "he is a 🐶".characters {
    print(charater)
}


// 计算字符串的数量
let countingString = "ndsd dsfdgg kjjkfdfdlf;"

print("contingString is number of \(countingString.characters.count) charaters")



// 字符串拼接
let string1 = "111"
let string2 = "222"
var string3 = string1 + string2
let charater1 : Character = "?"
string3.append(charater1)

// 字符串格式化 \()
let num1 = 3
print("\(num1) * 2.5  是 \(Double(num1) * 2.5)")


// 字符串比较  相等 直接用==
let quato = "一样的"
let quate = "一样的"
if quate == quato {
    print("一样了")
}

// 和OC一样，判断前后缀用hasPrefix 和 hasSuffix

// 字符串大小写
let normal = "Could help me please"
let upString = normal.uppercased()
let downString = normal.lowercased()



// 数组
// 1.构造
// shoppingList变量被声明为“字符串值类型的数组“，记作[String]。 因为这个数组被规定只有String一种数据结构，所以只有String类型可以在其中被存取
var shoppingList:[String] = ["milk","apple"]

// swift可以自动推断类型 因此可以不用再数组申明之后写好类型，而是根据后面的数据类型来进行推断 以下
var shoppingList2 = ["milk","apple"]

// 2.获取数量/判断是否为空
print("shopping list has \(shoppingList.count) items")

if shoppingList.isEmpty {
    print("array is empty")
}

// 3.数据的添加删除和访问
shoppingList.append("reveal")
shoppingList += ["photo shop","Xmind"]

var item = shoppingList[0]

// 可以这样直接穿插扩充
shoppingList[2...3] = ["QQ","Wechat","MTJF"]

print(shoppingList)

shoppingList.removeLast()
shoppingList.removeFirst()

print(shoppingList)

// 4.遍历
for item in shoppingList {
    print(item)
}

// 需要所有信息
/*
 第1个是apple
 (offset: 0, element: "apple")
 第2个是QQ
 (offset: 1, element: "QQ")
 第3个是Wechat
 (offset: 2, element: "Wechat")
 第4个是MTJF
 (offset: 3, element: "MTJF")
*/
for value in shoppingList.enumerated() {
    print("第\(value.offset + 1)个是\(value.element)")
    print(value)
}


// 5.构建数据
var intArr = [Int]()
print("array of intArr has elements \(intArr.count) items")
// 重复创建
var repeatArray = [Double](repeatElement(3.0, count: 5))
print(repeatArray)


// Set集合 他是无序的
var setMusics:Set<String> = ["JJ","KK","LL","OO"]
for item in setMusics {
    print(item)
}
print("\n")
/*
 OO
 JJ
 KK
 LL
 */
// 有序输出

for item in setMusics.sorted() {
    print(item)
}
/*
 JJ
 KK
 LL
 OO
 */

let odd: Set = [1,3,5,7,9]
let even: Set = [0,2,4,6,8]
let deltaD: Set = [1,2,7,8]
// union 两个集合所有元素创建一个新的集合
print(odd.union(even).sorted())

// intersect 交集
print(odd.intersection(deltaD).sorted())

// exclusiveOr 反交集
print(odd.symmetricDifference(deltaD).sorted())


// subtract 调用序列中和另一序列中除去相交部分创建一个新的集合
var aaa:Set = [1,2,3,4,5]
let bbb:Set = [2,3,4]
print(aaa.subtracting(bbb).sorted())

/*
 [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
 [1, 7]
 [2, 3, 5, 8, 9]
 [1, 5]
 */



// 字典，这个和OC基本上一样的
// 创建
var nameDict = Dictionary<Int,String>()

// 给字典更新或者创建值有下面两种，一种直接访问key  还有一种是通过updateValue，找不到的时候会有反馈，进下一波操作，但是实际上有则更新，没有则添加
nameDict[1] = "mkj"
nameDict[2] = "cjj"

print(nameDict)

// 下面的方法会返回更新之前的原值
if let value = nameDict.updateValue("HEHE", forKey: 2) {
    print(nameDict[2]!)
    print(value)
}
// 如果存在，就和上面一样返回原值，if判断成立，更新旧值，但是没有的情况下返回就是nil，不能复制给let，因此if失败，同样添加新的key value，但是if走失败的逻辑
if let value = nameDict.updateValue("MEILE", forKey: 0) {
    print(nameDict[0]!)
}
else
{
    print("不存在")
}
print(nameDict)

// removeValueForKey

/*
 [2: "cjj", 1: "mkj"]
 HEHE
 cjj
 不存在
 [2: "HEHE", 0: "MEILE", 1: "mkj"]
 */







