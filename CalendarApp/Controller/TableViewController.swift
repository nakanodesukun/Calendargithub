//
//  TableViewController.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/07.
//

import UIKit

class TableViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    }
    
   
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}
