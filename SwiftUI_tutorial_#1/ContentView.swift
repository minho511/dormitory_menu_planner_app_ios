//
//  ContentView.swift
//  SwiftUI_tutorial_#1
//
//  Created by min ho kim on 2021/10/07.
//

import SwiftUI
import SwiftSoup

struct ContentView: View {
    // State 값의 변화를 감지 -> 뷰에 적용
    @State private var menu: Array<String> = crawl()
    @State private var k: Array<String> = crawl()
    // 날짜
    private let dateString :String = "yyyy-MM-dd".stringFromDate()
    private let eeeString : String = "eee요일".stringFromDate()
    
    // 몸체
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                VStack{
                    Text(dateString)
                        .font(.system(size: 25))
                    Text(eeeString)
                        .font(.system(size: 30))
                    Text("오늘 식단")
                }
                ScrollView(content:{
                        VStack{
                            Text("아침")
                                .font(.system(size: 30))
                                .padding(10)
                            Text(menu[0])
                                .multilineTextAlignment(.center)
                                .font(.system(size: 25))
                            Text("")
                            Text("점심")
                                .font(.system(size: 30))
                                .padding(20)
                            Text(menu[1])
                                .multilineTextAlignment(.center)
                                .font(.system(size: 25))
                            Text("")
                            Text("저녁")
                                .font(.system(size: 30))
                                .padding(20)
                            Text(menu[2])
                                .multilineTextAlignment(.center)
                                .font(.system(size: 25))
                            Text("")}
                            .padding(50)
                            .foregroundColor(Color.white)
                            .frame(width:geometry.size.width)
                })//ScrollView
                    .background(Color.blue)
                    
                Link(destination: URL(string: "https://domi.seoultech.ac.kr/support/food/?foodtype=sung")!){
                    Text("사이트로 이동")
                        .fontWeight(.heavy)
                        .font(.system(size: 20))
                        .padding(10)
                        .background(Color.orange)
                        .foregroundColor(Color.white)
                        .cornerRadius(20)}
                
            }//VStack
            .padding(.bottom)
        }//VStack
    }//geometryReader
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
