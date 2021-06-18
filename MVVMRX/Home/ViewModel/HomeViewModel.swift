//
//  HomeViewModel.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/16/21.
//
import RxCocoa
import RxSwift
import MOLH
class HomeViewModel {

    //MARK:- loading Behavior
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    //MARK:- check the internet connection Publish
    var alertBehaviorCheckInternet = PublishSubject<String>()
    //MARK:- isTableHidden Behavior private
    private var isTableHidden = BehaviorRelay<Bool>(value: false)
    //MARK:- branchesModelSubject Behavior private
    private var HomeModelSubject = PublishSubject<[HomeSucccessData]>()
    
    
    
    
    //MARK:- isTableHiddenObservable Behavior public
    var isTableHiddenObservable: Observable<Bool> {
        return isTableHidden.asObservable()
    }
    //MARK:- branchesModelObservable Behavior public
    var homeModelObservable: Observable<[HomeSucccessData]> {
        return HomeModelSubject
    }
    
    //MARK:- change language
    func changeLang() {
        if MOLHLanguage.isArabic() {
            MOLH.setLanguageTo("en")
            MOLH.reset()
        } else {
            MOLH.setLanguageTo("ar")
            MOLH.reset()
        }
    }
    //MARK:- logout app function
    func logoutApp() {
        Helper.Saveuser_namen(name: nil)
        Helper.Saveuser_Email(email: nil)
        Helper.Saveuser_phone(phone: nil)
        Helper.SaveApitoken(token: nil)
        Helper.Saveuser_birth(birth: nil)
        Helper.Saveuser_id(user_id: nil)
      
    }
    
   // MARK:- function cell api services
     func fetchData() {
         loadingBehavior.accept(true)
        ApiServices.instance.FetchData(url: .home, methodType: .get, parameters: nil) { [weak self]
            (HomeModel: HomeSucccessModel?, dataError: HomeErrorModel?, error) in
       
            guard let self = self else { return }
            self.loadingBehavior.accept(false)
            if let error = error {
                self.alertBehaviorCheckInternet.onNext(error.localizedDescription)
                print(error.localizedDescription)
            // error data
            } else if let dataError = dataError {
                print(dataError.msg  ?? "")
               // self.loginModelSubjectError.onNext(loginModel)
            // success data
            } else {
                guard let HomeModel = HomeModel else { return }
                if HomeModel.data?.count ?? 0 > 0 {
                    self.HomeModelSubject.onNext(HomeModel.data ?? [])
                    self.isTableHidden.accept(false)
                } else {
                    self.isTableHidden.accept(true)
                }
            }
         }
     }
}
