//
//  ContentView.swift
//  ripples
//
//  Created by Rajayogan on 07/05/25.
//

import SwiftUI

struct ContentView: View {
    
    //Let's write the onboarding screens together.
    
    @State private var secondView: Bool = false
    @State private var thirdView: Bool = false
    
    @State private var duckTrigger = false
    @State private var umbrellaTrigger = false
    
    
    //For the ripple effect
    @State var origin: CGPoint = .zero
    @State var counter: Int = 0
    
    
    var body: some View {
        if secondView {
            secondScreen
                .modifier(RippleEffect(at: origin, trigger: counter))
        }
        else if thirdView {
            thirdScreen
                .modifier(RippleEffect(at: origin, trigger: counter))
        }
        else {
            firstScreen
                .modifier(RippleEffect(at: origin, trigger: counter))
        }
    }
    
    var firstScreen: some View {
        ZStack {
            Color(.yellowcase).ignoresSafeArea()
            VStack {
                Image("yellowsuitcase")
                    .resizable()
                    .frame(width: 475, height: 300)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Rectangle())
                    .clipped()
                    .offset(x: 50)
                Spacer()
            }
            VStack {
                HStack {
                    Text("D")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .black, fontSize: 50))
                        .rotationEffect(.degrees(90))
                    Spacer()
                    Text("Skip")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 20))
                }
                Spacer()
            }
            .padding(EdgeInsets(top: 10, leading: 60, bottom: 5, trailing: 60))
            VStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("We Will")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .bold, fontSize: 63))
                    Text("take care")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .bold, fontSize: 63))
                }
                .padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 65))
                Spacer()
                    .frame(height: 35)
                VStack(alignment: .leading) {
                    Text("of tickets, transfers and a cool")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 23))
                    Text("place to stay")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 23))
                }
            }
            //That borderlined button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 27)
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.white)
                        UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 0, topTrailingRadius: 25)
                            .frame(width: 43, height: 60)
                            .foregroundStyle(.yellowcase)
                            .offset(x: 19, y: -10)
                        Rectangle()
                            .frame(width: 7, height: 80)
                            .foregroundStyle(.white)
                            .offset(y: -5)
                        Rectangle()
                            .frame(width: 87, height: 8)
                            .foregroundStyle(.white)
                            .offset(y: 17)
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 75, height: 75)
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        Image(systemName: "chevron.forward")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                }
            }
        }.onTapGesture { location in
            origin = location
            counter += 1
            
            withAnimation(.easeIn(duration: 1)) {
                thirdView = false
                secondView = true
            }
        }
        
    }
    
    var secondScreen: some View {
        ZStack {
            Color(.holidayblue).ignoresSafeArea()
            VStack {
                Image("blueumbrell")
                    .resizable()
                    .frame(width: 475, height: 350)
                    .aspectRatio(contentMode: .fit)
                    .offset(x: 45)
                Spacer()
            }.ignoresSafeArea()
            VStack {
                HStack {
                    Text("D")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .black, fontSize: 50))
                        .rotationEffect(.degrees(90))
                    Spacer()
                    Text("Skip")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 20))
                }
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 60, bottom: 5, trailing: 60))
            VStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Relax")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .bold, fontSize: 63))
                    //These two will give the effect of the text flying in
                        .opacity(umbrellaTrigger ? 1.0 : 0.0)
                        .offset(y: umbrellaTrigger ? 0 : -25)
                    Text("& enjoy")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .bold, fontSize: 63))
                    //These two will give the effect of the text flying in
                        .opacity(umbrellaTrigger ? 1.0 : 0.0)
                        .offset(y: umbrellaTrigger ? 0 : -25)
                }.padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 100))
                Spacer()
                    .frame(height: 35)
                VStack(alignment: .leading) {
                    Text("Sunbathe, swim, eat and drink")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 23))
                        .opacity(umbrellaTrigger ? 1.0 : 0.0)
                        .offset(y: umbrellaTrigger ? 0 : 25)
                    Text("deliciously")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 23))
                        .opacity(umbrellaTrigger ? 1.0 : 0.0)
                        .offset(y: umbrellaTrigger ? 0 : 25)
                }
                
            }
            // Slightly modified button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 27)
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.white)
                        UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 25, topTrailingRadius: 25)
                            .frame(width: 43, height: 78)
                            .foregroundStyle(.holidayblue)
                            .offset(x: 18, y: 0)
                        UnevenRoundedRectangle(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 25, topTrailingRadius: 25)
                            .frame(width: 25, height: 78)
                            .foregroundStyle(.holidayblue)
                            .offset(x: 27, y: 0)
                            .rotationEffect(.degrees(90))
                        Rectangle()
                            .frame(width: 7, height: 80)
                            .foregroundStyle(.white)
                            .offset(y: -5)
                        Rectangle()
                            .frame(width: 87, height: 8)
                            .foregroundStyle(.white)
                            .offset(y: 17)
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.white)
                            .shadow(radius: 2)
                        Image(systemName: "chevron.right")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 100))
                }
            }
        }
        .onTapGesture { location in
            origin = location
            counter += 1
            
            withAnimation(.easeIn(duration: 1)) {
                thirdView = true
                secondView = false
            }
        }
        .onAppear {
            //play around with animations as you like.
            withAnimation(.easeIn(duration: 1)) {
                duckTrigger = false
                umbrellaTrigger = true
            }
        }
    }
    
    var thirdScreen: some View {
        ZStack {
            Color(.pinkgoose).ignoresSafeArea()
            VStack {
                Image("paleduck")
                    .resizable()
                    .frame(width: 400, height: 300)
                    .aspectRatio(contentMode: .fit)
                    .offset(y: 75)
                Spacer()
            }
            VStack {
                HStack {
                    Text("D")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .black, fontSize: 50))
                        .rotationEffect(.degrees(90))
                    Spacer()
                    Text("Skip")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 20))
                }
                Spacer()
            }.padding(EdgeInsets(top: 10, leading: 30, bottom: 5, trailing: 30))
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 2) {
                    Text("Flexible")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .bold, fontSize: 63))
                        .opacity(duckTrigger ? 1.0 : 0.0)
                        .offset(y :duckTrigger ? 0 : -25)
                    Text("payment")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .bold, fontSize: 63))
                        .opacity(duckTrigger ? 1.0 : 0.0)
                        .offset(y :duckTrigger ? 0 : -25)
                    
                }.padding(EdgeInsets(top: 100, leading: 0, bottom: 0, trailing: 65))
                Spacer()
                    .frame(height: 35)
                VStack(alignment: .leading) {
                    Text("credit card and transfer,")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 23))
                        .opacity(duckTrigger ? 1.0 : 0.0)
                        .offset(y :duckTrigger ? 0 : 25)
                    Text("cryptocurrency")
                        .font(.cerapro(fontStyle: .largeTitle, fontWeight: .regular, fontSize: 23))
                        .opacity(duckTrigger ? 1.0 : 0.0)
                        .offset(y :duckTrigger ? 0 : 25)
                }
            }.padding(EdgeInsets(top: 100, leading: 10, bottom: 5, trailing: 10))
            
            //Modified button
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 27)
                            .frame(width: 90, height: 90)
                            .foregroundStyle(.white)
                        RoundedRectangle(cornerRadius: 27)
                            .frame(width: 80, height: 80)
                            .foregroundStyle(.pinkgoose)
                        Rectangle()
                            .frame(width: 7, height: 80)
                            .foregroundStyle(.white)
                            .offset(y: -5)
                        Rectangle()
                            .frame(width: 87, height: 8)
                            .foregroundStyle(.white)
                            .offset(y: 17)
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 70, height: 70)
                            .foregroundStyle(.white)
                        Image(systemName: "chevron.right")
                    }.padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 65))
                }
            }
        }
        .onTapGesture { location in
            origin = location
            counter += 1
            
            withAnimation(.easeIn(duration: 1)) {
                thirdView = false
                secondView = false
            }
        }
        .onAppear {
            withAnimation(.easeIn(duration: 1)) {
                duckTrigger = true
                umbrellaTrigger = false
            }
        }
    }
        
}

#Preview {
    ContentView()
}
