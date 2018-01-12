//
//  ViewController.swift
//  tableview
//
//  Created by 韩志峰 on 2017/12/12.
//  Copyright © 2017年 韩志峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HZHeaderViewDelegate,UITableViewDelegate,UITableViewDataSource {
    var headerView: HZHeaderView?
    var itemHeight: CGFloat = 30
    var tableView: UITableView?
    var dataSource:[HZModel] = Array()
    let cellIdentifier: String = "HZTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        let titleArray:[String] = ["mylesson","living","will","history"]
        for _ in 0...4{
            let model = HZModel.init(type: "mylesson")
            dataSource.append(model)
        }
        for _ in 0...10{
            let model = HZModel.init(type: "living")
            dataSource.append(model)
        }
        for _ in 0...10{
            let model = HZModel.init(type: "will")
            dataSource.append(model)
        }
        for _ in 0...20{
            let model = HZModel.init(type: "history")
            dataSource.append(model)
        }
        
        self.headerView = HZHeaderView.init(frame: CGRect.init(x: 0, y: 64, width: KScreenW, height: itemHeight), titlesArray: titleArray)
        self.headerView?.delegate = self
        self.view.addSubview(self.headerView!)
        self.tableView = UITableView.init(frame: CGRect.init(x: 0, y: 64 + itemHeight, width: KScreenW, height: KScreenH - 64 - itemHeight ), style: .plain)
//        self.tableView?.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellIdentifier)
        self.tableView?.register(UINib.init(nibName: "HZTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.view.addSubview(self.tableView!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard self.dataSource.count > indexPath.row else {return UITableViewCell()}
        let cell: HZTableViewCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HZTableViewCell
        let model: HZModel = self.dataSource[indexPath.row]
        print(model.isSelected)
        print(indexPath.row)
        cell.updateContentWithModel(model: model)
        cell.btnClickClosure = { [weak self] (passModel: HZModel)in
            guard let strongSelf = self else { return }
            let model = HZModel.init(type: "mylesson")
            strongSelf.dataSource.insert(model, at: 0)
            strongSelf.tableView?.reloadData()
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func headerViewDidClick(type: String) {
        var indexRow: Int = 0
        switch type{
        case "mylesson":
            for (index,model) in self.dataSource.enumerated(){
                if model.type == "mylesson"{
                    indexRow = index
                    break
                }
            }
            break
        case "will":
            for (index,model) in self.dataSource.enumerated(){
                if model.type == "will"{
                    indexRow = index
                    break
                }
            }
            break
        case "living":
            for (index,model) in self.dataSource.enumerated(){
                if model.type == "living"{
                    indexRow = index
                    break
                }
            }
            break
        case "history":
            for (index,model) in self.dataSource.enumerated(){
                if model.type == "history"{
                    indexRow = index
                    break
                }
            }
            break
        default:
            break
        }
        
        self.tableView?.scrollToRow(at: IndexPath.init(row: indexRow, section: 0), at: .top, animated: true)
       
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard self.tableView?.visibleCells.count ?? 0 > 0 else {return}
        let cell: HZTableViewCell = tableView?.visibleCells.first as! HZTableViewCell
        let type = cell.model?.type ?? "mylesson"
        self.headerView?.headerViewSelectedItem(type: type)
    }
    
   

}


