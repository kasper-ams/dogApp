//
//  HomeScreen.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 28/09/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct HomeScreen: View {
    
    @StateObject private var itemViewModel = ItemViewModel()
      

    @State private var handSignalsSheet = false

    
    let colorTop = Color(red: 1, green: 0.66, blue: 0.47)
    let colorBottom = Color(red: 1, green: 0.58, blue: 0.35)
    var bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    
    
    @State private var programStatusFirst = ProgramStatusFirst.notStarted.rawValue
    @State private var programStatusLeash = ProgramStatusLeash.notStarted.rawValue
    @State private var programStatusOffice = ProgramStatusOffice.notStarted.rawValue

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
        }
        .sheet(isPresented: $handSignalsSheet) {
                ArticleViewHands()
               }
        .onAppear {
            Task {
                do {
                    let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                    
                    // Fetch user programs
                    let userPrograms = try await UserManager.shared.getUserPrograms(userId: authDataResult.uid)
                    
                    if let firstProgram = userPrograms.first(where: { $0.programId == 1 }) {
                                   programStatusFirst = firstProgram.status
                               }
                    if let leashProgram = userPrograms.first(where: { $0.programId == 2 }) {
                                   programStatusLeash = leashProgram.status
                               }
                    if let officeProgram = userPrograms.first(where: { $0.programId == 3 }) {
                                   programStatusOffice = officeProgram.status
                               }
                    
                    print("User has programs: \(userPrograms)")
                    
                } catch {
                    print("Error fetching user programs:", error.localizedDescription)
                }
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


