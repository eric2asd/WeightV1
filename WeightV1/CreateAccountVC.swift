//
//  CreateAccountVC.swift
//  WeightV1
//
//  Created by user on 2017/7/19.
//  Copyright © 2017年 Lee. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    var accountInfo:[AccountIfno] = []
    @IBOutlet weak var LogoImg: UIImageView!
    
    @IBOutlet weak var createNewAccountLabel: UILabel!

    @IBOutlet weak var continueBtn: UIButton!

    @IBOutlet weak var newAccountTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    
    @IBOutlet weak var newEmailTextField: UITextField!
    @IBAction func continueBtn(_ sender: Any) {
        noText()
        // Get 傳值給後台
        do{
            let account = newEmailTextField.text
            let password = newPasswordTextField.text
            let email = newEmailTextField.text
            
            let urlString = "https://lab-hyuntaiking.c9users.io/PHP/addMember.php?account=\(account!)&password=\(password!)&email=\(email!)"
            let url = URL(string: urlString)
            let source = try String(contentsOf: url!,
                                    encoding: String.Encoding.utf8)
            if source == "true" {
                print("Add OK")
            }else {
                print("Add Fail")
            }
        }catch {
            print("OKOKO")
            // 處理 try 的錯誤
            print(error)
        }
    }
    
    // 結束編輯 把鍵盤隱藏起來
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    //判斷帳號密碼空白時跳出 Alert 視窗
    private func noText(){
        if newAccountTextField.text == "" || newPasswordTextField.text == "" || newEmailTextField.text == "" {
            //建立一個 Alert 視窗
            let alertController = UIAlertController(title: "Warning", message: "Account and Password can not be empty!", preferredStyle: .alert)
            //建立一個按鈕
            let confirm = UIAlertAction(title: "ok", style: .default, handler: {(action)in
                //self.dismiss(animated: true, completion: nil)
            })
            //把按鈕加進 Alert 視窗
            alertController.addAction(confirm)
            //呈現 Alert 視窗
            present(alertController, animated: true, completion: nil)
            print("no")
        }else {
            
            print("yes")
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
            createNewAccountLabel.font = UIFont.systemFont(ofSize: 30)
            continueBtn.titleLabel?.font = continueBtn.titleLabel?.font.withSize(20)
        case .pad:
            createNewAccountLabel.font = UIFont.systemFont(ofSize: 48)
            continueBtn.titleLabel?.font = continueBtn.titleLabel?.font.withSize(36)
        default:break
        }
        
    //按鈕圓角陰影
    continueBtn.layer.cornerRadius = 15
    continueBtn.layer.shadowColor = UIColor.black.cgColor
    continueBtn.layer.shadowRadius = 15
    continueBtn.layer.shadowOffset = CGSize(width: 2, height: 2)
    continueBtn.layer.shadowOpacity = 0.4
    }

}
