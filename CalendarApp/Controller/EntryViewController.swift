//
//  EntryViewController.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/09.
//
import RealmSwift
import UIKit

class EntryViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private let  realm = try! Realm()
//    完了ハンドラーについて考える
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        datePicker.preferredDatePickerStyle = .wheels
        textField.delegate = self
//        今日の日付を設定する
        datePicker.setDate(Date(), animated: true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
      return true
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        if let text = textField.text, !text.isEmpty{
            let date = datePicker.date
            realm.beginWrite()
            let NewItem = ToDoListItem()
            NewItem.date = date
            NewItem.item = text
            realm.add(NewItem)
            try! realm.commitWrite()
//            completionHandler?()
        }
        else {
            print("エラー")
        }
        
    }
    
}
