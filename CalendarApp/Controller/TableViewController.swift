//
//  TableViewController.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/07.
//

import UIKit
import RealmSwift

class ToDoListItem: Object{
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
    
}

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var table: UITableView!
    
    private let realm = try! Realm()
    private var data = [ToDoListItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        .map({$0})この意味について
        data = realm.objects(ToDoListItem.self).map({$0})
        table.delegate = self
        table.dataSource = self
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].item
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        選択の際にアニメーションで黒くする
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    @IBAction func didTapButton(_ sender: Any) {
        
            performSegue(withIdentifier: "ToSegue", sender: nil)
      
    }
    
    
    
    func refresh() {
        data = realm.objects(ToDoListItem.self).map({$0})
        table.reloadData()
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

        


