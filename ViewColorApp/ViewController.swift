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
        
        redSlider.minimumValue = 1
        redSlider.maximumValue = 100
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.minimumValue = 1
        greenSlider.maximumValue = 100
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.minimumValue = 1
        blueSlider.maximumValue = 100
        blueSlider.minimumTrackTintColor = .blue
    }
    
    @IBAction func redSliderAction() {
        redLabelInt.text = String(format: "%.2f", redSlider.value)
        setColor()
        
    }
    
    @IBAction func greenSliderAction() {
        greenLabelInt.text = String(format: "%.2f", greenSlider.value)
        setColor()
        
    }
    
    @IBAction func blueSliderAction() {
        blueLabelInt.text = String(format: "%.2f", blueSlider.value)
        setColor()
        
    }
    
    private func setColor() {
        self.colorsWindows.backgroundColor = UIColor(
            red:CGFloat(redSlider.value)/255,
            green: CGFloat(greenSlider.value)/255,
            blue: CGFloat(blueSlider.value)/255,
            alpha: 1)
    }
    
}

