//
//  ItemsViewModel.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/20/21.
//

import Foundation
import RxSwift
import RxCocoa

class ItemsViewModel {

    //MARK:- loading Behavior
    var loadingBehavior = BehaviorRelay<Bool>(value: false)
    //MARK:- check the internet connection Behavior
    var alertBehaviorCheckInternet = PublishSubject<String>()
    //MARK:- check error model
    var errorModelPublishSubject = PublishSubject<String>()
    
    //MARK:- isTableHidden Behavior private
    private var isContinerHidden = BehaviorRelay<Bool>(value: false)
    
    //MARK:- branchesModelSubject Behavior private
    private var ItemsModelSubject = PublishSubject<[ItemsDetailsSucccessData]>()
    
    
    
    
    //MARK:- isTableHiddenObservable Behavior public
    var isContinerHiddenObservable: Observable<Bool> {
        return isContinerHidden.asObservable()
    }
    //MARK:- branchesModelObservable Behavior public
    var ItemsModelObservable: Observable<[ItemsDetailsSucccessData]> {
        return ItemsModelSubject
    }
    
    // MARK:- function cell api services
    func fetchData(IDBehavior: String) {
          loadingBehavior.accept(true)
        ApiServices.instance.FetchData(url: "https://najlaboutique.qa/api/all-products/\(IDBehavior)", methodType: .get, parameters: nil)
        { [weak self](ItemsModel: ItemsDetailsSucccessModel?, dataError: ItemsDetailsErrorModel?, error) in
        
             guard let self = self else { return }
             self.loadingBehavior.accept(false)
             if let error = error {
                 self.alertBehaviorCheckInternet.onNext(error.localizedDescription)
                 print(error.localizedDescription)
             // error data
             } else if let dataError = dataError {
                 print(dataError.msg  ?? "")
                 self.errorModelPublishSubject.onNext(dataError.msg ?? "")
             // success data
             } else {
                 guard let ItemsModel = ItemsModel else { return }
                  print(IDBehavior)
                if ItemsModel.data?.count ?? 0 > 0 {
                    self.ItemsModelSubject.onNext(ItemsModel.data ?? [])
                    self.isContinerHidden.accept(false)
                } else {
                    self.isContinerHidden.accept(true)
                }
             }
          }
      }
}
