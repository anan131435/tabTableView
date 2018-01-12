//
//  HeaderView.swift
//  tableview
//
//  Created by 韩志峰 on 2018/1/10.
//  Copyright © 2018年 韩志峰. All rights reserved.
//

import UIKit

@objc  protocol HZHeaderViewDelegate{
    @objc optional func headerViewDidClick(type: String)
}
class HZHeaderView: UIView {
    var itemWidth: CGFloat = 0
    var itemHeight: CGFloat = 30
    var selectedBtn: UIButton?
    var delegate: HZHeaderViewDelegate?
    init(frame: CGRect,titlesArray:[String]) {
        super.init(frame: frame)
        self.setupChildViews(titleArray: titlesArray)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupChildViews(titleArray:[String]){
        itemWidth = KScreenW / CGFloat(titleArray.count)
        for index in 0..<titleArray.count{
            let title = titleArray[index]
            let button = UIButton.init(frame: CGRect.init(x: CGFloat(index) * itemWidth , y: 0, width: itemWidth, height: itemHeight))
            if index == 0{
                button.isSelected = true
                self.selectedBtn = button
            }
            button.setTitleColor(UIColor.red, for: .selected)
            button.setTitleColor(UIColor.gray, for: .normal)
            
            switch title{
            case "mylesson":
                button.setTitle("我的报名", for: .normal)
                button.tag = 1000
                break
            case "living":
                button.setTitle("直播中", for: .normal)
                button.tag = 1001
                break
            case "will":
                button.setTitle("精彩预告", for: .normal)
                button.tag = 1002
                break
            case "history":
                button.setTitle("历史课程", for: .normal)
                button.tag = 1003
                break
            default:
                break
            }
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.addTarget(self, action: #selector(buttonDidClick(sender:)), for: .touchUpInside)
            self.addSubview(button)
        }
    }
    @objc func buttonDidClick(sender: UIButton){
        if sender.tag == self.selectedBtn?.tag {
            print("tag chongfu")
            print(sender.tag)
            return
            
        }
        self.selectedBtn?.isSelected = false
        sender.isSelected = !sender.isSelected
        self.selectedBtn = sender
        switch sender.tag {
        case 1000:
            self.delegate?.headerViewDidClick!(type:"mylesson")
            break
        case 1001:
            self.delegate?.headerViewDidClick!(type:"living")
            break
        case 1002:
            self.delegate?.headerViewDidClick!(type:"will")
            break
        case 1003:
            self.delegate?.headerViewDidClick!(type:"history")
            break
        default:
            break
        }
        
    }
    func headerViewSelectedItem(type: String){
        switch type{
        case "mylesson":
            self.decideWhichBtnToSelcted(index: 1000)
            break
        case "living":
            self.decideWhichBtnToSelcted(index: 1001)
            break
        case "will":
            self.decideWhichBtnToSelcted(index: 1002)
            break
        case "history":
            self.decideWhichBtnToSelcted(index: 1003)
            break
        default:
            break
        }
        
    }
    func decideWhichBtnToSelcted(index: Int){
        for subView in self.subviews{
            if let button = subView as? UIButton{
            if subView.tag == index{
                    button.isSelected = true
                    self.selectedBtn = button
                
            }else{
                button.isSelected = false
                }
                
            }
        }
    }
}
