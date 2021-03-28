//
//  ViewController.swift
//  Alerts
//
//  Created by somsak on 29/3/2564 BE.
//

import UIKit

class AlertsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func defaultAction(_ sender: UIButton) {

        let dialogMessage = UIAlertController(title: "Attention", message: "I am an alert message you cannot dissmiss.", preferredStyle: .alert)

        self.present(dialogMessage, animated: true, completion:{
           dialogMessage.view.superview?.isUserInteractionEnabled = true
           dialogMessage.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.dismissOnTapOutside)))
        })
    }
    
    @objc func dismissOnTapOutside(){
       self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func oneAction(_ sender: UIButton) {

        let alert = UIAlertController(title: "My Title", message: "This is my message.", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: handlerAction))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func twoAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "UIAlertController", message: "Would you like to continue learning how to use iOS alerts?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: handlerAction))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { (handler) in
            print("handler in funtion")
        }))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func threeAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Notice", message: "Lauching this missile will destroy the entire universe. Is this what you intended to do?", preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Remind Me Tomorrow", style: UIAlertAction.Style.default, handler: handlerAction))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: handlerAction))
        alert.addAction(UIAlertAction(title: "Launch the Missile", style: UIAlertAction.Style.destructive, handler: handlerAction))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func inputInAlertTextFields(_ sender: UIButton) {
        let alert = UIAlertController(title: "What's your name?", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: handlerAction))
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Input your name here..."
        })
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            self.handlerActionInput(data: (alert.textFields?.first?.text)!)
        }))

        self.present(alert, animated: true)
    }
    
    func handlerAction(action: UIAlertAction) {
        print("openPage")
    }
    
    func handlerActionInput(data: String){
        print("Your name: \(data)")
    }
}

