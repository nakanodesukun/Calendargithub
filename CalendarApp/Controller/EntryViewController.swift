//
//  EntryViewController.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/09.
//
//import RealmSwift
//import UIKit
//import SwiftUI
//
//class EntryViewController: UIViewController{
//
//    @IBOutlet weak var textField: UITextField!
//    @IBOutlet weak var startTextField: UITextField!
//    @IBOutlet weak var endTextField: UITextField!
//    let timePicker: UIDatePicker = UIDatePicker()
//    private let  realm = try! Realm()
//
////    完了ハンドラーについて考える
//    public var completionHandler: (() -> Void)?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        cahngePicker()
//       textFieldDelegate()
//
//
//    }
//
////   UIDatePickerの設定
//    let picker: UIDatePicker = {
//        let dp = UIDatePicker()
//        dp.datePickerMode = UIDatePicker.Mode.time
//        dp.timeZone = NSTimeZone.local
////        日付をJapanに変更(24時間表記)
//        dp.locale = Locale.init(identifier: "Japanese")
//        dp.addTarget(self, action: #selector(dateChange), for: .valueChanged)
////        最小単位を設定
//        dp.minuteInterval = 10
//        return dp
//    }()
//    @objc func dateChange(){
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm"
//        startTextField.text = formatter.string(from: picker.date)
//    }
////    delegateメソッド
//    func textFieldDelegate(){
//        textField.delegate = self
//        startTextField.delegate = self
//        endTextField.delegate = self
//    }
//    //UIdatePickerの表示を変更する
//        func cahngePicker() {
//            //        押されたタイミングでdatepickerを表示
//                    startTextField.inputView = picker
//                    endTextField.inputView = picker
//        }
//
//
//}
//extension EntryViewController: UITextFieldDelegate{
//
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//            let nextTag = textField.tag + 1
//            if let nextTextField = self .view.viewWithTag(nextTag) {
//                nextTextField.becomeFirstResponder()
//            }
//          return true
//        }
//
//
//
//        @IBAction func didTapSaveButton(_ sender: Any) {
//            if let text = textField.text, !text.isEmpty{
//    //            let date = datePicker.date
//                realm.beginWrite()
//                let NewItem = ToDoListItem()
//    //            NewItem.date = date
//                NewItem.item = text
//                realm.add(NewItem)
//                try! realm.commitWrite()
//    //            completionHandler?()
//                dismiss(animated: true, completion: nil)
//            }
//            else {
//                print("エラー")
//            }
//
//        }
//
//
//
//}
