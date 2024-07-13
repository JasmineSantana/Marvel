//
//  ViewController+DetailView.swift
//  Marvel
//
//  Created by iOSLab on 13/07/24.
//


extension ViewController:DetailViewControllerDelegate {
    func getHero() -> Hero? {
        
        guard let lastIndexSelected else {
            return nil
        }
        return heroes[lastIndexSelected]
    }
}
