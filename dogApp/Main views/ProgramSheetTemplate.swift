//
//  ProgramSheetTemplate.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 11/01/2024.
//

import SwiftUI
import Combine
import Firebase


struct ProgramSheetTemplate: View {
    
    @Environment(\.presentationMode) var presentationMode
    let bgColor = Color(red: 250.0/255.0, green: 250.0/255.0, blue: 250.0/255.0)
    let program: ProgramSheetStructure
    
    @State private var userLessons: [ProgramSheetStructure] = []
    
    @StateObject private var viewModel = ProgramViewModel()
    
    @State private var isComplete: Bool = false
    @State private var cancellables: Set<AnyCancellable> = []
    
    
    
    var body: some View {
        
        ZStack(alignment: .topTrailing) {
            
            bgColor.ignoresSafeArea()
            
            HStack {
                
                Spacer()
                
                CloseSheetButton {
                    presentationMode.wrappedValue.dismiss()
                    
                }
                
            }
            .zIndex(3)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    Image(program.image )
                        .resizable()
                        .aspectRatio(contentMode: .fit)

                    if isComplete {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 0.91, green: 1, blue: 0.94))
                                .frame(width: .infinity, height: 36)
                            
                            HStack(alignment: .center, spacing: 2) {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.green)
                                Text("Lesson completed!")
                                    .font(.custom("Poppins-Medium", size: 16))
                                    .foregroundColor(.green)
                            }
                            .padding(.leading, 16)
                        }
                    }
   
                    Button(action: {
                        Task {
                            do {
                                let authDataResult = try AuthenticationManager.shared.getAuthenticatedUser()
                                try await viewModel.removeLesson(userId: authDataResult.uid, lessonId: program.id)
                                print("Lesson removed from user collection")
                            } catch {
                                print("Error removing lesson from user collection:", error.localizedDescription)
                            }
                        }
                    }, label: {
                        Text("Remove")
                    })
                    
                    Button(action: {
                        Task {
                            do {
                                let isCompleted = try await UserManager.shared.isLessonCompleted(lessonId: program.id)
                                print("Is lesson completed: \(isCompleted)")
                                
                            } catch {
                                print("Error checking lesson completion:", error.localizedDescription)
                            }
                        }
                    }, label: {
                        Text("Get lesson status")
                    })
                    
                    Text(program.title )
                        .font(.custom("SignikaNegative-SemiBold", size: 24))
                    if let summary = program.summary {
                        ZStack(alignment: .leading) {
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.thickMaterial)
                            
                            Text(summary)
                                .font(.custom("Poppins-Regular", size: 14))
                                .foregroundColor(.gray)
                                .padding()
                        }
                    }
                    Text(program.description )
                    Spacer()
                    
                    GetNamesButton(text: "Mark as complete") {
                        viewModel.updateLessonStatus(lessonId: program.id)
                        presentationMode.wrappedValue.dismiss()
                    }
                        .opacity(isComplete ? 0 : 1)

                }
            }
            .padding([.leading,.trailing], 16)
        }
        .onAppear {
            Task {
                do {
                    let isComplete = try await UserManager.shared.isLessonCompleted(lessonId: program.id)
                    self.isComplete = isComplete
                    print("Lesson status: \(isComplete ? "Completed" : "Not Completed")")
                    
                } catch {
                    print("Error checking lesson completion on appear:", error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ProgramSheetTemplate(program: ProgramSheetStructure(id: 1, title: "Title", description: "description", summary: "summary", image: "Sit"))
}
