//
//  HomeScreen.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 22/02/23.
//

import UIKit

class HomeScreen: UIView {


    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.separatorStyle = .none // retirando linhas
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false // desativando scrool indicator
        tv.register(CardViewTableViewCell.self, forCellReuseIdentifier: CardViewTableViewCell.identifier)
        return tv
    }()
    
    public func configTableViewProtocols(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        // passando responsabilidades dos protocolos da tableView p/ VC
        tableView.delegate = delegate
        tableView.dataSource = dataSource
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints(){
        tableView.pin(to: self)// todas constranits zeradas (metodos da extension)
    }
}
