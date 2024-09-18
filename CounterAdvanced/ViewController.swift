//
//  ViewController.swift
//  CounterAdvanced
//
//  Created by Михаил Волков on 14.09.2024.
//

import UIKit

class ViewController: UIViewController {
    var counterValue:Int = 0 //сюда пишем текущее значение счетчика
    
    func textsUpdate (text: String) { // функция, которая обновляет все тексты
        
        let getDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM, HH:mm"
        let dateTime = dateFormatter.string(from: getDate) // получаем дату и время
        
        counterValueLabel.text = "Значение счётчика: "+String(counterValue) //обновляем лейбл со значение счётчика
        historyTextView.text.append("\n"+dateTime+": "+text) // обновляем лог
        
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range) //прокручиваем лог в конец
    }
   
    @IBOutlet weak var counterValueLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterUpButton: UIButton!
    @IBOutlet weak var counterDownButton: UIButton!
    @IBOutlet weak var counterResetButton: UIButton!
    @IBAction func touchUpButton(_ sender: Any) {  //обработка нажатия кнопки плюс
        counterValue+=1
        textsUpdate(text: "Значение счетчика изменено на +1")
    }
    
    
    @IBAction func touchDownButton(_ sender: UIButton) { //обработка нажатия кнопки минус
        if counterValue>0 {
            counterValue-=1
            textsUpdate(text: "значение изменено на -1")
        } else
        {
            textsUpdate(text: "попытка уменьшить значение счётчика ниже 0")
        }
        
    }
    
    
    @IBAction func touchResetButton(_ sender: Any) { //обработка нажатия кнопки сброса
    counterValue = 0
    textsUpdate(text: "значение сброшено")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        counterValueLabel.text = "Значение счётчика: "+String(counterValue)
        historyTextView.text = "История изменений: "
        // Do any additional setup after loading the view.
    }


}

