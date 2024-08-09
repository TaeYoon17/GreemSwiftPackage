//
//  File.swift
//  
//
//  Created by Greem on 7/31/24.
//

import Foundation
extension Date{

}

public extension Date {
    /// 날짜의 출력 타입 설정
    /// - simple: M T W T F S S
    /// - short: Mon Tue Wen Thur Fri Sat Sun
    /// - regular: Monday Tuesday Wendsday Thursday Friday Saturday Sunday
    enum DayOfWeekOutputType{
        case simple
        case short
        case regular
        case simpleKor
    }
    /// 기간동안의 날짜를 String으로 출력
    /// - last가 first보다 커야합니다. 아닐경우 nil
    /// - Return Ex) "2012년 5월 28일 ~ 7월 14일"
    static func getDurationDate(first:Date,last:Date) -> String?{
        guard first < last else {return nil }
        let lCalendar = Calendar.current.dateComponents([.year,.month,.day], from: first)
        let rCalendar = Calendar.current.dateComponents([.year,.month,.day], from: last)
        let rYear = lCalendar.year != rCalendar.year ? "\(rCalendar.year ?? 0)년 " : ""
        return "\(lCalendar.year ?? 0)년 \(lCalendar.month ?? 0)월 \(lCalendar.day ?? 0)일 ~ "
        + "\(rYear)\(rCalendar.month ?? 0)월 \(rCalendar.day ?? 0)일"
    }
    /// 해당 날짜의 요일을 출력
    /// - DayOfWeekOutputType올 요일을 출력할 타입을 선택
    func dayOfWeek(type: DayOfWeekOutputType = .simple) -> String{
        guard let weekDay = Calendar.current.dateComponents([.weekday], from: self).weekday else { return ""}
        return type.output(dayOfWeekNumber: weekDay)
    }
    
    func convertTo년월일()->String{
        let calendar = Calendar.current.dateComponents([.year,.month,.day], from: self)
        return "\(calendar.year ?? 0)년 \(calendar.month ?? 0)월 \(calendar.day ?? 0)일"
    }
    
    func getDateByAddingDay(_ num:Int,startDate:Bool = false)->Date{
        let calendarDate = Calendar.current.date(byAdding: .day, value: num, to: self)!
        return startDate ? Calendar.current.startOfDay(for: calendarDate) : calendarDate
    }
    
    /// 해당 날짜가 다른 날짜와 특정 데이트 타입이 같은 지 출력
    /// 불리언 값
    func isSameDate(other:Date,checkType: Set<Calendar.Component>) -> Bool{
        let left = Calendar.current.dateComponents(checkType, from: self)
        let right = Calendar.current.dateComponents(checkType, from: other)
        return Calendar.current.date(other, matchesComponents: left)
    }
    
    /// 날짜를 영문 포맷으로 변환
    func formatDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale(identifier: "en_US")
        return dateFormatter.string(from: self)
    }
}
extension Date.DayOfWeekOutputType{
    func output(dayOfWeekNumber: Int) -> String{
        switch self {
        case .simple:
            let days = ["M","T","W","T","F","S","S"]
            return days[dayOfWeekNumber - 1]
        case .short:
            let days = ["Mon","Tue","Wen","Thur","Fri","Sat","Sun"]
            return days[dayOfWeekNumber - 1]
        case .regular:
            let days = ["Monday","Tuesday","WendsDay","Thursday","Friday","Saturday","Sunday"]
            return days[dayOfWeekNumber - 1]
        case .simpleKor:
            let days = ["월","화","수","목","금","토","일"]
            return days[dayOfWeekNumber - 1]
        }
    }
}
