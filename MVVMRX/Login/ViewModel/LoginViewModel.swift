//
//  LoginViewModel.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//


import RxSwift
import RxCocoa
class LoginViewModel {
    //MARK:- behavior label
    var phoneBehavior = BehaviorRelay<String>(value: "")
    var passwordBehavior = BehaviorRelay<String>(value: "")
    //MARK:- loading Behavior
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    //MARK:- check the internet connection Behavior
    var alertBehaviorCheckInternet = PublishSubject<String>()
    //MARK:- check error model
    var errorModelPublishSubject = PublishSubject<String>()
    // MARK:- private model Observable
    private  var loginModelSuccessObservable = PublishSubject<LoginSuccessModel>()
  
   
    // MARK:- public model Observable
    var loginSuccessModel: Observable<LoginSuccessModel> {
        return loginModelSuccessObservable
    }

   //MARK:-  function cell api services
    func fetchData() {
        loadingBehavior.accept(true)
        let param = [
            "email": phoneBehavior.value,
            "password": passwordBehavior.value
        ]
        ApiServices.instance.FetchData(url: "https://najlaboutique.qa/api/login", methodType: .post, parameters: param as [String : AnyObject]) { [weak self]
            (loginModel: LoginSuccessModel?, dataError: LoginErrorModel?, error) in
       
            guard let self = self else { return }
            self.loadingBehavior.accept(false)
            // internet connection
            if let error = error {
                self.alertBehaviorCheckInternet.onNext("The Internet connection appears to be offline.")
                print(error.localizedDescription)
            // error data
            } else if let dataError = dataError {
                print(dataError.code  ?? "")
                self.errorModelPublishSubject.onNext(dataError.msg ?? "")
            // success data
            } else {
                guard let loginModel = loginModel else { return }
                
                Helper.Saveuser_namen(name: loginModel.data?.name)
                Helper.Saveuser_Email(email: loginModel.data?.email)
                Helper.SaveApitoken(token: loginModel.data?.api_token)
                Helper.Saveuser_id(user_id :" \(loginModel.data?.id ?? 0) ")
                print(loginModel.data?.id ?? "")
                self.loginModelSuccessObservable.onNext(loginModel)
             }
            
        }
    }
}
