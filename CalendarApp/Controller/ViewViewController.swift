//
//  ViewViewController.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/09.
//
import RealmSwift
import UIKit

class ViewViewController: UIViewController {
    public var item: ToDoListItem?
    var argString = ""
//    消去が完了したら呼び出す
    public var deletionHandler: (() -> Void)?
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private let realm = try! Realm()
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        itemLabel.text = argString
    }
    


}
