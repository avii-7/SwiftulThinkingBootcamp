//
//  DatePickerBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 08/12/24.
//

import SwiftUI

struct DatePickerBootcamp: View {
    
    @State private var selectedDate: Date = .now
    
    private var dateRange: ClosedRange<Date> {
        let startDate = DateComponents(year: 2019, month: 1, day: 1)
        return Calendar.current.date(from: startDate)!...Date.now
    }
    
    var body: some View {
        displayComponentsDatePicker2
    }
    
    private var defaultDatePicker: some View {
        DatePicker("Select your birthday date", selection: $selectedDate)
    }
    
    private var displayComponentsDatePicker: some View {
        DatePicker("Select your anniversery date", selection: $selectedDate, displayedComponents: [.date])
    }
    
    private var displayComponentsDatePicker2: some View {
        DatePicker(
            "Select your graduation year:",
            selection: $selectedDate,
            in: dateRange
        )
        .datePickerStyle(.automatic)
    }
}

#Preview {
    DatePickerBootcamp()
        .padding()
}
