//
//  File.swift
//  
//
//  Created by kevinzhow on 2023/09/12.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        ZStack {
            Text("Charcoal")
            Color.clear
        }
        .background(charcoalColor: .brand)
        .navigationBarTitle("Background")
    }
}
