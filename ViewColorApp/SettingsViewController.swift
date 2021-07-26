//
//  ViewController.swift
//  ViewColorApp
//
//  Created by Karpinets Alexander on 11.07.2021.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
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
    
    // MARK: - Properties
    var delegate: SettingsViewControllerDelegate!
    var currentColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorsWindows.layer.cornerRadius = 15
       
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        colorsWindows.backgroundColor = currentColor
        setSliders()
        setColor()
        setValue(for: redLabelInt, greenLabelInt, blueLabelInt)
        setValue(for: redTF, greenTF, blueTF)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    //MARK: - IBActions
    @IBAction func rgbSlider(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            setValue(for: redLabelInt)
            setValue(for: redTF)
        case greenSlider:
            setValue(for: greenLabelInt)
            setValue(for: greenTF)
        default:
            setValue(for: blueLabelInt)
            setValue(for: blueTF)
        }
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate.setViewColors(colors: colorsWindows.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    // MARK: - Private func
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
    
    private func setSliders() {
        let ciColor = CIColor(color: currentColor)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
}

// MARK: - Extensions
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
    private func setValue (for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTF:
                textField.text = string(from: redSlider)
            case greenTF:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
}

