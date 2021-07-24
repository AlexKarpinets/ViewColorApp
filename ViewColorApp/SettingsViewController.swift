//
//  ViewController.swift
//  ViewColorApp
//
//  Created by Karpinets Alexander on 11.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var colorsWindows: UIView!
    
    @IBOutlet weak var redLabelInt: UILabel!
    @IBOutlet weak var greenLabelInt: UILabel!
    @IBOutlet weak var blueLabelInt: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTF: UITextField!
    @IBOutlet weak var greenTF: UITextField!
    @IBOutlet weak var blueTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsWindows.layer.cornerRadius = 15
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        redLabelInt.text = String(format: "%.2f", redSlider.value)
        greenLabelInt.text = String(format: "%.2f", greenSlider.value)
        blueLabelInt.text = String(format: "%.2f", blueSlider.value)
        
        setColor()
        setValue(for: redLabelInt, greenLabelInt, blueLabelInt)
    }
    
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider: setValue(for: redLabelInt)
        case greenSlider: setValue(for: greenLabelInt)
        default: setValue(for: blueLabelInt)
        }
    }
    
    @IBAction func doneButton(_ sender: Any) {
    }
    
    private func setColor() {
        colorsWindows.backgroundColor = UIColor(
            red:CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
}

extension SettingsViewController {
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabelInt:
                label.text = string(from: redSlider)
            case greenLabelInt:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
}

