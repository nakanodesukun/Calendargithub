//
//  ViewController.swift
//  CalendarApp
//
//  Created by 中野翔太 on 2021/12/06.
//

import UIKit
import FSCalendar
class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

   
    @IBOutlet weak var fsCalendar: FSCalendar!
    
    let date = Date()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let date: Date = Date()
        print(date)
        geWeek()
    }
    

            func geWeek(){
                print("内容を変更しまし")
                //    月曜日からに変更
                        fsCalendar.firstWeekday = 4
                //        曜日を日本語に
                        fsCalendar.calendarWeekdayView.weekdayLabels[0].text = "月"
                        fsCalendar.calendarWeekdayView.weekdayLabels[1].text = "火"
                        fsCalendar.calendarWeekdayView.weekdayLabels[2].text = "水"
                        fsCalendar.calendarWeekdayView.weekdayLabels[3].text = "木"
                        fsCalendar.calendarWeekdayView.weekdayLabels[4].text = "金"
                        fsCalendar.calendarWeekdayView.weekdayLabels[5].text = "土"
                        fsCalendar.calendarWeekdayView.weekdayLabels[6].text = "日"
            }
            func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
                print(date)
                print("今日がタップされたよ")
                performSegue(withIdentifier: "toDatePopupSegue", sender: nil)
            }
   

    
}

