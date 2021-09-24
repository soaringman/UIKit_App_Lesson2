//
//  ViewController.swift
//  UIKit_App_Lesson2
//
//  Created by Алексей Гуляев on 16.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var slider: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
//        Label
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
//        Segmented Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
    
//    Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .red
        slider.maximumTrackTintColor = .gray
        slider.thumbTintColor = .purple
        
        mainLabel.text = String(slider.value)

//        Локализуем DatePicker
        datePicker.locale = Locale(identifier: "ru_RU")

    }
    

    @IBAction func segmentedControlAction() {
       
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .green
        case 2:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .blue
        default:
            break
        }
    }
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }
    @IBAction func doneButtonPressed() {
//        Делаем проверку на то что в переменной вообще что то есть
//        вторым шагом делаем проверку что в переменной не пустое значение
        guard let inputText = textField.text, !inputText.isEmpty else {
       showAlert(with: "Text field is empty", and: "Please enter you name ")
        return
        }
//        Делаем проверку что в переменной не число
        if let _ = Double(inputText) {
            showAlert(with: "Wrong format", and: "Please enter correct format")
            return
        }
        mainLabel.text = inputText
    }
    
    @IBAction func datePickerAction() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        //Отображение даты в соотвествии с языком - русский и страной - россия
        dateFormatter.locale = Locale(identifier: "ru_RU")
        
//        теперь передадим нашу дату из outlet "datePicker" в наш mainLabel
        mainLabel.text = dateFormatter.string(from: datePicker.date)
    }
}

//MARK: - Alert Controller
extension ViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

