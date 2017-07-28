//
//  ViewController.swift
//  WeightV1
//
//  Created by Lee on 2017/7/15.
//  Copyright © 2017年 Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    var accountInfo:[AccountIfno] = []
    
    @IBOutlet weak var LogoImage: UIImageView!
    
    @IBOutlet weak var accountLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var forGotLabel: UIButton!
    @IBOutlet weak var logInLabel: UIButton!
    
    @IBOutlet weak var createNewLabel: UIButton!
    
    @IBOutlet weak var guestLabel: UIButton!
    
    @IBOutlet weak var accountTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    @IBAction func createAccountBtn(_ sender: Any) {
//        if let vc = storyboard?.instantiateViewController(withIdentifier: "CreateNewAccount"){
//            show(vc, sender: self)
//        }
    }

    @IBAction func logInBtn(_ sender: Any) {
        noText()
    }
   

    @IBAction func forgotPassWordBtn(_ sender: Any) {
    }
 
    @IBAction func guestBtn(_ sender: Any) {
    }
    
    // 結束編輯 把鍵盤隱藏起來
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    //判斷帳號密碼空白時跳出 Alert 視窗
    private func noText(){
        if accountTextField.text == "" || passwordTextField.text == "" {
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

    
    // Get 傳值給後台
    private func getMemberPhp() {
        do {
            let url = URL(string: "https://lab-hyuntaiking.c9users.io/PHP/queryMember.php")
            let data = try Data(contentsOf: url!)
            parseJson(json: data)
            print("pass")
            print(data)
        } catch {
            print(error)
        }
    }
    
    private func parseJson(json:Data){
        do{
            if let jsonObj = try? JSONSerialization.jsonObject(with: json, options: .allowFragments) {
                let allObj = jsonObj as! [[String: AnyObject]]
                print(allObj.count)
                for r in allObj  {
                    let accountInfo = AccountIfno()
                    accountInfo.accountName = r["account"]   as! String
                    accountInfo.password    = r["passwd"]    as! String
                    accountInfo.email       = r["email"]     as! String
                    self.accountInfo.append(accountInfo)
                    
                }
            }
        }catch{
            print(error)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //View背景顏色
        //背景漸層的兩個漸層顏色
        let color1 = UIColor(colorLiteralRed: 70/255, green: 114/255, blue: 99/255, alpha: 1)
        let color2 = UIColor(colorLiteralRed: 57/255, green: 65/255, blue: 101/255, alpha: 1)
        //產生漸層Layer
        let gradient = CAGradientLayer()
        gradient.frame = self.view.frame
        gradient.colors = [color1.cgColor , color2.cgColor]
        //把漸層Layer加入畫面中
        self.view.layer.insertSublayer(gradient, at: 0)
        
        
        //偵測不同裝置變換文字大小
        switch traitCollection.userInterfaceIdiom{
        case .phone:
            accountLabel.font = UIFont.systemFont(ofSize: 20)
            passwordLabel.font = UIFont.systemFont(ofSize: 20)
            logInLabel.titleLabel?.font = logInLabel.titleLabel?.font.withSize(20)
            forGotLabel.titleLabel?.font = forGotLabel.titleLabel?.font.withSize(20)
            createNewLabel.titleLabel?.font = createNewLabel.titleLabel?.font.withSize(20)
            guestLabel.titleLabel?.font = guestLabel.titleLabel?.font.withSize(20)
            print("iphone")
        case .pad:
            accountLabel.font = UIFont.systemFont(ofSize: 36)
            passwordLabel.font = UIFont.systemFont(ofSize: 36)
            logInLabel.titleLabel?.font = logInLabel.titleLabel?.font.withSize(36)
            forGotLabel.titleLabel?.font = forGotLabel.titleLabel?.font.withSize(36)
            createNewLabel.titleLabel?.font = createNewLabel.titleLabel?.font.withSize(36)
            guestLabel.titleLabel?.font = guestLabel.titleLabel?.font.withSize(36)
            print("pad")
        default: break
            
        }
        
        //按鈕圓角陰影
        logInLabel.layer.cornerRadius = 15
        logInLabel.layer.shadowColor = UIColor.black.cgColor
        logInLabel.layer.shadowRadius = 15
        logInLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        logInLabel.layer.shadowOpacity = 0.4
        
        createNewLabel.layer.cornerRadius = 20
        createNewLabel.layer.shadowColor = UIColor.black.cgColor
        createNewLabel.layer.shadowRadius = 15
        createNewLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        createNewLabel.layer.shadowOpacity = 0.4
        
        guestLabel.layer.cornerRadius = 20
        guestLabel.layer.shadowColor = UIColor.black.cgColor
        guestLabel.layer.shadowRadius = 15
        guestLabel.layer.shadowOffset = CGSize(width: 2, height: 2)
        guestLabel.layer.shadowOpacity = 0.4
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

