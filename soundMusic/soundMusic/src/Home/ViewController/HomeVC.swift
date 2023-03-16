//
//  ViewController.swift
//  soundMusic
//
//  Created by ALYSSON DODO on 22/02/23.
//

import UIKit

class HomeVC: UIViewController {

    var screen: HomeScreen?
    
    override func loadView() {
        screen = HomeScreen()
        screen?.configTableViewProtocols(delegate: self, dataSource: self) // assinando metodo la da screen
        view = screen
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // self.navigationController?.isNavigationBarHidden = true
       
    }

}

// entrando em conformidade com protocolos
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count // model externo

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CardViewTableViewCell.identifier, for: indexPath) as?
        CardViewTableViewCell
        
        cell?.setupCell(data: CardData[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       let vc = DetailVC()
        vc.cardModel = CardData[ indexPath.row]
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
   
}
