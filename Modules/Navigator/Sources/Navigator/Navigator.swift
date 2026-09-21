//
//  Navigator.swift
//  Navigator
//
//  Created by Oks on 21/9/2026.
//

import Observation
import SwiftUI

@Observable
final public class Navigator<TAB_ID: Hashable, ROUTE: Hashable> {
    public var selectedTab: TAB_ID

    private var navPaths: [TAB_ID: [ROUTE]] = [ : ]

    public init(
        selectedTab: TAB_ID,
    ) {
        self.selectedTab = selectedTab
    }

    public func navigate(
        route: ROUTE,
    ) {
        navPaths[selectedTab, default: []].append(route)
    }
    
    public func navigate(
        tab: TAB_ID,
        resetPath: Bool = true,
    ) {
        selectedTab = tab
        
        if resetPath {
            navPaths[selectedTab, default: []].removeAll()
        }
    }
    
    public func navPath(tab: TAB_ID) -> Binding<[ROUTE]> {
        Binding(
            get: {
                self.navPaths[tab] ?? []
            },
            set: {
                self.navPaths[tab] = $0
            }
        )
    }
}
