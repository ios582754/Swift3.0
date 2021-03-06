//
//  ViewControllerCategory.swift
//  6-封装分类
//
//  Created by 蒋鹏 on 16/10/10.
//  Copyright © 2016年 蒋鹏. All rights reserved.
//  fatal error: unexpectedly found nil while unwrapping an Optional value

import Foundation

// 通过类别给对象拓展属性，使用Runtime绑定属性值
extension ViewController {
    
    // 平常写法【不推荐】
//    var jkPro: String? {
//        set {
//            objc_setAssociatedObject(self, "key", newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
//        }
//        
//        get {
//            return objc_getAssociatedObject(self, "key") as? String
//        }
//    }
    

    

    // 改进写法【推荐】
    
    struct RuntimeKey {
        static let jkKey = UnsafeRawPointer.init(bitPattern: "JKKey".hashValue)
        /// ...其他Key声明
    }
    
    var jkPro: String? {
        set {
            objc_setAssociatedObject(self, ViewController.RuntimeKey.jkKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        
        get {
            return objc_getAssociatedObject(self, ViewController.RuntimeKey.jkKey) as? String
        }
    }
}
