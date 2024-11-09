//
//  PropertyWrapperBootcamp.swift
//  SwiftulThinkingBootcamp
//
//  Created by Arun on 22/09/24.
//

import SwiftUI

struct PropertyWrapperBootcamp: View {
    
    @Password private var pass = ""
    
    var body: some View {
        VStack {
            TextField("Password", text: $pass)
                .textFieldStyle(.roundedBorder)
            
            Text("It is \(_pass.isValid)")
        }
        .padding()
    }
}

#Preview {
    PropertyWrapperBootcamp()
}

@propertyWrapper
struct Password : DynamicProperty {
    
    @State var isValid = false
    
    @State private var value = ""
    
    var wrappedValue: String {
        get {
            value
        }
        nonmutating set {
            value = newValue
            validate()
        }
    }
    
    var projectedValue: Binding<String> {
        Binding { wrappedValue }
        set: { wrappedValue = $0 }
    }
    
    init(wrappedValue: String) {
        _value = State(wrappedValue: value)
        validate()
    }
    
    func validate() {
        isValid = wrappedValue.count > 3
    }
}

@propertyWrapper
public struct Validated<Rule: ValidationRule> {
    
    public var wrappedValue: Rule.Value
    
    private var rule: Rule
    
    // usage: @Validated(Rule()) var value: String = "initial value"
    public init(wrappedValue: Rule.Value, _ rule: Rule) {
        self.rule = rule
        self.wrappedValue = wrappedValue
    }
}

extension Validated {
    
    // returns our validation result
    public var projectedValue: Rule.ValidationResult { rule.validate(wrappedValue) }
}

extension Validated {
    
    // usage: @Validated<Rule> var value: String = "initial value"
    public init(wrappedValue: Rule.Value) {
        self.init(wrappedValue: wrappedValue, Rule.init())
    }
    
    // usage: @Validated<Rule> var value {
    public init() {
        let rule = Rule.init()
        self.init(wrappedValue: rule.fallbackValue, rule)
    }
}

extension Validated: Encodable where Rule.Value: Encodable {

    // if validated, encodes the original value, or else uses fallback
    // use a container as it allows us to extend KeyedEncodingContainer
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch projectedValue {
        case .success(let validated):
            try container.encode(validated)
        case .failure(_):
            try container.encode(Rule().fallbackValue)
        }
    }
}

extension Validated: Decodable where Rule.Value: Decodable {
    
    // we initialize a new wrapper with stored value and default rule
    // since we are using the default rule, we do not perform a validation check here
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Rule.Value.self)
        self.init(wrappedValue: value, Rule.init())
    }
}

extension Validated: Hashable where Rule.Value: Hashable {
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.wrappedValue)
    }
}

extension Validated: Equatable where Rule.Value: Equatable {
    
    public static func == (lhs: Validated<Rule>, rhs: Validated<Rule>) -> Bool {
        return lhs.wrappedValue == rhs.wrappedValue
    }
}


public protocol ValidationRule {
    
    associatedtype Value: Equatable
    associatedtype Failure: Error
    typealias ValidationResult = Result<Value, Failure>
    
    init()
    
    var fallbackValue: Value { get }
    
    func validate(_ value: Value) -> Result<Value, Failure>
}

public extension ValidationRule where Value == String {
    var fallbackValue: Value { .init() } // returns empty String
}

public extension ValidationRule where Value: ExpressibleByNilLiteral {
    var fallbackValue: Value { .init(nilLiteral: ()) } // returns nil
}
