//
//  Component2View.swift
//  TotalityProject
//
//  Created by Aditya Tyagi on 12/08/23.
//

import Foundation
import SwiftUI


@available(iOS 16.0, *)
struct Component2View:View {
    
    @Binding var show:Bool
    @State var showingRect1:Bool = false
    @State var showingRect2:Bool = false
    @State var buttonTap:Bool = false
    @State var showingLoader:Bool = false
    var body: some View {
        VStack{
            VStack{
                Text("What is lorem ipsum? lorem ipsum is nothing but dummy text and thtas all,lorem ipsum is nothing but dummy text and thtas all")
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .frame(width:Size.screenWidth*0.8)
                    .fixedSize(horizontal: false, vertical: true)
                
                Button {
                    
                } label: {
                    Text("READ MORE")
                        .foregroundColor(.green)
                }
            }
            Spacer()
            if show {
                HStack{
                    RectangleBox(showing: $showingRect1)
                        .transition(.move(edge: .trailing))
                    RectangleBox(showing: $showingRect1)
                        .transition(.move(edge: .trailing))
                }
            }
            if showingLoader{
                // MARK: Button Loading
                LoaderView(showLoader: $showingLoader)
            }else {
                Button(action: {
                    self.showingLoader.toggle()
                }, label: {
                    VStack{
                        Text("Download")
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                        
                    }
                    .frame(width:Size.screenWidth*0.5,height:Size.screenHeight*0.05)
                    .background(Color.green)
                    .cornerRadius(10)
                })
            }
            
            
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                self.showingRect1.toggle()
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7){
                self.showingRect2.toggle()
            }
        }
        
    }
}
