//
//  DailyView.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 10/12/2023.
//

import SwiftUI

struct DailyView: View {
    
    @ObservedObject var items = Items()
    
    @AppStorage("lastSelectedDate") var lastSelectedDate: String = ""
    @AppStorage("programStatus") var programStatusFirst = ProgramStatusFirst.notStarted.rawValue
    @AppStorage("programStatusLeash") var programStatusLeash = ProgramStatusLeash.notStarted.rawValue
    @AppStorage("programStatusOffice") var programStatusOffice = ProgramStatusOffice.notStarted.rawValue

    let colorTop = Color(red: 1, green: 0.66, blue: 0.47)
    let colorBottom = Color(red: 1, green: 0.58, blue: 0.35)

    @State var selectedRandomItems: [Item] = []
    @State private var selectedItem: Item? = nil

    
    func selectRandomItems() {
          // Assuming there are at least three items in each category
          let randomCommands = items.commands.shuffled().prefix(1)
          let randomTricks = items.tricks.shuffled().prefix(1)
          let randomGames = items.games.shuffled().prefix(1)

          // Combine the selected random items
          let combinedRandomItems = randomCommands + randomTricks + randomGames

          // Assign the combined random items to selectedRandomItems
          selectedRandomItems = Array(combinedRandomItems)

          // Update the last selected date
          lastSelectedDate = getCurrentDate()

          // Print statement for verification
          print("Selected Random Items: \(selectedRandomItems.map { $0.text })")
      }
    
    
    
    func shouldRunSelectRandomItems() -> Bool {
        let currentDate = getCurrentDate()
        let lastSelectedDate = self.lastSelectedDate

        // Print statements for verification
        print("Current Date: \(currentDate)")
        print("Last Selected Date: \(lastSelectedDate)")

        // Compare the current date with the last selected date or check if selectedRandomItems is empty
        let shouldRun = currentDate != lastSelectedDate || selectedRandomItems.isEmpty
        print("Should Run Select Random Items: \(shouldRun)")

        return shouldRun
    }
    
    
    // Function to get the current date as a string
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let currentDate = dateFormatter.string(from: Date())

        // Print statement for verification
        print("Current Date (Formatted): \(currentDate)")

        return currentDate
    }
    
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(red: 0xF3 / 255.0, green: 0xF1 / 255.0, blue: 0xEE / 255.0))

            
// programs in progress
            VStack(alignment: .leading, spacing: 24) {
                Group {
                    let isInProgress =
                    programStatusFirst == ProgramStatusFirst.inProgress.rawValue ||
                    programStatusLeash == ProgramStatusLeash.inProgress.rawValue ||
                    programStatusOffice == ProgramStatusOffice.inProgress.rawValue

                    if isInProgress {
                        VStack(alignment: .leading, spacing: 32) {
                            Text("Active programs")
                                .foregroundColor(.black)
                                .font(.custom("SignikaNegative-SemiBold", size: 18))

                            
                            if programStatusFirst == ProgramStatusFirst.inProgress.rawValue {
                                NavigationLink(destination: ProgramViewFirst()) {
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

                            if programStatusLeash == ProgramStatusLeash.inProgress.rawValue {
                                NavigationLink(destination: ProgramViewLeash()) {
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

                            if programStatusOffice == ProgramStatusOffice.inProgress.rawValue {
                                NavigationLink(destination: ProgramViewOffice()) {
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
                }
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
                                DailyChallengeCard(text: item.text, image: item.image)
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear() {
            // Check if the current date is different from the last selected date or if selectedRandomItems is empty
            if shouldRunSelectRandomItems() {
                // Run the function to select random items
                selectRandomItems()
            }
        }
        
        
        .padding([.leading, .trailing], 16)
        .fixedSize(horizontal: false, vertical: true)
        .sheet(item: $selectedItem) { item in
            item.sheet()
        }
    }
}

#Preview {
    DailyView()
}
