//
//  GridViewBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 10/02/25.
//

/* Learnings 📝
 1. Use .gridCellUnsizedAxes() to prevent expanding nature of Divider().
 2. Use Grid(alignment) to control all the cell in the Grid.
 3. Use EmptyView if you don't want to show a cell and let the preceeding view to take the space.
 4. Use .gridCellColumns() if you want a cell to span over multiple columns.
 5. Use .gridColumnAlignment() if you want to give specific alignment to a coloumn. Just apply it on one of the cell of the coloumn.
 6. Use .gridCellAnchor() to align content at the particular cell level.
 7. Grid doesn't have inbuild ScrollView.
 */

import SwiftUI

struct GridViewBootcamp: View {
    
    private let colors = [Color.red, Color.green, Color.blue, Color.yellow]
    
    private let n = 16
    
    var body: some View {
        gridContent3
    }
    
    private var gridContent1: some View {
        Grid (alignment: .trailing) {
            ForEach(0..<n, id: \.self) { row in
                GridRow {
                    ForEach(0..<n, id: \.self) { coloumn in
                        let number = row * n + (coloumn + 1)
                        getCell(for: number)
                    }
                }
                
                if row != n - 1 {
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                }
            }
        }
    }
    
    // EmptyView, span to multiple coloumns, gridColoumnAlignment.
    private var gridContent2: some View {
        Grid () {
            ForEach(0..<n, id: \.self) { row in
                GridRow () {
                    ForEach(0..<n, id: \.self) { coloumn in
                        let number = row * n + (coloumn + 1)
                        
                        if number == 7 {
                            EmptyView()
                        }
                        else {
                            getCell(for: number)
                                .gridCellColumns(number == 8 ? 2 : 1)
                                .gridColumnAlignment(number == 1 ? .leading : .center)
                        }
                    }
                }
                
                if row != n - 1 {
                    Divider()
                        .gridCellUnsizedAxes(.horizontal)
                }
            }
        }
    }
    
    // Cell level alignment and ScrollView
    private var gridContent3: some View {
        ScrollView([.vertical, .horizontal]) {
            Grid (horizontalSpacing: 10) {
                ForEach(0..<n, id: \.self) { row in
                    GridRow () {
                        ForEach(0..<n, id: \.self) { coloumn in
                            let number = row * n + (coloumn + 1)
                            
                            getCell(for: number)
                                .gridCellAnchor(number == 10 ? .top : .center)
                        }
                    }
                    
                    if row != n - 1 {
                        Divider()
                            .gridCellUnsizedAxes(.horizontal)
                    }
                }
            }
        }
    }
    
    private func getCell(for index: Int) -> some View {
        Text("\(index)")
            .frame(height: index == 10 ? 2 : nil)
            .foregroundStyle(.white)
            .font(.headline)
            .padding()
            .background(colors[index % colors.count].opacity(0.5))
    }
}

#Preview {
    GridViewBootcamp()
}
