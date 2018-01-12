//
//  HZTableViewCell.swift
//  tableview
//
//  Created by 韩志峰 on 2018/1/11.
//  Copyright © 2018年 韩志峰. All rights reserved.
//

import UIKit
typealias HZTableViewCellBtnClick = (_ model: HZModel) -> ()
class HZTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    var btnClickClosure: HZTableViewCellBtnClick?
    var model: HZModel?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var registerName: UIButton!
    
    @IBAction func registerNameClick(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.model?.isSelected = sender.isSelected
        if self.btnClickClosure != nil{
            self.btnClickClosure!(self.model!)
        }
    }
    func updateContentWithModel(model: HZModel){
        self.model = model
        self.titleLabel.text = model.type
        
        if model.isSelected{
            self.registerName.isSelected = true
            self.registerName.setTitle("已报名", for:.normal )
        }else{
            self.registerName.isSelected = false
            self.registerName.setTitle("未报名", for:.normal )
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
