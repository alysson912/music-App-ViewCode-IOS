//
//  CardActionView.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 24/02/23.
//

import UIKit

class CardActionView: UIView {
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually // espaçamento entre elementos
        return sv
    }()
    
    lazy var downloadView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var notInterestedView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var playView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var likeView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var moreView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        
        return v
    }()
    
    lazy var downloadBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white.withAlphaComponent(0.3)
        btn.layer.cornerRadius = 22.5
        btn.setBackgroundImage(UIImage( named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)// quebra protocolos da imagens, podendo fazer manipulações
        btn.tintColor = .white
        btn.clipsToBounds = true
        return btn
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
