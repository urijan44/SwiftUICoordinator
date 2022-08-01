//
//  Destination.swift
//  SwiftUICoordinator
//
//  Created by leehs81 on 2022/08/01.
//

import SwiftUI

enum Destination {
  case aView
  case bView(Product)
  case cView
  
  @ViewBuilder
  var view: some View {
    switch self {
    case .aView:
      AView()
    case .bView(let product):
      BView(product: product)
    case .cView:
      CView()
    }
  }
}
