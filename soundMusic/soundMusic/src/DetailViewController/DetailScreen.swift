//
//  DetailScreen.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 28/02/23.
//

import UIKit

protocol DetailScreenDelegate: AnyObject{
    func tappedCloseButton()
    
}

class DetailScreen: UIView {

    private weak var delegate: DetailScreenDelegate?
    
    
    var cardModel: CardViewModel?
    var navBarTopAnchor: NSLayoutConstraint?
  
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        view.showsVerticalScrollIndicator = false
        view.autoresizingMask = .flexibleHeight
        view.bounces = false
        view.clipsToBounds = true
        return view
    }()
    
    lazy var cardView: CustomCardView = {
        let v = CustomCardView(mode: .full )
        v.translatesAutoresizingMaskIntoConstraints = false
        v.cardContainerView.layer.cornerRadius = 0.0
        v.setupView(data: cardModel ?? CardViewModel())
        
        return v
    }()
    
    lazy var navBar: CustomNavBar = {
       let v = CustomNavBar()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black
        v.setupView(data: cardModel ?? CardViewModel() )
        return v
    }()
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.separatorStyle = .none // retirando linhas
        tv.tableFooterView = UIView()
        tv.showsVerticalScrollIndicator = false // desativando scrool indicator
        tv.isScrollEnabled = false
        tv.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.identifier)
        tv.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        return tv
    }()
    

    
    lazy var closeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 15
        btn.setBackgroundImage(UIImage(named: "back")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .white
        
        //action
        btn.addTarget(self, action: #selector(closePressed), for: .touchUpInside)
       
        return btn
    }()
    
    @objc func closePressed(){
        delegate?.tappedCloseButton()
    }
    
     init(dataView: CardViewModel?) {
        super.init(frame: CGRect())
         cardModel = dataView
         DispatchQueue.main.async {// boa pratica para stack view, forcando a tableView a crescer
             self.setupViews()
             self.setupConstraints()
         }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(scrollView)
        scrollView.addSubview(cardView)
        scrollView.addSubview(tableView)
        addSubview(closeBtn)
        addSubview(navBar)
        
    }
    private func setupConstraints(){
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        print(topPadding as Any)
        
        scrollView.pin(to: self)
        
        NSLayoutConstraint.activate([
        
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant:  -(topPadding ?? 0)),// acessando safe area
            cardView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 500),
            cardView.widthAnchor.constraint(equalToConstant: frame.size.width),
            
            tableView.topAnchor.constraint(equalTo: cardView.bottomAnchor),
            tableView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            tableView.heightAnchor.constraint(equalToConstant: CGFloat(80 * (cardModel?.cardList?.count ?? 0)) + 20),// logica para passar valo ja estipulado para tela -> depende da cell
            tableView.widthAnchor.constraint(equalToConstant: frame.size.width),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            closeBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            closeBtn.widthAnchor.constraint(equalToConstant: 30),
            closeBtn.heightAnchor.constraint(equalToConstant: 30),
            closeBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            
            navBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: trailingAnchor),
            navBar.heightAnchor.constraint(equalToConstant: (( topPadding ?? 0.0) + 80))
        ])
        navBarTopAnchor = navBar.topAnchor.constraint(equalTo: topAnchor, constant: -(( topPadding ?? 0.0) + 60))
        navBarTopAnchor?.isActive = true
    }
    public func configAllDelegates(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource, scrollViewDelegate: UIScrollViewDelegate, detailViewScreenDelegate: DetailScreenDelegate){
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
        scrollView.delegate = scrollViewDelegate
        delegate = detailViewScreenDelegate
    }
}
