//
//  ViewController.swift
//  MovieMania
//
//  Created by Ahmad Ubaidillah on 10/07/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(CustomViewCell.self, forCellReuseIdentifier: CustomViewCell.identifier)
        return table
    
    }()

    private var viewModel = MovieViewModel()
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
        bindTableData()
    }
    
    func bindTableData() {
        //Bind items to the table
        viewModel.items.bind(
            to: tableView.rx.items(cellIdentifier: CustomViewCell.identifier, cellType: CustomViewCell.self)
        ) { row, model, cell in
            cell.movie = model
        }.disposed(by: bag)
        
        Observable
        .zip(tableView.rx.itemSelected, tableView.rx.modelSelected(MovieRealm.self))
        .bind { index, movie in
            let vc = MovieDetailView()
            vc.movie = movie
            self.tableView.deselectRow(at: index, animated: true)
            self.present(vc, animated: true, completion: nil)
        }.disposed(by: bag)
        
//        viewModel.fetchItem()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        (UIScreen.screenWidth/4)*1.5 + 20
    }
}
