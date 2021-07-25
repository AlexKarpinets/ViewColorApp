//
//  ColorsViewController.swift
//  ViewColorApp
//
//  Created by Karpinets Alexander on 24.07.2021.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setViewColors(colors: UIColor)
}

class ColorsViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.colorsWindows?.backgroundColor = view.backgroundColor
        settingsVC.delegate = self
    }
}

extension ColorsViewController: SettingsViewControllerDelegate{
    func setViewColors(colors: UIColor) {
        view.backgroundColor = colors
    }
}


