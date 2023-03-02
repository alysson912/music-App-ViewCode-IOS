//
//  DetailTableViewCellScreen.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 01/03/23.
//

import UIKit

class DetailTableViewCellScreen: UIView {

    lazy var thumbImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "demo")
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        
        return img
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste Nome"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return label
    }()

    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Sub Titulo"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .lightGray
        return label
    }()
    
    lazy var likeBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "love")?.withRenderingMode(.alwaysTemplate), for: .normal)
        // btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return btn
    }()
    
    lazy var moreBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(named: "more")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.tintColor = .lightGray
        // btn.addTarget(<#T##target: Any?##Any?#>, action: <#T##Selector#>, for: <#T##UIControl.Event#>)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(){
        addSubview(thumbImage)
        addSubview(titleLabel)
        addSubview(subTitle)
        addSubview(likeBtn)
        addSubview(moreBtn)
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
        
            thumbImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            thumbImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            thumbImage.heightAnchor.constraint(equalToConstant: 60),
            thumbImage.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant: 15),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            
            subTitle.leadingAnchor.constraint(equalTo: thumbImage.trailingAnchor, constant:  15),
            subTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant:  4),
            
            moreBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant:  -15),
            moreBtn.widthAnchor.constraint(equalToConstant: 35),
            moreBtn.heightAnchor.constraint(equalToConstant: 35),
            moreBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            likeBtn.trailingAnchor.constraint(equalTo: moreBtn.leadingAnchor, constant:  -15),
            likeBtn.widthAnchor.constraint(equalToConstant: 35),
            likeBtn.heightAnchor.constraint(equalToConstant: 35),
            likeBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            
        ])
    }
    
    public func setupCell(data: CardListModel){
        titleLabel.text = data.listTitle
        subTitle.text = data.listSubtitle
        thumbImage.image = UIImage(named: data.listImage ?? "")
    }
}
