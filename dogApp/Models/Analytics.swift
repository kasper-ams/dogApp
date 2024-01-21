//
//  Analytics.swift
//  dogApp
//
//  Created by Kaspars Jelaiskis on 21/01/2024.
//

import Foundation
import FirebaseAnalytics
import FirebaseAnalyticsSwift


final class AnalyticsManager {
    
    static let shared = AnalyticsManager()
    private init() {
        
    }
    
    func logEvent(name: String, params: [String:Any]? = nil) {
        Analytics.logEvent(name, parameters: params)
    }
    
    func setUserId(userId: String) {
        Analytics.setUserID(userId)
    }
    
    func setUserProperty(value: String?, property: String) {
        // AnalyticsEventAddPaymentInfo
        Analytics.setUserProperty(value, forName: property)
    }
    
    
}
