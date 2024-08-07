
//
// CharcoalBorderRadius.swift
//

// Do not edit directly, this file was auto-generated.


import UIKit

public enum CharcoalBorderRadius: CaseIterable {
  case borderRadius16
    case borderRadius24
    case borderRadius4
    case borderRadius8
    case borderRadiusNone
    case borderRadiusOval

    public var value : Int  {
        switch self {
            case .borderRadius16: return 16;
            case .borderRadius24: return 24;
            case .borderRadius4: return 4;
            case .borderRadius8: return 8;
            case .borderRadiusNone: return 0;
            case .borderRadiusOval: return 999999;
        }
    }
}  
