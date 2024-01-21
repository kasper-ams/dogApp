//
//  ListViewAll2.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 25/09/2023.
//

import SwiftUI
import Firebase

struct ListViewAll: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    let colorTop = Color(red: 1, green: 0.66, blue: 0.47)
    let colorBottom = Color(red: 1, green: 0.58, blue: 0.35)
    @State private var selectedItem: ItemStructure? = nil
    @StateObject private var viewModel = ItemListViewModel()
    @State private var showSignInSheet = false

        
    @State private var programStatusFirst: String = "notStarted"
    @State private var programStatusLeash: String = "notStarted"
    @State private var programStatusOffice: String = "notStarted"
    
    @State private var refreshListView = false



    var body: some View {
        
        NavigationView {
            
            ZStack(alignment: .topLeading) {
                bgColor.ignoresSafeArea()
                
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading) {
                        
                        // programs
                        
                        VStack(alignment: .leading, spacing: 24) {
                            
                            Text("Training programs")
                                .font(.custom("SignikaNegative-SemiBold", size: 24))
                                .padding(.top, 24)
                                .padding(.leading, 16)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    Spacer()
                                        .frame(width: 16)
                                    
                                    if let user = Auth.auth().currentUser {
                                        NavigationLink(destination: ProgramViewFirst(program: ProgramStructure(id: 1, title: "String?", status: "String?", image: "puppy"))) {
                                            ZStack(alignment: .topLeading) {
                                                ProgramCard(text: "My first puppy", image: "puppy", colorTop: colorTop, colorBottom: colorBottom)
                                                if programStatusFirst == "inProgress" {
                                                    Text("In progress")
                                                        .foregroundColor(.white)
                                                        .font(.custom("SignikaNegative-Regular", size: 16))
                                                        .padding(24)
                                                } else if programStatusFirst == "completed" {
                                                    Text("Completed")
                                                        .foregroundColor(.white)
                                                        .font(.custom("SignikaNegative-Regular", size: 16))
                                                        .padding(24)
                                                }
                                            }
                                        }
                                    } else {
                                        Button(action: {
                                               showSignInSheet = true
                                           }) {
                                               ZStack(alignment: .topLeading) {
                                                   ProgramCard(text: "My first puppy", image: "puppy", colorTop: colorTop, colorBottom: colorBottom)
                                               }
                                           }
                                           .sheet(isPresented: $showSignInSheet) {
                                                           SignInSheet { signedIn in
                                                               if signedIn {
                                                                   refreshListView.toggle()
                                                                   showSignInSheet = false
                                                               }
                                                           }
                                                       }
                                        
                                    }
                                                       
                                    
                                    Spacer()
                                        .frame(width: 12)
                                    if let user = Auth.auth().currentUser {
                                        NavigationLink(destination: ProgramViewLeash(program: ProgramStructure(id: 2, title: "String?", status: "String?", image: "puppy"))) {
                                            ZStack(alignment: .topLeading) {
                                                ProgramCard(text: "Leash walking", image: "leashWalking", colorTop: Color(red: 0.61, green: 0.79, blue: 0.86), colorBottom: Color(red: 0.53, green: 0.75, blue: 0.83))
                                                
                                                if programStatusLeash == "inProgress" {
                                                    Text("In progress")
                                                        .foregroundColor(.white)
                                                        .font(.custom("SignikaNegative-Regular", size: 16))
                                                        .padding(24)
                                                } else if programStatusLeash == "completed" {
                                                    Text("Completed")
                                                        .foregroundColor(.white)
                                                        .font(.custom("SignikaNegative-Regular", size: 16))
                                                        .padding(24)
                                                }
                                                
                                            }
                                        }
                                    } else {
                                        Button(action: {
                                               showSignInSheet = true
                                           }) {
                                               ZStack(alignment: .topLeading) {
                                                   ProgramCard(text: "Leash walking", image: "leashWalking", colorTop: Color(red: 0.61, green: 0.79, blue: 0.86), colorBottom: Color(red: 0.53, green: 0.75, blue: 0.83))
                                               }
                                           }
                                           .sheet(isPresented: $showSignInSheet) {
                                                           SignInSheet { signedIn in
                                                               if signedIn {
                                                                   refreshListView.toggle()
                                                                   showSignInSheet = false
                                                               }
                                                           }
                                                       }
                                    }
                                    
                                    Spacer()
                                        .frame(width: 12)
                                    
                                    if let user = Auth.auth().currentUser {
                                        NavigationLink(destination: ProgramViewOffice(program: ProgramStructure(id: 3, title: "String?", status: "String?", image: "puppy"))) {
                                            ZStack(alignment: .topLeading) {
                                                ProgramCard(text: "Ready for office", image: "office", colorTop: Color(red: 0.54, green: 0.55, blue: 0.86), colorBottom: Color(red: 0.45, green: 0.47, blue: 0.83))
                                                
                                                if programStatusOffice == "inProgress" {
                                                    Text("In progress")
                                                        .foregroundColor(.white)
                                                        .font(.custom("SignikaNegative-Regular", size: 16))
                                                        .padding(24)
                                                } else if programStatusOffice == "completed" {
                                                    Text("Completed")
                                                        .foregroundColor(.white)
                                                        .font(.custom("SignikaNegative-Regular", size: 16))
                                                        .padding(24)
                                                }
                                                
                                            }
                                        }
                                    } else {
                                        Button(action: {
                                               showSignInSheet = true
                                           }) {
                                               ZStack(alignment: .topLeading) {
                                                   ProgramCard(text: "Ready for office", image: "office", colorTop: Color(red: 0.54, green: 0.55, blue: 0.86), colorBottom: Color(red: 0.45, green: 0.47, blue: 0.83))
                                               }
                                           }
                                           .sheet(isPresented: $showSignInSheet) {
                                                           SignInSheet { signedIn in
                                                               if signedIn {
                                                                   refreshListView.toggle()
                                                                   showSignInSheet = false
                                                               }
                                                           }
                                                       }
                                    }
                                    
                                    Spacer()
                                        .frame(width: 16)
                                }
                            }
                            
                        }
                        
                        VStack(alignment: .leading, spacing: 24) {
                            
                            Text("Explore")
                                .font(.custom("SignikaNegative-SemiBold", size: 24))
                                .padding(.top, 24)
                            
                        //commands
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Commands")
                                    .font(.custom("SignikaNegative-Regular", size: 20))
                                
                                HStack(alignment: .top) {
                                    ForEach(viewModel.commands.prefix(4), id: \.id) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.title ?? " ", image: item.image ?? " ")
                                        }
                                        
                                        if UIDevice.current.userInterfaceIdiom == .pad {
                                            Spacer()
                                                .frame(width: 32)
                                        } else {
                                            Spacer()
                                        }
                                    }
                                }
                                
                                HStack(alignment: .top) {
                                    ForEach(viewModel.commands[4..<8], id: \.id)  { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.title ?? " ", image: item.image ?? " ")
                                        }
                                        
                                        if UIDevice.current.userInterfaceIdiom == .pad {
                                            Spacer()
                                                .frame(width: 32)
                                        } else {
                                            Spacer()
                                        }
                                    }
                                }
                            }
                                
                            }
                            .padding(.leading, 16)
                            
                            //tricks
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Tricks")
                                    .font(.custom("SignikaNegative-Regular", size: 20))
                                
                                HStack(alignment: .top) {
                                    ForEach(viewModel.tricks.prefix(4), id: \.id) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.title ?? " ", image: item.image ?? " ")
                                        }
                                        
                                        if UIDevice.current.userInterfaceIdiom == .pad {
                                                    Spacer()
                                                        .frame(width: 32)
                                                } else {
                                                    Spacer()
                                                }
                                    }
                                }
                                
                                HStack(alignment: .top) {
                                    ForEach(viewModel.tricks[4..<8], id: \.id) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.title ?? " ", image: item.image ?? " ")
                                        }
                                        
                                        if UIDevice.current.userInterfaceIdiom == .pad {
                                                    Spacer()
                                                        .frame(width: 32)
                                                } else {
                                                    Spacer()
                                                }
                                    }
                                    
                                }
                            }
                            .padding(.leading, 16)
                        
                            //games
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Games")
                                    .font(.custom("SignikaNegative-Regular", size: 20))
                                    .padding(.top, 8)
                                
                                HStack(alignment: .top) {
                                    ForEach(viewModel.games.prefix(4), id: \.id) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.title ?? " ", image: item.image ?? " ")
                                        }
                                        
                                        if UIDevice.current.userInterfaceIdiom == .pad {
                                                    Spacer()
                                                        .frame(width: 32)
                                                } else {
                                                    Spacer()
                                                }
                                    }
                                }
                                
                                HStack(alignment: .top) {
                                    ForEach(viewModel.games[4..<8], id: \.id) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.title ?? " ", image: item.image ?? " ")                                        }
                                        
                                        if UIDevice.current.userInterfaceIdiom == .pad {
                                                    Spacer()
                                                        .frame(width: 32)
                                                } else {
                                                    Spacer()
                                                }
                                    }
                                    
                                }
                            }
                            .padding(.leading, 16)
                        
                        
                            //articles
                            
//                            VStack(alignment: .leading, spacing: 16) {
//                                Text("Guides")
//                                    .font(.custom("SignikaNegative-Regular", size: 20))
//                                
//                                HStack(alignment: .top) {
//                                    ForEach(items.articles[0..<3], id: \.text) { item in
//                                        Button(action: {
//                                            selectedItem = item
//                                        }) {
//                                            ListItem(text: item.text, image: item.image)
//                                            
//                                        }
//                                        
//                                        if UIDevice.current.userInterfaceIdiom == .pad {
//                                                    Spacer()
//                                                        .frame(width: 32)
//                                                } else {
//                                                    Spacer()
//                                                }
//                                        
//                                    }
//                                    Spacer()
//                                        .frame(width: 72)
//                                    Spacer()
//                                    
//                                    
//                                    
//                                }
//                                
//                                
//                            }
//                            .padding(.leading, 16)

                        }
                        
                    }
            }
            .sheet(item: $selectedItem) { selectedItem in
                        ContentSheetTemplate(item: selectedItem)
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
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            Task {
                refreshListView.toggle()
            }
        }
        .onChange(of: refreshListView) { _ in
        }
    }
}

struct ListViewAll_Previews: PreviewProvider {
    static var previews: some View {
        ListViewAll()
    }
}
