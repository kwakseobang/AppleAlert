//
//  AlertViewModel.swift
//  AppleAlert
//
//  Created by 곽서방 on 9/7/24.
//

import Foundation

class AlertViewModel: ObservableObject {
    @Published var alert: Alert = .init(hours: 00, minutes: 00)
}
