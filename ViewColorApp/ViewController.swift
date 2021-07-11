//
//  ViewController.swift
//  ViewColorApp
//
//  Created by Karpinets Alexander on 11.07.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorsWindows: UIView!
    
    @IBOutlet weak var redLabelInt: UILabel!
    @IBOutlet weak var greenLabelInt: UILabel!
    @IBOutlet weak var blueLabelInt: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorsWindows.layer.cornerRadius = 15
    }
    
    @IBAction func redSliderAction() {
        redLabelInt.text = String(redSlider.value)
        self.colorsWindows.backgroundColor = UIColor(red:CGFloat(redSlider.value)/255,
                                                     green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        self.redSlider.minimumTrackTintColor = .red
    }
    @IBAction func greenSliderAction() {
        greenLabelInt.text = String(greenSlider.value)
        self.colorsWindows.backgroundColor = UIColor(red:CGFloat(redSlider.value)/255,
                                                     green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        self.greenSlider.minimumTrackTintColor = .green
    }
    
    @IBAction func blueSliderAction() {
        blueLabelInt.text = String(blueSlider.value)
        self.colorsWindows.backgroundColor = UIColor(red:CGFloat(redSlider.value)/255,
                                                     green: CGFloat(greenSlider.value)/255, blue: CGFloat(blueSlider.value)/255, alpha: 1)
        self.blueSlider.minimumTrackTintColor = .blue
    }
}

