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
    
    private let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil.tip.crop.circle.badge.plus"), for: .normal)
        
        return button
    }()
    
    private var viewModel = MovieViewModel()
    private var bag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.frame = view.bounds
        
        button.frame = CGRect(x: 20, y: UIScreen.screenHeight-50, width: 30, height: 30)
        
        view.addSubview(tableView)
        view.addSubview(button)
        
        bindTableData()
    }
    
    func bindTableData() {
        //Bind items to the table
        viewModel.items.bind(
            to: tableView.rx.items(cellIdentifier: CustomViewCell.identifier, cellType: CustomViewCell.self)
        ) { row, model, cell in
            cell.movie = model
            
        }.disposed(by: bag)
        
        tableView.rx.modelSelected(Movie.self).bind { movie in
            let vc = MovieDetailView()
            vc.movie = movie
            self.present(vc, animated: true, completion: nil)
        }.disposed(by: bag)
        
        viewModel.fetchItem()
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UIScreen.screenHeight/5.5 + 20
    }
}
