//
//  CustomNavBar.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 02/03/23.
//

import UIKit

class CustomNavBar: UIView {

    lazy var categoryTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var featureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    lazy var cardImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    lazy var overlayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .black.withAlphaComponent(0.7)
        return v
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
        addSubview(cardImage)
        addSubview(overlayView)
        addSubview(categoryTitle)
        addSubview(cardTitle)
        addSubview(featureLabel)
    }
    
    private func setupConstraints(){
        
        cardImage.pin(to: self)
        overlayView.pin(to: self) // imagem sobre toda view
        
        NSLayoutConstraint.activate([
        
            categoryTitle.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 5),
            categoryTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        
            cardTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            categoryTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cardTitle.topAnchor.constraint(equalTo: categoryTitle.bottomAnchor, constant: 5),
            
            featureLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            featureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            featureLabel.topAnchor.constraint(equalTo: cardTitle.bottomAnchor, constant: 5),
        ])
    }
    
    public func setupView(data: CardViewModel){
        cardTitle.text = data.cardTitle
        categoryTitle.text = data.categoryName
        cardImage.image = UIImage(named: data.cardImage ?? "")
        featureLabel.attributedText = .featureText(data.likeCount ?? "", data.duration ?? "")
    }
}
