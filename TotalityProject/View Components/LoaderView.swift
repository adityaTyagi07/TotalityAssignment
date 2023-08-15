//
//  LoadferView.swift
//  TotalityProject
//
//  Created by Aditya Tyagi on 12/08/23.
//

import Foundation
import SwiftUI



@available(iOS 16.0, *)
struct LoaderView : View {
    @State var percent : CGFloat = 0
    @State private var downloadTiem  = 0.0
    
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    @Binding var showLoader:Bool
    @State var showingBtn:Bool = false
    @State var showingBsheet:Bool = false
    var body: some View {
        if showLoader{
            HStack{
                if showingBtn{
                    //   MARK: Play Button after loading is completed
                    PlayButton(showBtn: $showingBtn).transition(.move(edge: .bottom))
                        .onTapGesture {
                            // Boolean to show BottomSheet
                            self.showingBsheet.toggle()
                        }
                } else {
                    ZStack{
                        VStack{
                            
                        }
                        .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.04)
                        .background(Color.green.opacity(0.5))
                        ProgressView(value: downloadTiem, total: 100)
                            .accentColor(.green)
                            .scaleEffect(x: 1, y: 10, anchor: .center)
                        Text("Download")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                    }
                    if downloadTiem == 100 {
                        Image("ok")
                    } else {
                        Image("darkClose")
                    }
                }
            }.onReceive(timer) { _ in
                if downloadTiem < 100{
                    downloadTiem += 1
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 11){
                    self.showingBtn.toggle()
                }
            }
            .sheet(isPresented: $showingBsheet) {
                BottomSheet(showSheet: $showingBsheet)
                    .presentationDetents([.fraction(0.40)])
            }
        }
    }
}



struct PlayButton:View {
    
    @Binding var showBtn:Bool
    var body: some View {
        if showBtn{
            
            Text("Play").foregroundColor(.white)
                .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.05)
                .background(Color.blue)
                .cornerRadius(10)
            
        }
    }
}
