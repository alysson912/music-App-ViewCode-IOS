//
//  CustomCardView.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 22/02/23.
//

import UIKit

enum ViewMode{
    case full
    case card
}

class CustomCardView: UIView {

    //MARK: PROPRIEDADES CARD
    var vmode: ViewMode?
    var containerTopConstraints: NSLayoutConstraint?
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
    var dataModel: CardViewModel?
    
    //MARK: Elementos
    
    //MARK: VIEW DO CARD
    lazy var cardContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 30
        v.clipsToBounds = true
        v.layer.shadowOpacity = 1 // sombras
        v.layer.shadowOffset = CGSize(width: 0, height: -2)
        v.layer.shadowRadius = 20
        return v
    }()
    
    //MARK: IMAGEM SOBRE O CARD COMO TODO
    lazy var cardImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        
        return img
    }()
    //MARK: VIEW ESCURECE IMAGE CARD
    
    lazy var overLayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return v
    }()
    
    //MARK: CONTORNO DE IMAGEM do perfil
    
    lazy var profileBorderView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.borderWidth = 1
        v.layer.backgroundColor = UIColor.white.cgColor
        v.layer.cornerRadius = 25
        return v
    }()
    
    lazy var cardProfilePicture: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    //MARK: add button userImage +
    
     lazy var addProfileImageButton: UIButton = {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.backgroundColor = .white
            btn.setBackgroundImage(UIImage( named: "plus"), for: .normal)
            btn.layer.cornerRadius =  10
            return btn
        }()
    // music category
    
    lazy var cardCategoryTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        l.textColor = .white
        return l
    }()
    
    // data category
    lazy var cardCategoryDateLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        return l
    }()
    // title
    lazy var cardTitle: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        l.textAlignment = .center
        
        return l
    }()
    
    // like and time
    lazy var likeAndTimeLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        
        return l
    }()
    // title description
    lazy var descriptionTitleLabel: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .white
        l.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        l.textAlignment = .center
        l.numberOfLines = 0
        return l
    }()
    
    init( viewMode: ViewMode, cardData: CardViewModel){
        let frame = CGRect.zero
        vmode = viewMode
        dataModel = cardData
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private  func addSubviews() {
        addSubview(cardContainerView)
        
        cardContainerView.addSubview(cardImage)
        cardContainerView.addSubview(overLayView)
        
        cardContainerView.addSubview(profileBorderView)
        cardContainerView.addSubview(cardProfilePicture)
        cardContainerView.addSubview(addProfileImageButton)
        
        cardContainerView.addSubview(cardCategoryTitleLabel)
        cardContainerView.addSubview(cardCategoryDateLabel)
        cardContainerView.addSubview(cardTitle)
        cardContainerView.addSubview(likeAndTimeLabel)
        cardContainerView.addSubview(descriptionTitleLabel)
        updateLayout(for: vmode ?? .card)
    }
    
    private func updateLayout(for mode: ViewMode){
        if mode == .full{
            containerTopConstraints?.constant = 0
            containerLeadingConstraints?.constant = 0
            containerTrailingConstraints?.constant = 0
            containerBottomConstraints?.constant = 0
            descriptionTitleLabel.isHidden = false // descricao desativada na tela normal
        }else {
            containerTopConstraints?.constant = 15
            containerLeadingConstraints?.constant = 30
            containerTrailingConstraints?.constant = -30
            containerBottomConstraints?.constant = -15
            descriptionTitleLabel.isHidden = true // ativada quando expandir
            
        }
    }
}
