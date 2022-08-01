//
//  AView.swift
//  SwiftUICoordinator
//
//  Created by leehs81 on 2022/08/01.
//

import SwiftUI

struct AView: View {
  @StateObject var coordinator = Coordinator(isRoot: true)
  var body: some View {
    LazyVStack {
      coordinator.navigationLinkSection()
      Text("AView")
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          coordinator.push(destination: .aView)
        } label: {
          Image(systemName: "a.square.fill")
        }
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          coordinator.push(destination: .bView(.init(name: "")))
        } label: {
          Image(systemName: "b.square.fill")
        }
      }
      ToolbarItem(placement: .navigationBarTrailing) {
        Button {
          coordinator.push(destination: .cView)
        } label: {
          Image(systemName: "c.square.fill")
        }
      }
    }
  }
}
