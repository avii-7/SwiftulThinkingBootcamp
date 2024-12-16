//
//  TabViewBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 13/12/24.
//

/* My Learnings:
 1. You can use PageViewStyle for horizontal carasoul.
 2. You can also add Badges in tabItem using .badgeModifier.
 3. Use TabSection for grouping tabs which is not visible in iPhones but in iPads.
 
 */

/* Pending
 1. TabView documentation.
 
 */

import SwiftUI

struct TabViewBootcamp: View {
    
    @State private var tabSelection: Int = 0
    
    var body: some View {
        tabView2
    }
    
    private var tabView1: some View {
        TabView(selection: $tabSelection) {
            
            Tab("Fire", systemImage: "flame.fill", value: 0) {
                Image(systemName: "flame")
                    .font(.largeTitle)
            }
            
            Tab("Forest", systemImage: "leaf", value: 1) {
                Image(systemName: "leaf")
                    .font(.largeTitle)
            }
            
            Tab("Water", systemImage: "drop.fill", value: 2) {
                Image(systemName: "drop.fill")
                    .font(.largeTitle)
                
            }
            .badge(2)
        }
        .tabViewStyle(.sidebarAdaptable)
        .background(.gray.secondary)
    }
    
    private var tabView2: some View {
        TabView {
            Tab("Requests", systemImage: "paperplane") {
                Text("Request View")
            }


            Tab("Account", systemImage: "person.crop.circle.fill") {
                Text("AccountView")
            }


            TabSection("Messages") {
                Tab("Received", systemImage: "tray.and.arrow.down.fill") {
                    Text("ReceivedView")
                }


                Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
                    Text("SentView")
                }


                Tab("Drafts", systemImage: "pencil") {
                    Text("DraftsView")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    TabViewBootcamp()
}
