//
//  DatePicker.swift
//  Teamply
//
//  Created by Lee Jinkyung on 2023/02/09.
//
import UIKit

class DatePicker: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {

  // Reference from https://stackoverflow.com/questions/40878547/is-it-possible-to-have-uidatepicker-work-with-start-and-end-time
  
  var didSelectDates: ((_ start: Date, _ end: Date) -> Void)?
  
  private lazy var pickerView: UIPickerView = {
    let pickerView = UIPickerView()
    pickerView.delegate = self
    pickerView.dataSource = self
    return pickerView
  }()
  
  private var startDate = [Date]()
  private var endDate = [Date]()
  
  let dateFormatter = DateFormatter()
  
  var inputView: UIView {
    return pickerView
  }
  
  func setup() {
    dateFormatter.dateFormat = "yyyy.MM.dd.E"
    startDate = setstartDate()
    endDate = setendDate()
  }
  
  // MARK: - UIPickerViewDelegate & DateSource
  
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    switch component {
    case 0:
      return startDate.count
    case 1:
      return endDate.count
    default:
      return 0
    }
  }
  
  func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
    var label: UILabel
    
    if let view = view as? UILabel {
      label = view
    } else {
      label = UILabel()
    }
    
    label.textColor = .basic2
      label.textAlignment = .center
      label.font = .sub2
    
    var text = ""
    
    switch component {
    case 0:
      text = getDayString(from: startDate[row])
    case 1:
      text = getDayString(from: endDate[row])
    default:
      break
    }
    
    label.text = text
    
    return label
  }
  
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    let startDateIndex = pickerView.selectedRow(inComponent: 0)
    let endDateIndex = pickerView.selectedRow(inComponent: 1)
      
    guard startDate.indices.contains(startDateIndex),
          endDate.indices.contains(endDateIndex) else { return }
      
    let startdate = startDate[startDateIndex]
    let enddate = endDate[endDateIndex]
    
    didSelectDates?(startdate, enddate)
  }
  
  // MARK: - Private helpers
  
  private func getDays(of date: Date) -> [Date] {
    var dates = [Date]()
    
    let calendar = Calendar.current
    
    // first date
    var currentDate = date
    
    // adding 30 days to current date
    let oneMonthFromNow = calendar.date(byAdding: .day, value: 30, to: currentDate)
    
    // last date
    let endDate = oneMonthFromNow
    
    while currentDate <= endDate! {
      dates.append(currentDate)
      currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
    }
    
    return dates
  }
  
  private func setstartDate() -> [Date] {
    let today = Date()
    return getDays(of: today)
  }
  
  private func setendDate() -> [Date] {
    let today = Date()
    return getDays(of: today)
  }
  
  private func getDayString(from: Date) -> String {
    return dateFormatter.string(from: from)
  }
}

extension Date {

  static func buildTimeRangeString(startDate: Date, endDate: Date) -> String {
    
    let startDateFormatter = DateFormatter()
    startDateFormatter.dateFormat = "yyyy.MM.dd.E"
    let endDateFormatter = DateFormatter()
    endDateFormatter.dateFormat = "yyyy.MM.dd.E"
    
    return String(format: "%@ ~ %@",
                  startDateFormatter.string(from: startDate),
                  endDateFormatter.string(from: endDate))
  }
}
