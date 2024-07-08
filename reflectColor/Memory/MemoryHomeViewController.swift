//
//  MemoryHomeViewController.swift
//  reflectColor
//
//  Created by 森杏菜 on 2024/06/23.
//

import UIKit
import FSCalendar

class MemoryHomeViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.dataSource = self
        calendar.delegate = self
        
        // カスタムセルの登録
        calendar.register(HandDrawnCircleCell.self, forCellReuseIdentifier: "handDrawnCircleCell")
        
        calendar.appearance.headerDateFormat = "MMMM yyyy"
        calendar.appearance.weekdayTextColor = .red
        calendar.appearance.headerTitleColor = .blue
        calendar.appearance.eventDefaultColor = .green
        calendar.appearance.selectionColor = .clear
        calendar.appearance.todayColor = UIColor(red: 25 / 255.0, green: 44 / 255.0, blue: 112 / 255.0, alpha: 0.9)

        calendar.appearance.borderRadius = 1
        calendar.firstWeekday = 2
        calendar.locale = Locale(identifier: "ja")
    }
    
    // MARK:- FSCalendarDataSource
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        return 0
    }
    
    // MARK:- FSCalendarDelegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("選択された日付: \(date)")
        calendar.reloadData() // カレンダーを再読み込みして選択された日付を更新
    }
    
    // MARK:- FSCalendarDelegateAppearance
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, fillSelectionColorFor date: Date) -> UIColor? {
        return nil // デフォルトの塗りつぶし色をなしに設定
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderDefaultColorFor date: Date) -> UIColor? {
        return .clear // デフォルトのボーダー色をクリアに設定
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, borderSelectionColorFor date: Date) -> UIColor? {
        return .clear // 選択時のボーダー色をクリアに設定
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleSelectionColorFor date: Date) -> UIColor? {
        
        return .black //選択時の文字色を黒に設定
    }
    
    func calendar(_ calendar: FSCalendar, cellFor date: Date, at monthPosition: FSCalendarMonthPosition) -> FSCalendarCell {
        let cell = calendar.dequeueReusableCell(withIdentifier: "handDrawnCircleCell", for: date, at: monthPosition) as! HandDrawnCircleCell
        cell.contentView.viewWithTag(999)?.isHidden = !calendar.selectedDates.contains(date)
        return cell
    }
}


