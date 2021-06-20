//
//  ItemsDetailsVC.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/20/21.
//


import UIKit
import RxCocoa
import RxSwift
class ItemsDetailsVC: UIViewController {
    
    //MARK:- outLet
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var continerView: UIView!
    
    //MARK:- variable
    var id = ""
    let disposeBag = DisposeBag()
    let itemsViewModel = ItemsViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        logout()
        getData()
        bindToHiddenContiner()
        subscribToLoading()
        subscribeToSuccess()
    }
    //MARK:- loading data funtion
    func subscribToLoading() {
        itemsViewModel.loadingBehavior.subscribe(onNext: {(isLoading) in
            if isLoading {
                self.showIndicator()
                self.continerView.isHidden = true
            } else {
                self.hideIndicator()
                self.continerView.isHidden = false
            }
        }).disposed(by: disposeBag)
    }
  //  MARK:- check status data
    func subscribeToSuccess() {
        itemsViewModel.ItemsModelObservable.subscribe(onNext: { print($0)
            self.name.text = $0[0].name ?? ""
            self.desc.text = $0[0].body
            self.img.loadImage(URL(string: $0[0].size_image?.image_url ?? ""))
        }).disposed(by: disposeBag)
    }
    //MARK:- bind to hidden continer
    func bindToHiddenContiner() {
        itemsViewModel.isContinerHiddenObservable.bind(to: self.continerView.rx.isHidden).disposed(by: disposeBag)
    }
  //  MARK:- getData function
    func getData() {
        itemsViewModel.fetchData(IDBehavior: id)
    }
    //MARK:- logout function
    func logout() {
        backButton.rx.tap.throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext: { [weak self](_) in
            guard let self = self else { return }
            self.dismiss()
        }).disposed(by: disposeBag)
    }
}
