//
//  ViewController.swift
//  FormAnimationRotate
//
//  Created by Gio on 2/7/18.
//  Copyright © 2018 George Lomsadze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var viewTitleLbl: UILabel!
  @IBOutlet weak var mainView: UIView!
  @IBOutlet weak var loginStackView: UIStackView!
  
  @IBOutlet weak var registerStackView: UIStackView!{
    didSet{
      registerStackView.isHidden = true
    }
  }
  
  private var isLoginActiveView: Bool{
    get{
        return registerStackView.isHidden && !loginStackView.isHidden
    }
    set{
        loginStackView.isHidden = !loginStackView.isHidden
        registerStackView.isHidden = !registerStackView.isHidden
    }
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func showRegisterFormview(_ sender: UIButton) {
    if isLoginActiveView{
      UIView.transition(with: mainView,
                        duration: 0.6,
                        options: [.transitionFlipFromLeft],
                        animations: {
                        self.isLoginActiveView = !self.isLoginActiveView
                        self.viewTitleLbl.text = "Register"
                          
      })
    }
  }
  
  @IBAction func backToLoginView(_ sender: UIButton) {
    if !isLoginActiveView{
      UIView.transition(with: mainView,
                        duration: 0.6,
                        options: [.transitionFlipFromRight],
                        animations: {
                        self.isLoginActiveView = !self.isLoginActiveView
                        self.viewTitleLbl.text = "Login"
      })
    }
  }
  
}

