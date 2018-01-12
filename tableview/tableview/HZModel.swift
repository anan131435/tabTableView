//
//  HZModel.swift
//  tableview
//
//  Created by 韩志峰 on 2018/1/10.
//  Copyright © 2018年 韩志峰. All rights reserved.
//

import UIKit

class HZModel: NSObject {
    var type: String
    var isSelected: Bool
    init(type: String) {
        self.type = type
        self.isSelected = false
    }
}
