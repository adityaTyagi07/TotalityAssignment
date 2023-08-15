//
//  ContentView.swift
//  TotalityProject
//
//  Created by Aditya Tyagi on 09/08/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
    @State var changePosition:Bool = false
    var body: some View {
        VStack {
            ZStack{
                VStack{
                    HStack{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                            .foregroundColor(.yellow)
                            .frame(width: Size.screenWidth*0.25,height:Size.screenHeight*0.08)
                            .offset(x: changePosition ? -10 : 0 , y : changePosition ? -100 :  0)
                        if changePosition{
                            
                            CandyBust().offset(x:-10,y:-100)
                            
                        } else {
                            Spacer()
                        }
                        
                    }.padding()
                    Spacer()
                    if changePosition {
                        //MARK:  Animating Rectangles
                        Component2View(show: $changePosition)
                        
                    }else{
                        RoundedRectangle(cornerSize: CGSize(width: 20, height: 10)).foregroundColor(.green)
                            .frame(width:Size.screenWidth*0.8,height:Size.screenHeight*0.05)
                            .padding()
                    }
                }
            } .frame(width:Size.screenWidth*0.9,height: Size.screenHeight*0.6)
                .background(changePosition ? Color.white : Color.orange)
                .onTapGesture {
                    changePosition.toggle()
                }
            if changePosition{
               
            } else {
                Rectangle()
                    .foregroundColor(.orange)
                    .frame(width:Size.screenWidth*0.9,height:Size.screenHeight*0.12)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 20,
                            bottomLeadingRadius: 0,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 20
                        )
                    )
            }
        }
        .padding()
        .animation(.easeIn)
    }
}



struct CandyBust:View {
    var body: some View {
        HStack{
            Text("CANDY BUST")
                .foregroundColor(.black)
            Spacer()
            Image("darkClose")
        }
    }
}





