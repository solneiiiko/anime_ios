//
//  AppConfig.swift
//  anime
//
//  Created by Oks on 16/9/2026.
//

import Foundation

enum AppConfig {
    static let loggingEnabled: Bool = Bundle.main.object(
        forInfoDictionaryKey: Key.loggingEnabled
    ) as? String == Value.yes
    
    private enum Value {
        static let yes = "YES"
    }
    
    private enum Key {
        static let loggingEnabled = "LOGGING_ENABLED"
    }
}
