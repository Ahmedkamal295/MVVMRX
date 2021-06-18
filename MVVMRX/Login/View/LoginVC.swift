//
//  LoginVC.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//

import UIKit
import RxCocoa
import RxSwift

class LoginVC: UIViewController {
    
    // MARK:- outLet properties
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    //MARK:- empty array
    let loginViewModel = LoginViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindTextFieldsToViewModel()
        subscribeToLoginButton()
        subscribToLoading()
        subscribeToCheckInternet()
        checkErrorModel()
        subscribeToSuccess()
      
    }
    //MARK:- bind function
    func bindTextFieldsToViewModel() {
        phoneTF.rx.text.orEmpty.bind(to: loginViewModel.phoneBehavior).disposed(by: disposeBag)
        passwordTF.rx.text.orEmpty.bind(to: loginViewModel.passwordBehavior).disposed(by: disposeBag)
    }
    //MARK:- loading data
    func subscribToLoading() {
        loginViewModel.loadingBehavior.subscribe(onNext: {(isLoading) in
            
            if isLoading {
                self.showIndicator()
            } else {
                self.hideIndicator()
            }
        }).disposed(by: disposeBag)
    }
    //MARK:-  handel error Check Internet connection
    func subscribeToCheckInternet() {
        loginViewModel.alertBehaviorCheckInternet.asObservable()
            .subscribe(onNext: { print($0)
         self.createSkipAlert(alertTite: $0, alertMessage: "")
        }).disposed(by: disposeBag)
    }
    //MARK:-  handel error model
    func checkErrorModel() {
        loginViewModel.errorModelPublishSubject.asObservable()
            .subscribe(onNext: { print($0)
            self.createSkipAlert(alertTite: $0, alertMessage: "")
        }).disposed(by: disposeBag)
    }
    //MARK:- check status data
    func subscribeToSuccess() {
        loginViewModel.loginSuccessModel.subscribe(onNext: {
            if $0.status == true {
                self.goVC(viewController: HomeVC.self, storyboard: "Home")
                self.createSkipAlert(alertTite: "\($0.status!)", alertMessage: "Success Login")
               
            } else {
                self.createSkipAlert(alertTite: "\($0.status!)", alertMessage: "Wrong")
            }
        }).disposed(by: disposeBag)
    }
    //MARK:- login button
    func subscribeToLoginButton() {
        loginButton.rx.tap.throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance).filter({ (_) -> Bool in
            guard  !((self.phoneTF.text?.isEmpty)! || (self.passwordTF.text?.isEmpty)!)  else {
                self.createSkipAlert(alertTite: "Error", alertMessage: "Enter all data")
                return false
            }
            return true
               
            }).subscribe(onNext: { [weak self](_) in
                guard let self = self else { return }
                self.loginButton.rx.backgroundColor.onNext(.black)
                self.loginViewModel.fetchData()
            }).disposed(by: disposeBag)
    }
}
