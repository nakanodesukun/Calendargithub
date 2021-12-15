//
//  PickerCell.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/15.
//

import UIKit

class PickerCell: UITableViewCell {

    @IBOutlet weak var containerViewHeight: NSLayoutConstraint!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var label: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @objc func datePickerValueDidChanged(sender: UIDatePicker) {
        label.text = PickerCell.formatter.string(from: sender.date)
    }

    func showPicker() {
        guard datePicker.isHidden else { return }
//        セルの高さの制約を変更して、Pickerが見えるようにする
        containerViewHeight.constant = PickerCell.expandedHeight
        datePicker.isHidden = false
        UIView.animate(withDuration: 0.25){
            self.datePicker.alpha = 1
            self.layoutIfNeeded()
        }
    }
   
    func hidePicker() {
        guard !datePicker.isHidden else { return }
//        セルの高さの制約を変更してPickerが隠れるようにしたい
        containerViewHeight.constant = PickerCell.expandedHeight
        UIView.animate(withDuration: 0.25, animations: {
            self.datePicker.alpha = 0
            self.layoutIfNeeded()
        }, completion: { _ in
            self.datePicker.isHidden = true
    })
    }
}
private extension PickerCell {
        static let compressedHeight: CGFloat = 44
        static let expandedHeight: CGFloat = 260
        static let formatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.calendar = Calendar(identifier: .gregorian)
            dateFormatter.dateStyle = .long
            return dateFormatter
        }()
    
    func prepare() {
        containerViewHeight.constant = PickerCell.compressedHeight
        let now = Date()
        datePicker.addTarget(self, action: #selector(datePickerValueDidChanged), for: .valueChanged)
        datePicker.isHidden = true
        datePicker.alpha = 0
        label.text = PickerCell.formatter.string(from: now)
    }
    }

