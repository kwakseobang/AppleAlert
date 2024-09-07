//
//  AlertView.swift
//  AppleAlert
//
//  Created by 곽서방 on 9/7/24.
//

import SwiftUI

struct AlertView: View {
    @State private var goToSetAlert: Bool = false
    var body: some View {
        NavigationStack{
            VStack{
                
                AlertListView()
                Spacer()
            }
                .navigationTitle("알람")
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        Button{
                            
                        } label: {
                            Text("편집")
                                .font(.system(size: 20))
                        }
                        .foregroundColor(.orange)
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            goToSetAlert.toggle()
                        } label: {
                            Image(systemName: "plus")
                                
                        }
                        .foregroundColor(.orange)
                    }
              
                }
                .sheet(isPresented: $goToSetAlert) {
                    NavigationView{
                        AlertSetView()
                    }
                }
               
        }
        
    }
}

//MARK: - 알람 리스트 뷰
struct AlertListView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Divider()
                .background(Color.white)   // Divider의 색상 변경
                .frame(height: 2)
            AlertCellView()
            
            Divider()
                .background(Color.white)   // Divider의 색상 변경
                .frame(height: 2)
        }
        .padding(.all)
    }
}

//MARK: - 알람 CEll View
struct AlertCellView: View {
    @State var toggleIsOn: Bool = false
    var body: some View {
        VStack(alignment: .leading,spacing: 1){
            HStack{
                Toggle(isOn: $toggleIsOn) {
                    Text("00:00")
                        .font(.system(size: 60, weight: .ultraLight))
                }
            }
            Text("알람") // 사용자가 지정한 이름. 디퐅트가 알람
        }
        .foregroundColor(.gray)
    
    }
}

#Preview {
    AlertView()
}
