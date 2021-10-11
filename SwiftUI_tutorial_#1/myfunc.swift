//
//  crawling.swift
//  SwiftUI_tutorial_#1
//
//  Created by min ho kim on 2021/10/08.
//

import SwiftUI
import SwiftSoup


//crawling test
func crawl() -> Array<String>{
    let url = URL(string: "https://domi.seoultech.ac.kr/support/food/?foodtype=sung")
    let eee : String = "eee".stringFromDate()
    let weekArray : Array<String> = ["월", "화", "수", "목", "금", "토", "일"]
    guard let myURL = url else {return ["error"]}
    var eeeIndex : Int = 0
    var menu_list: Array<String>
    var count : Int = -1
    var idx: Int = 0
    var Week_menu: [[String]] = Array(repeating: Array(repeating: "", count: 3), count: 7)
    do{
        let html = try String(contentsOf: myURL, encoding: .utf8)
        let doc: Document = try SwiftSoup.parse(html)
        let firstLinkTitles:Elements = try doc.select(".chang td")
        for i in firstLinkTitles {
            let data_s :String = try i.text()
            for j in data_s.split(separator: " "){
                if j == ":"{
                    continue
                }
                else if j == "아침"{
                    count += 1
                    idx = 0
                    print("아침 ",count, idx)
                }else if j == "점심"{
                    idx = 1
                    print("점심 ", count, idx)
                }else if j == "저녁"{
                    idx = 2
                    print("저녁", count, idx)
                }else{
                    let m :String = j+"\n"
                    if m.prefix(3) == "토스트"{
                        Week_menu[count][idx] += "<선택>\n"
                        for k in m.split(separator: ","){
                            Week_menu[count][idx]+=(k+"\n").replacingOccurrences(of: ",", with: "")
                        }
                    }else{
                    Week_menu[count][idx]+=m.replacingOccurrences(of: ",", with: "")
                    }
                }
            }
        }
    } catch Exception.Error(let type, let message) {
        print("Message: \(message)")
    } catch {
        print("error")
    }
    for k in weekArray{
        if k == eee{
            break
        }
        eeeIndex += 1
    }
    print(eeeIndex)
    print(Week_menu[eeeIndex])
    return Week_menu[eeeIndex]
}


extension String {
    func stringFromDate() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self
        dateFormatter.locale = Locale(identifier: "ko_KR")
        return dateFormatter.string(from: now)
    }
}
