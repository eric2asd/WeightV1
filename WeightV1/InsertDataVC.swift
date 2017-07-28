//
//  InsertDataVC.swift
//  WeightV1
//
//  Created by Lee on 2017/7/16.
//  Copyright © 2017年 Lee. All rights reserved.
//

import UIKit

class InsertDataVC: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var insertDataLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var tallLabel: UILabel!
    
    @IBOutlet weak var sexLabel: UILabel!
    
    @IBOutlet weak var birthYearLabel: UILabel!
    
    @IBOutlet weak var weightTextField: UITextField!

    @IBOutlet weak var tallTextField: UITextField!

    @IBOutlet weak var nextPageBtn: UIButton!
    @IBAction func nextPageBtn(_ sender: Any) {
        if noText() {
            
        }
        
    }

    
    
    
    // 結束編輯 把鍵盤隱藏起來
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //判斷帳號密碼空白時跳出 Alert 視窗
    private func noText() -> Bool{
        if weightTextField.text == "" || tallTextField.text == "" {
            //建立一個 Alert 視窗
            let alertController = UIAlertController(title: "Warning", message: "Weight and Tall can not be empty!", preferredStyle: .alert)
            //建立一個按鈕
            let confirm = UIAlertAction(title: "ok", style: .default, handler: {(action)in
                //self.dismiss(animated: true, completion: nil)
            })
            //把按鈕加進 Alert 視窗
            alertController.addAction(confirm)
            //呈現 Alert 視窗
            present(alertController, animated: true, completion: nil)
            
            print("no")
            return false
        }else {
            print("ok")
            return true
        }

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        //偵測不同裝置變換文字大小
        switch traitCollection.userInterfaceIdiom{
        case .phone:
            insertDataLabel.font = UIFont.systemFont(ofSize: 36)
            weightLabel.font = UIFont.systemFont(ofSize: 20)
            tallLabel.font = UIFont.systemFont(ofSize: 20)
            sexLabel.font = UIFont.systemFont(ofSize: 20)
            birthYearLabel.font = UIFont.systemFont(ofSize: 20)
            nextPageBtn.titleLabel?.font = nextPageBtn.titleLabel?.font.withSize(20)
        case .pad:
            insertDataLabel.font = UIFont.systemFont(ofSize: 48)
            weightLabel.font = UIFont.systemFont(ofSize: 36)
            tallLabel.font = UIFont.systemFont(ofSize: 36)
            sexLabel.font = UIFont.systemFont(ofSize: 36)
            birthYearLabel.font = UIFont.systemFont(ofSize: 36)
            nextPageBtn.titleLabel?.font = nextPageBtn.titleLabel?.font.withSize(36)
        default:break
        }
        
    //按鈕圓角陰影
    nextPageBtn.layer.cornerRadius = 15
    nextPageBtn.layer.shadowColor = UIColor.black.cgColor
    nextPageBtn.layer.shadowRadius = 15
    nextPageBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
    nextPageBtn.layer.shadowOpacity = 0.4
    }



}
