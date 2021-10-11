//
//  MyTextView.swift
//  SwiftUI_tutorial_#1
//
//  Created by min ho kim on 2021/10/07.
//

import SwiftUI

struct MyTextView: View {
    @State
    private var index: Int = 0
    
    // 배경석 배열 준비
    private let backgroundColors = [
        Color.red, Color.yellow, Color.blue, Color.green,
        Color.orange
    ]
    
    var body: some View{
        VStack{
            
            Spacer()
            Text("배경 아이템 인덱스 \(self.index + 1)")
                .font(.system(size:30))
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            Spacer()
            
        }
            .background(backgroundColors[index])
            .edgesIgnoringSafeArea(.all)
            .onTapGesture {
                withAnimation{
                    if(self.index == self.backgroundColors.count-1){
                        self.index = 0
                    }else{
                    self.index += 1
                    }
                }
            }
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
