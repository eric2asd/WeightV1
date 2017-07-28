//
//  ChoiceDeviceVC.swift
//  WeightV1
//
//  Created by Lee on 2017/7/16.
//  Copyright © 2017年 Lee. All rights reserved.
//

import UIKit
import CoreBluetooth
enum SendDataError:Error {
    case CharacteristicNotFound
}

class ChoiceDeviceVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var choiceDeviceLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    

    let app = UIApplication.shared.delegate as! AppDelegate
    var timer:Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {(timer) in
            self.tableView.reloadData()
        })
        timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true, block: {(timer) in
            self.tableView.reloadData()
            self.nextView()
        })
        //View背景顏色
        //背景漸層的兩個漸層顏色
        let color1 = UIColor(colorLiteralRed: 62/255, green: 101/255, blue: 93/255, alpha: 1)
        let color2 = UIColor(colorLiteralRed: 57/255, green: 65/255, blue: 101/255, alpha: 1)
        //產生漸層Layer
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [color1.cgColor , color2.cgColor]
        //把漸層Layer加入畫面中
        self.view.layer.insertSublayer(gradient, at: 0)
        
    }

    

    override func viewWillAppear(_ animated: Bool) {
        //偵測不同裝置變換文字大小
        switch traitCollection.userInterfaceIdiom{
        case .phone:
            choiceDeviceLabel.font = UIFont.systemFont(ofSize: 36)
        case .pad:
            choiceDeviceLabel.font = UIFont.systemFont(ofSize: 48)
        default:break
        }
    }
    
    //tableView 處理
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return app.bleManage.peripherals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = app.bleManage.peripherals[indexPath.row].name
        
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        app.bleManage.connectPeripheral = app.bleManage.peripherals[indexPath.row]
        app.bleManage.connectPeripheral.delegate = app.bleManage
        app.bleManage.centralManager.connect(app.bleManage.peripherals[indexPath.row], options: nil)
        
        
    }
    private func nextView(){
        if app.bleManage.isconnect{
            timer?.invalidate()
            timer = nil
            if let vc = storyboard?.instantiateViewController(withIdentifier: "InsertData"){
                show(vc, sender: self)
            }
        }
    }


    

}
