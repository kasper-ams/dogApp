//
//  HomeScreen.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 28/09/2023.
//

import SwiftUI

struct HomeScreen: View {
    
    @State private var sitSheet = false
    @State private var staySheet = false
    @State private var lieDownSheet = false
    @State private var recallSheet = false
    @State private var leaveItSheet = false
    @State private var rollOverSheet = false
    @State private var highFiveSheet = false
    @State private var jumpSheet = false
    @State private var playDeadSheet = false
    @State private var barkSheet = false
    @State private var fetchSheet = false
    @State private var hideSheet = false
    @State private var tugSheet = false
    @State private var catchSheet = false
    @State private var searchSheet = false
    @State private var newPuppySheet = false
    @State private var oldDogSheed = false
    @State private var placeSheet = false
    @State private var handSignalsSheet = false
    @State private var volleySheet = false
    @State private var tunnelSheet = false
    @State private var crawlSheet = false
    
    let colorTop = Color(red: 1, green: 0.66, blue: 0.47)
    let colorBottom = Color(red: 1, green: 0.58, blue: 0.35)
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    @AppStorage("programStatus") var programStatusFirst = ProgramStatusFirst.notStarted.rawValue
    @AppStorage("programStatusLeash") var programStatusLeash = ProgramStatusLeash.notStarted.rawValue
    @AppStorage("programStatusOffice") var programStatusOffice = ProgramStatusOffice.notStarted.rawValue

    var body: some View {
        
        NavigationView() {
            
            VStack(spacing: 0) {
                
                ZStack(alignment: .bottom) {
                    bgColor.ignoresSafeArea()
                    
                    
                    ScrollView(showsIndicators: false) {
                        
                        
                        VStack(alignment: .leading, spacing: 20) {
                            
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Today’s practice")
                                    .font(.custom("SignikaNegative-SemiBold", size: 24))
                                    .padding([.leading, .top], 16)
                                
                                DailyView()
                                  
                
                            }
                            
                            
                            //articles
                            Button(action: {
                                handSignalsSheet.toggle()
                                    }) {
                                        ArticleCard(badge: "PillArt", textBold: "Hand gestures in dog training", textRegular: "See how hand gestures can help with your practice", image: "handGestures")
                                    }
                                    .padding()
                         
                            
                            
                            //name generator
                            HStack {
                                Spacer()
                                    .frame(width: 16)
                                NavigationLink(destination: NameGenerator()) {
                                    SmallCard(text: "Find a name for your pooch!", image: "heartBubble")
                                }
                                Spacer()
                                    .frame(width: 16)
                            }
                            
                            
                        }
                            
                    }
                    
                    
                }
                
                
            }
            
            .sheet(isPresented: $sitSheet) {
                CommandViewSit()
            }
            .sheet(isPresented: $staySheet) {
                CommandViewStay()
            }
            .sheet(isPresented: $leaveItSheet) {
                CommandViewLeaveIt()
            }
            .sheet(isPresented: $newPuppySheet) {
                ArticleViewPuppyBuy()
            }
            .sheet(isPresented: $oldDogSheed) {
                ArticleViewOldTraining()
            }
            .sheet(isPresented: $lieDownSheet) {
                CommandViewLieDown()
            }
            .sheet(isPresented: $recallSheet) {
                CommandViewCome()
            }
            .sheet(isPresented: $rollOverSheet) {
                TrickViewRollOver()
            }
            .sheet(isPresented: $highFiveSheet) {
                TrickViewHighFive()
            }
            .sheet(isPresented: $jumpSheet) {
                TrickViewJumpIntoArms()
            }
            .sheet(isPresented: $playDeadSheet) {
                TrickViewPlayDead()
            }
            .sheet(isPresented: $fetchSheet) {
                PlayViewFetch()
            }
            .sheet(isPresented: $tugSheet) {
                PlayViewTug()
            }
            .sheet(isPresented: $hideSheet) {
                PlayViewHide()
            }
            .sheet(isPresented: $placeSheet) {
                CommandViewPlace()
            }
            .sheet(isPresented: $handSignalsSheet) {
                ArticleViewHands()
            }
            .sheet(isPresented: $volleySheet) {
                PlayViewVolley()
            }
            .sheet(isPresented: $tunnelSheet) {
                PlayViewTunnel()
            }
            .sheet(isPresented: $crawlSheet) {
                TrickViewCrawl()
            }
            
            
        }
      
        
        
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
    
    
}



struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
