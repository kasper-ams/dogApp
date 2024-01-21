//
//  Items.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 12/10/2023.
//

import Foundation
import SwiftUI


struct Item: Identifiable {
    
    let id = UUID()
    let text: String
    let image: String
    let sheet: () -> AnyView
    
}

class Items: ObservableObject {
    @Published var commands: [Item] = []
    @Published var tricks: [Item] = []
    @Published var games: [Item] = []
    @Published var articles: [Item] = []
    
    init() {
        commands = [
            Item(text: "Sit", image: "listSit", sheet: { AnyView(CommandViewSit()) }),
            Item(text: "Stay", image: "listStay", sheet: { AnyView(CommandViewStay()) }),
            Item(text: "Lie down", image: "listLieDown", sheet: { AnyView(CommandViewLieDown()) }),
            Item(text: "Recall", image: "listRecall", sheet: { AnyView(CommandViewCome()) }),
            Item(text: "Leave it", image: "listLeavIt", sheet: { AnyView(CommandViewLeaveIt()) }),
            Item(text: "Place", image: "listPlace", sheet: { AnyView(CommandViewPlace()) }),
            Item(text: "Hush", image: "listHush", sheet: { AnyView(CommandViewHush()) }),
            Item(text: "Eye contact", image: "listLook", sheet: { AnyView(CommandViewEyeContact()) })
        ]
        
        tricks = [
            Item(text: "Roll over", image: "listRoll", sheet: { AnyView(TrickViewRollOver()) }),
            Item(text: "High five", image: "listHighFive", sheet: { AnyView(TrickViewHighFive()) }),
            Item(text: "Jump into arms", image: "listJump", sheet: { AnyView(TrickViewJumpIntoArms()) }),
            Item(text: "Play dead", image: "listPlayDead", sheet: { AnyView(TrickViewPlayDead()) }),
            Item(text: "Bark", image: "listBark", sheet: { AnyView(TrickViewBark()) }),
            Item(text: "Peek", image: "listPeek", sheet: { AnyView(TrickViewPeek()) }),
            Item(text: "Crawl", image: "listCrawl", sheet: { AnyView(TrickViewCrawl()) }),
            Item(text: "Spin", image: "listSpin", sheet: { AnyView(TrickViewSpin()) })
        ]
        
        
        games = [
            Item(text: "Fetch", image: "listFetch", sheet: { AnyView(PlayViewFetch()) }),
            Item(text: "Hide and seek", image: "listHide", sheet: { AnyView(PlayViewHide()) }),
            Item(text: "Tug of war", image: "listTug", sheet: { AnyView(PlayViewTug()) }),
            Item(text: "Catch frisbee", image: "listFrisbee", sheet: { AnyView(PlayViewFrisbee()) }),
            Item(text: "Search", image: "listSearch", sheet: { AnyView(PlayViewSearch()) }),
            Item(text: "Tunnel", image: "listTunnel", sheet: { AnyView(PlayViewTunnel()) }),
            Item(text: "Treat challenge", image: "listCups", sheet: { AnyView(PlayViewTreatChallenge()) }),
            Item(text: "Volley", image: "listVolley", sheet: { AnyView(PlayViewVolley()) })
        ]
        
        articles = [
            Item(text: "Grooming", image: "listArticle", sheet: { AnyView(ArticleViewGrooming()) }),
            Item(text: "Puppy essentials", image: "listArticle", sheet: { AnyView(ArticleViewPuppyBuy()) }),
            Item(text: "Hand signals", image: "listArticle", sheet: { AnyView(ArticleViewHands()) })
            
            
            
        ]
        
        
    }
    
    
}
