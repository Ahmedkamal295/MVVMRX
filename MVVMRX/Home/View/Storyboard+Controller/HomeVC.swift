//
//  HomeVC.swift
//  MVVMRX
//
//  Created by Ahmed kamal on 6/15/21.
//

import UIKit
import RxCocoa
import RxSwift
import MOLH
class HomeVC: UIViewController {
    
    // MARK:- outLet properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var changeLanguageButton: UIButton!
    //MARK:- empty array
    let homeViewModel = HomeViewModel()
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        subscribToLoading()
        bindToHiddenTable()
        subscribeToResponse()
        getData()
        subscribeToBranchSelection()
        subscribeChangeLanguage()
        logout()
     
    }
    //MARK:-  registerCells funcrion
    func registerCells() {
        tableView.registerCellNib(cellClass: CellHome.self)
    }
    //MARK:- loading data funtion
    func subscribToLoading() {
        homeViewModel.loadingBehavior.subscribe(onNext: {(isLoading) in
            if isLoading {
                self.showIndicator()
            } else {
                self.hideIndicator()
            }
        }).disposed(by: disposeBag)
    }
    //MARK:-  subscribeToResponse data
    func subscribeToResponse() {
        homeViewModel.homeModelObservable.bind(to: tableView.rx.items(cellIdentifier: String(describing: CellHome.self), cellType: CellHome.self)) { index, model, cell in
            
            cell.nameProduct.text = model.name
            cell.priceProduct.text = model.price
            let imageUrl = model.main_image?.image_url
            cell.imgProduct.loadImage(URL(string: imageUrl ?? ""))
           }.disposed(by: disposeBag)
    }
    //MARK:-  subscribeTo Selection item function
    func subscribeToBranchSelection() {
        Observable.zip(tableView.rx.itemSelected, tableView.rx.modelSelected(HomeSucccessData.self))
               .bind { selectedIndex, model in
                self.goVC(viewController: LoginVC.self, storyboard: "Login")
                print(selectedIndex, model.name ?? "")
            }
            .disposed(by: disposeBag)
    }
    //MARK:- bind to hidden table
    func bindToHiddenTable() {
        homeViewModel.isTableHiddenObservable.bind(to: self.containerView.rx.isHidden).disposed(by: disposeBag)
    }
    //MARK:- getData function
    func getData() {
        homeViewModel.fetchData()
    }
    //MARK:- changeLanguage function
    func subscribeChangeLanguage() {
        changeLanguageButton.rx.tap.throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext: { [weak self](_) in
            guard let self = self else { return }
            self.homeViewModel.changeLang()
        }).disposed(by: disposeBag)
    }
    //MARK:- logout function
    func logout() {
        logoutButton.rx.tap.throttle(RxTimeInterval.milliseconds(500), scheduler: MainScheduler.instance).subscribe(onNext: { [weak self](_) in
            guard let self = self else { return }
            self.homeViewModel.logoutApp()
            self.goVC(viewController: LoginVC.self, storyboard: "Login")
        }).disposed(by: disposeBag)
    }
}
