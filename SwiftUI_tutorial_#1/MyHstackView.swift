//
//  MyHstackView.swift
//  SwiftUI_tutorial_#1
//
//  Created by min ho kim on 2021/10/07.
//

import SwiftUI

struct MyHstackView: View {
    
    var body: some View {
        HStack{
            Text("1")
                .fontWeight(.bold)
                .font(.system(size: 60))
            Text("2")
                .fontWeight(.bold)
                .font(.system(size: 60))
        } // Hstack1
        .background(Color.yellow)
    }
}
