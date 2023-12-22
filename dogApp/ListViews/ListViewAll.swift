//
//  ListViewAll2.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 25/09/2023.
//

import SwiftUI

struct ListViewAll: View {
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    let colorTop = Color(red: 1, green: 0.66, blue: 0.47)
    let colorBottom = Color(red: 1, green: 0.58, blue: 0.35)
    @State private var selectedItem: Item? = nil
    
    @ObservedObject var items = Items()
    @AppStorage("programStatus") var programStatusFirst = ProgramStatusFirst.notStarted.rawValue
    @AppStorage("programStatusLeash") var programStatusLeash = ProgramStatusLeash.notStarted.rawValue
    @AppStorage("programStatusOffice") var programStatusOffice = ProgramStatusOffice.notStarted.rawValue
    
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
                                    
                                    NavigationLink(destination: ProgramViewFirst()) {
                                        ZStack(alignment: .topLeading) {
                                            ProgramCard(text: "My first puppy", image: "puppy", colorTop: colorTop, colorBottom: colorBottom)
                                            if programStatusFirst == ProgramStatusFirst.inProgress.rawValue {
                                                Text("In progress")
                                                    .foregroundColor(.white)
                                                    .font(.custom("SignikaNegative-Regular", size: 16))
                                                    .padding(24)
                                            } else if programStatusFirst == ProgramStatusFirst.completed.rawValue {
                                                Text("Completed")
                                                    .foregroundColor(.white)
                                                    .font(.custom("SignikaNegative-Regular", size: 16))
                                                    .padding(24)
                                            }
                                        }
                                    }
                                    Spacer()
                                        .frame(width: 12)
                                    
                                    NavigationLink(destination: ProgramViewLeash()) {
                                        ZStack(alignment: .topLeading) {
                                            ProgramCard(text: "Leash walking", image: "leashWalking", colorTop: Color(red: 0.61, green: 0.79, blue: 0.86), colorBottom: Color(red: 0.53, green: 0.75, blue: 0.83))
                                            
                                            if programStatusLeash == ProgramStatusLeash.inProgress.rawValue {
                                                Text("In progress")
                                                    .foregroundColor(.white)
                                                    .font(.custom("SignikaNegative-Regular", size: 16))
                                                    .padding(24)
                                            } else if programStatusLeash == ProgramStatusLeash.completed.rawValue {
                                                Text("Completed")
                                                    .foregroundColor(.white)
                                                    .font(.custom("SignikaNegative-Regular", size: 16))
                                                    .padding(24)
                                            }
                                            
                                        }
                                    }
                                    Spacer()
                                        .frame(width: 12)
                                    NavigationLink(destination: ProgramViewOffice()) {
                                        ZStack(alignment: .topLeading) {
                                            ProgramCard(text: "Ready for office", image: "office", colorTop: Color(red: 0.54, green: 0.55, blue: 0.86), colorBottom: Color(red: 0.45, green: 0.47, blue: 0.83))
                                            
                                            if programStatusOffice == ProgramStatusOffice.inProgress.rawValue {
                                                Text("In progress")
                                                    .foregroundColor(.white)
                                                    .font(.custom("SignikaNegative-Regular", size: 16))
                                                    .padding(24)
                                            } else if programStatusOffice == ProgramStatusOffice.completed.rawValue {
                                                Text("Completed")
                                                    .foregroundColor(.white)
                                                    .font(.custom("SignikaNegative-Regular", size: 16))
                                                    .padding(24)
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
                                .padding(.leading, 16)
                            
                            //commands
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Commands")
                                    .font(.custom("SignikaNegative-Regular", size: 20))
                                
                                HStack(alignment: .top) {
                                    ForEach(items.commands.prefix(4), id: \.text) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.text, image: item.image)
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
                                    ForEach(items.commands[4..<8], id: \.text) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.text, image: item.image)
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
                            
                            //tricks
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Tricks")
                                    .font(.custom("SignikaNegative-Regular", size: 20))
                                
                                HStack(alignment: .top) {
                                    ForEach(items.tricks[0..<4], id: \.text) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.text, image: item.image)
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
                                    ForEach(items.tricks[4..<8], id: \.text) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.text, image: item.image)
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
                                
                                HStack(alignment: .top) {
                                    ForEach(items.games[0..<4], id: \.text) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.text, image: item.image)
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
                                    ForEach(items.games[4..<8], id: \.text) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.text, image: item.image)
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
                            //articles
                            
                            VStack(alignment: .leading, spacing: 16) {
                                Text("Guides")
                                    .font(.custom("SignikaNegative-Regular", size: 20))
                                
                                HStack(alignment: .top) {
                                    ForEach(items.articles[0..<3], id: \.text) { item in
                                        Button(action: {
                                            selectedItem = item
                                        }) {
                                            ListItem(text: item.text, image: item.image)
                                            
                                        }
                                        
                                        if UIDevice.current.userInterfaceIdiom == .pad {
                                                    Spacer()
                                                        .frame(width: 32)
                                                } else {
                                                    Spacer()
                                                }
                                        
                                    }
                                    Spacer()
                                        .frame(width: 72)
                                    Spacer()
                                    
                                    
                                    
                                }
                                
                                
                            }
                            .padding(.leading, 16)
                            
                            
                            
                        }
                        
                    }
                    
                }
                
            }
            .sheet(item: $selectedItem) { item in
                           item.sheet()
                       }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ListViewAll_Previews: PreviewProvider {
    static var previews: some View {
        ListViewAll()
    }
}
