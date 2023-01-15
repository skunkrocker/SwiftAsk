import Rainbow
import SwiftExt
import Foundation

public func say(_ message: String, color: Color, style: Style, backGround: BackgroundColor) -> Void {
    say(message.applyingBackgroundColor(backGround), color: color, style: style)
}

public func say(_ message: String, color: Color = .default, style: Style) -> Void {
    say(message.applyingStyle(style), color: color)
}

public func say(_ message: String, color: Color) -> Void {
    say(message.applyingColor(color))
}

public func say(_ message: String, newLine: Bool = true) -> Void {
    term { term, width in
        term.write(message)
        if newLine {
            term.endLine()
        }
    }
}

fileprivate let noOptions = Set(["no", "n"])
fileprivate let yesOptions = Set(["yes", "y"])

fileprivate  let no: String = "N".red + "o"
fileprivate let yes: String = "Y".green + "es"

public enum YesNoType {
    case yes_or_no
    case yes_dash_no
    case yes_no_brackets
}

public struct Question {
    var question: String
    var color: Color = .default
    
        
    public init(question: String, color: Color) {
        self.color = color
        self.question = question
    }
}

private func lineForType(_ type: YesNoType) -> String {
    switch type {
        case .yes_dash_no:
            return "Yes".green.bold + "/" + "No".red.bold + ": "
        case .yes_or_no:
            return "Yes".green.bold + " or " + "No".red.bold + ": "
        case .yes_no_brackets:
            return"[Y]es".green.bold + " [N]o".red.bold + ": "
    }
}

public func ask( _ question: Question, _ type: YesNoType = .yes_dash_no) -> Bool {
    
    if question.question.isEmpty {
        return false
    }
    
    say(question.question, color: question.color)
    
    while true {
        
        let yesNo = lineForType(type)
        say(yesNo, newLine: false)
        
        let answer: String = readLine()?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            .lowercased() ?? ""
        
        if yesOptions.contains(answer) {
            return true
        }
        
        if noOptions.contains(answer) {
            return false
        }
        
        say("Supported answers are: ", color: .red)
    }
}

public func ask(_ question: Question, _ type: YesNoType, onPositive: () -> Void ) -> Void {
    ask(question, type) { answer in
        if answer {
            onPositive()
        }
    }
}

public func ask(_ question: Question, _ type: YesNoType = .yes_dash_no, answer: (Bool) -> Void) -> Void {
    let response = ask(question, type)
    answer(response)
}

public func askYesNo(_ question: String, color: Color = .default) -> Bool {
    
    if question.isEmpty {
        return false
    }
    
    say(question, color: color)
    
    while true {
        
        say(yes + "/" + no + ": ", newLine: false)
        
        let answer: String = readLine()?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
            .lowercased() ?? ""
        
        if yesOptions.contains(answer) {
            return true
        }
        
        if noOptions.contains(answer) {
            return false
        }
        
        say("Supported answers are: ", color: .red)
    }
}
