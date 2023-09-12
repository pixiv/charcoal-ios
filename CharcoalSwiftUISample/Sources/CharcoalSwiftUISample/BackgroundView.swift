//
//  File.swift
//  
//
//  Created by kevinzhow on 2023/09/12.
//

import SwiftUI

struct BackgroundView: View {
    @State var isOn: Bool = false
    
    var body: some View {
        ZStack {
            Color.clear.background(charcoalColor: .background2, ignoresSafeAreaEdges: isOn ? .all : [])
            ScrollView {
                Toggle(isOn: $isOn) {
                    Text("Ignores SafeArea Edges")
                }
                .padding()
                .charcoalToggle()
            }
        }
        .navigationBarTitle("Background")
    }
}
