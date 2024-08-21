
//
// CharcoalBorderRadius.swift
//

// Do not edit directly, this file was auto-generated.


import UIKit

extension CharcoalFoundation {
  public enum BorderRadius: CaseIterable {
    case l
    case m
    case none
    case oval
    case s
    case xl
    case xs
    case xxl

    public var value : Int  {
        switch self {
            case .l: return 12;
            case .m: return 8;
            case .none: return 0;
            case .oval: return 999999;
            case .s: return 4;
            case .xl: return 16;
            case .xs: return 2;
            case .xxl: return 24;
        }
    }
  }  
}
