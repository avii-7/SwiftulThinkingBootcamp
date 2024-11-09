//
//  PrintSeriesBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 23/09/24.
//

import Foundation
import AsyncAlgorithms

class PrintSeriesBootcamp {
    
    func execute() {
        let numberChannel = AsyncChannel<Void>()
        let alphabetsChannel = AsyncChannel<Void>()
        
        Task {
            var iterator = (1...10).makeIterator()
            for await _ in numberChannel {
                if let number = iterator.next() {
                    print(number, terminator: " ")
                    await alphabetsChannel.send(())
                }
                else {
                    numberChannel.finish()
                    alphabetsChannel.finish()
                }
            }
        }
        
        Task {
            var iterator = (0...10).makeIterator()
            await numberChannel.send(())
            for await _ in alphabetsChannel {
                if let number = iterator.next() {
                    let letter = Character(UnicodeScalar(65 + number)!)
                    print(letter, terminator: " ")
                    await numberChannel.send(())
                }
            }
        }
    }
}
