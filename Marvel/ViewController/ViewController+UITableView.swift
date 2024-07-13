//
//  ViewController+UITableView.swift
//  Marvel
//
//  Created by iOS Lab on 22/06/24.
//
import UIKit

extension ViewController: UITableViewDataSource {
    // Apresenta a quantidade de tabelas que serão apresentadas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        heroes.count
    }
    // Coloca o espaçamento de uma linha na outra da minha tabela
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        Constants.heroCellHeight
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Trasnformo em variavel e uso o 'as' para chamar minha outra classe
        let baseCell = tableView.dequeueReusableCell(withIdentifier: Constants.heroCellName, for: indexPath)
        let cell = baseCell as? HeroCell
        guard let cell else{
            return baseCell
        }
        let hero = heroes[indexPath.row]
        cell.setup(name: hero.name, image: hero.image)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    //Executa tudo o que está na tabela
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       //Criamos uma variavel Sotryboard no qual estamos pegando o nome da nossa storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        lastIndexSelected = indexPath.row
        
    //Precisamos pegar os dados da nossa viewController que colocamos como detailVC
        let vc = storyboard.instantiateViewController(withIdentifier: "detailVC")
        //criamos um guard em cima da VC para transformar ela em uma label
        guard let detailVC = vc as? DetailViewController else {
            return
        }
        detailVC.delegate = self

        
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

