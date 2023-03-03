//
//  DetailVC.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 28/02/23.
//

import UIKit

enum StateAnimation{
    case long
    case short
}

class DetailVC: UIViewController {
    
    var screen: DetailScreen?
    var cardModel: CardViewModel?
    var valueAnimation: StateAnimation = .long
    
    override func loadView() {
        screen = DetailScreen(dataView: cardModel)
        screen?.configAllDelegates(
            tableViewDelegate: self,
            tableViewDataSource: self,
            scrollViewDelegate: self,
            detailViewScreenDelegate: self)
        
        view = screen
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    private func animationWithView(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut){
            self.view.layoutIfNeeded()
        }
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let window = UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .compactMap({$0 as? UIWindowScene})
            .first?.windows.filter({$0.isKeyWindow}).first
        
        let topPadding = window?.safeAreaInsets.top
        print(scrollView.contentOffset.y)
        
        if scrollView.contentOffset.y >= 300 {
            
            self.screen?.navBarTopAnchor?.constant = 0
            if valueAnimation == .long {
                animationWithView()
            }
            valueAnimation = .short
        }else{
            
            self.screen?.navBarTopAnchor?.constant = -((topPadding ?? 0.0) + 80)
            if valueAnimation == .short {
                animationWithView()
            }
            valueAnimation = .long
        }
    }
}

extension DetailVC: DetailScreenDelegate {
    func tappedCloseButton() {
        dismiss(animated: true, completion: nil)
    }
}

extension DetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  cardModel?.cardList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as?
        DetailTableViewCell
        cell?.setupCell(data: cardModel?.cardList?[indexPath.row] ?? CardListModel())
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        screen?.playerView.setupView(data: cardModel?.cardList?[indexPath.row] ?? CardListModel())
        screen?.playerViewBottomAnchor?.constant = 0
        animationWithView()
    }
    
    
}
