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
       
       
    }

}

// entrando em conformidade com protocolos
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CardData.count // model externo

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
   
}
