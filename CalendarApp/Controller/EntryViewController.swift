//
//  EntryViewController.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/09.
//
import RealmSwift
import UIKit
import CloudKit

class EntryViewController: UIViewController, UITextFieldDelegate {
 
   
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var endTextField: UITextField!
    
    private let  realm = try! Realm()
//    完了ハンドラーについて考える
    public var completionHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.becomeFirstResponder()
        timePicker.preferredDatePickerStyle = .wheels
        textField.delegate = self
        startTextField.delegate = self
        startTextField.inputView = timePicker
        endTextField.inputView = timePicker
        
        
        startTextField.keyboardType = UIKeyboardType.numberPad
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
      return true
    }
    
    @IBAction func didTapSaveButton(_ sender: Any) {
        if let text = textField.text, !text.isEmpty{
//            let date = datePicker.date
            realm.beginWrite()
            let NewItem = ToDoListItem()
//            NewItem.date = date
            NewItem.item = text
            realm.add(NewItem)
            try! realm.commitWrite()
//            completionHandler?()
            dismiss(animated: true, completion: nil)
        }
        else {
            print("エラー")
        }
        
    }
    
}
