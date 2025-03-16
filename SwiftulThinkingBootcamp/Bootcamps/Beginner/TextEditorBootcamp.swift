//
//  TextEditorBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun Kumar on 02/12/24.
//

/*
 -> My Learnings:
 1. You can't change the backgroundColor of TextEditor directly. You first need to hide the scrollContentBackground.
 2. There is one more cool initializer for textSelection purpose, which you can use to observe selected text.
 
 -> Pending:
 1. Play with textSelection initialzer.
 */

import SwiftUI

struct TextEditorBootcamp: View {
    
    @State private var text = "Hey 👋, Good Morning from SwiftUI!"
    
    @State private var textSelection: TextSelection?
    
    var body: some View {
        VStack {
            textEditor2
        }
        .navigationTitle("Text Editor Bootcamp")
    }
    
    private var textEditor1 : some View {
        TextEditor.init(text: $text)
            .scrollContentBackground(.hidden)
            .background(Color.gray.opacity(0.1))
            .clipShape(.rect(cornerRadius: 10))
            .padding()
    }
    
    private var textEditor2 : some View {
        VStack {
            TextEditor(text: $text, selection: $textSelection)
                .scrollContentBackground(.hidden)
                .background(Color.gray.opacity(0.1))
                .clipShape(.rect(cornerRadius: 10))
                .padding()
            
            Text(getSubstring())
        }
    }
    
    private func getSubstring() -> Substring {
        let subString: Substring
        if let indices = textSelection?.indices {
            switch indices {
            case .selection(let range):
                subString = text[range]
            case .multiSelection(let rangeIndicesSet):
                subString = ""
            default:
                subString = ""
            }
        }
        else {
            subString = ""
        }
        return subString
    }
}

#Preview {
    NavigationStack {
        TextEditorBootcamp()
    }
}
