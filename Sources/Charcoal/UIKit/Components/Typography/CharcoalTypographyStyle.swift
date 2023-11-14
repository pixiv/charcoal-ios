//
//  File.swift
//  
//
//  Created by kevinzhow on 2023/11/14.
//

import UIKit

protocol CharcoalTypographyStyle: UILabel {
    var isBold: Bool {get set}
    
    var isMono: Bool  {get set}
    
    var fontSize: CGFloat {get}
    
    var lineHeight: CGFloat  {get}
    
    func configStyle()
    
    func setupStyle()
}

extension CharcoalTypographyStyle {
    func configStyle() {
    }
}
