//
//  Coordinator.swift
//  SwiftUICoordinator
//
//  Created by leehs81 on 2022/08/01.
//

import SwiftUI
import Combine

fileprivate extension Notification.Name {
  static let popToRoot = Notification.Name("PopToRoot")
}

final class Coordinator: ObservableObject {
  private var destination: Destination = .aView
  private let isRoot: Bool
  private var cancellable: Set<AnyCancellable> = []
  @Published private var navigationTrigger = false
  @Published private var rootNavigationTrigger = false
  
  init(isRoot: Bool = false) {
    self.isRoot = isRoot
    
    if isRoot {
      NotificationCenter.default.publisher(for: .popToRoot)
        .sink { [unowned self] _ in
          rootNavigationTrigger = false
        }
        .store(in: &cancellable)
    }
  }
  
  @ViewBuilder
  func navigationLinkSection() -> some View {
    NavigationLink(isActive: Binding<Bool>(get: getTrigger, set: setTrigger(newValue:))) {
      destination.view
    } label: {
      EmptyView()
    }
  }
  
  func popToRoot() {
    NotificationCenter.default.post(name: .popToRoot, object: nil)
  }
  
  func push(destination: Destination) {
    self.destination = destination
    if isRoot {
      rootNavigationTrigger.toggle()
    } else {
      navigationTrigger.toggle()
    }
  }
  
  private func getTrigger() -> Bool {
    isRoot ? rootNavigationTrigger : navigationTrigger
  }
  
  private func setTrigger(newValue: Bool) {
    if isRoot {
      rootNavigationTrigger = newValue
    } else {
      navigationTrigger = newValue
    }
  }
}
