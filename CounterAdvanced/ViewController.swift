//
//  ViewController.swift
//  CounterAdvanced
//
//  Created by Михаил Волков on 14.09.2024.
//

import UIKit

class ViewController: UIViewController {
    private var counterValue:Int = 0 //сюда пишем текущее значение счетчика
    private func textsUpdate (text: String) { // функция, которая обновляет все тексты
        
        let getDate = Date()
        lazy var dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM, HH:mm"
            return dateFormatter
        }()
        
        
        let dateTime = dateFormatter.string(from: getDate) // получаем дату и время
        
        counterValueLabel.text = "Значение счётчика: "+String(counterValue) //обновляем лейбл со значением счётчика
        historyTextView.text.append("\n"+dateTime+": "+text) // обновляем лог
        
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range) //прокручиваем лог в конец
    }
    
    @IBOutlet weak private var counterValueLabel: UILabel!
    @IBOutlet weak private var historyTextView: UITextView!
    @IBAction func touchUpButton(_ sender: Any) {  //обработка нажатия кнопки плюс
        counterValue+=1
        textsUpdate(text: "Значение счетчика изменено на +1")
    }
    
    @IBAction private func touchDownButton(_ sender: UIButton) { //обработка нажатия кнопки минус
        if counterValue>0 {
            counterValue-=1
            textsUpdate(text: "значение изменено на -1")
        } else
        {
            textsUpdate(text: "попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    
    @IBAction private func touchResetButton(_ sender: Any) { //обработка нажатия кнопки сброса
        counterValue = 0
        textsUpdate(text: "значение сброшено")
        
    }
    
    override internal func viewDidLoad() {
        super.viewDidLoad()
        counterValueLabel.text = "Значение счётчика: "+String(counterValue)
        historyTextView.text = "История изменений: "
        
    }
    
    
}

