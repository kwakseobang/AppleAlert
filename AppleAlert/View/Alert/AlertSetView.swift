//
//  AlertSetView.swift
//  AppleAlert
//
//  Created by 곽서방 on 9/7/24.
//

import SwiftUI

struct AlertSetView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var alertViewModel: AlertViewModel = AlertViewModel()
    var body: some View {
        VStack{
            TimePickerView(alertViewModel:alertViewModel)
            Spacer()
        }
        .navigationBarTitle("알람 편집",displayMode: .inline)
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button{
                    dismiss()
                } label: {
                    Text("취소")
                        .font(.system(size: 20))
                }
                .foregroundColor(.orange)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button{
                    //TODO: - 알람 배열에 추가.
                } label: {
                    Text("저장")
                        .font(.system(size: 20))
                    
                }
                .foregroundColor(.orange)
            }
            
        }
    }
}
//MARK: - TimePickerView
struct TimePickerView: View {
    @ObservedObject var alertViewModel:AlertViewModel
    fileprivate init(alertViewModel: AlertViewModel) {
        self.alertViewModel = alertViewModel
    }
    var body: some View {
        HStack {
            Picker("hours",selection:$alertViewModel.alert.hours) {
                ForEach(0..<24) { h in
                    Text(String(format: "%02d", h))
                }
            }
            Picker("minutes",selection:$alertViewModel.alert.minutes) {
                ForEach(0..<59) { m in
                    Text(String(format: "%02d", m))
                }
            }
        }
        .labelsHidden()
        .pickerStyle(.wheel)
    }
}

#Preview {
    AlertSetView()
}
