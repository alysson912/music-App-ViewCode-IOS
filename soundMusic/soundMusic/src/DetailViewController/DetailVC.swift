//
//  DetailVC.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 28/02/23.
//

import UIKit

class DetailVC: UIViewController {
    
    var screen: DetailScreen?
    var cardModel: CardViewModel?
    
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
    
    
}
