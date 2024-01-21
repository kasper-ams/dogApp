//
//  DailyView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/12/2023.
//

import SwiftUI
import Firebase
import FirebaseAuth

struct DailyView: View {
    
    @StateObject private var viewModel = ProgramViewModel()
    @ObservedObject var profileViewModel = ProfileViewModel()
    @EnvironmentObject private var authStateManager: AuthStateManager


    
    @AppStorage("lastSelectedDate") var lastSelectedDate: String = ""
    
    @State private var programStatusFirst: String = "notStarted"
    @State private var programStatusLeash: String = "notStarted"
    @State private var programStatusOffice: String = "notStarted"
    
    @State private var refreshDailyView = false

    
    let colorTop = Color(red: 1, green: 0.66, blue: 0.47)
    let colorBottom = Color(red: 1, green: 0.58, blue: 0.35)
    
    @State var selectedRandomItems: [ItemStructure] = []
    @State private var selectedItem: ItemStructure? = nil
    let itemDatabase = ItemDatabase()
    
    func selectRandomItems() {
        let randomCommands = ItemDatabase.commands.shuffled().prefix(1)
        let randomTricks = ItemDatabase.tricks.shuffled().prefix(1)
        let randomGames = ItemDatabase.games.shuffled().prefix(1)
        
        let combinedRandomItems = randomCommands + randomTricks + randomGames
        selectedRandomItems = Array(combinedRandomItems)
        
        lastSelectedDate = getCurrentDate()
        print("Selected Random Items: \(selectedRandomItems.map { $0.title })")
    }
    
    
    
    func shouldRunSelectRandomItems() -> Bool {
        let currentDate = getCurrentDate()
        let lastSelectedDate = self.lastSelectedDate
        
        print("Current Date: \(currentDate)")
        print("Last Selected Date: \(lastSelectedDate)")
        
        let shouldRun = currentDate != lastSelectedDate || selectedRandomItems.isEmpty
        print("Should Run Select Random Items: \(shouldRun)")
        
        return shouldRun
    }
    
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: Date())
        
        print("Current Date (Formatted): \(currentDate)")
        
        return currentDate
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 0xF3 / 255.0, green: 0xF1 / 255.0, blue: 0xEE / 255.0))
            
            
            // programs in progress -- dont show when not logged in
            
            VStack(alignment: .leading, spacing: 24) {
                if let user = Auth.auth().currentUser {
                    Group {
                        let isInProgress =
                        programStatusFirst == "inProgress" || programStatusLeash == "inProgress" || programStatusOffice == "inProgress"
                        
                        if isInProgress {
                            VStack(alignment: .leading, spacing: 32) {
                                Text("Active programs")
                                    .foregroundColor(.black)
                                    .font(.custom("SignikaNegative-SemiBold", size: 18))
                                
                                
                                
                                
                                if programStatusFirst == "inProgress" {
                                    NavigationLink(destination: ProgramViewFirst(program: ProgramStructure(id: 1, title: "String?", status: "String?", image: "puppy"))) {
                                        ZStack(alignment: .topLeading) {
                                            ProgramCardSmall(text: "My first puppy", image: "puppy", colorTop: colorTop, colorBottom: colorBottom)
                                            Text("In progress")
                                                .foregroundColor(.white)
                                                .font(.custom("SignikaNegative-Regular", size: 16))
                                                .padding(.leading, 24)
                                                .padding(.top, 16)
                                        }
                                    }
                                }
                                
                                if programStatusLeash == "inProgress" {
                                    NavigationLink(destination: ProgramViewLeash(program: ProgramStructure(id: 2, title: "String?", status: "String?", image: "puppy"))) {
                                        ZStack(alignment: .topLeading) {
                                            ProgramCardSmall(text: "Leash Training", image: "leashWalking", colorTop: Color(red: 0.61, green: 0.79, blue: 0.86), colorBottom: Color(red: 0.53, green: 0.75, blue: 0.83))
                                            Text("In progress")
                                                .foregroundColor(.white)
                                                .font(.custom("SignikaNegative-Regular", size: 16))
                                                .padding(.leading, 24)
                                                .padding(.top, 16)
                                        }
                                    }
                                }
                                
                                if programStatusOffice == "inProgress" {
                                    NavigationLink(destination: ProgramViewOffice(program: ProgramStructure(id: 3, title: "String?", status: "String?", image: "puppy"))) {
                                        ZStack(alignment: .topLeading) {
                                            ProgramCardSmall(text: "Office training", image: "office", colorTop: Color(red: 0.54, green: 0.55, blue: 0.86), colorBottom: Color(red: 0.45, green: 0.47, blue: 0.83))
                                            Text("In progress")
                                                .foregroundColor(.white)
                                                .font(.custom("SignikaNegative-Regular", size: 16))
                                                .padding(.leading, 24)
                                                .padding(.top, 16)
                                        }
                                    }
                                    Spacer()
                                        .frame(height: 4)
                                }
                            }
                        }
                    } }
                    
                    // daily challenges
                    VStack(alignment: .leading, spacing: 24) {
                        Text("Daily challenges")
                            .foregroundColor(.black)
                            .font(.custom("SignikaNegative-SemiBold", size: 18))
                        
                        VStack(spacing: 12) {
                            ForEach(selectedRandomItems, id: \.id) { item in
                                Button(action: {
                                    selectedItem = item
                                }) {
                                    DailyChallengeCard(text: item.title ?? "", image: item.image ?? "")
                                }
                                .sheet(item: $selectedItem) { item in
                                    item.presentSheet()
                                }
                            }
                        }
                    }
                
                
            }
            
            .padding()
            
        }
        .onAppear() {
            if shouldRunSelectRandomItems() {
                selectRandomItems()
            }
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
        .onAppear {
            Task {
                refreshDailyView.toggle()
            }
        }

        
        .padding([.leading, .trailing], 16)
        .fixedSize(horizontal: false, vertical: true)
    }
}

#Preview {
    DailyView()
}



//        .onChange(of: authStateManager.isSignedIn) { _ in
//            refreshDailyView.toggle()
//                }
//                .task {
//                    try? await profileViewModel.loadCurrentUser()
//                }
