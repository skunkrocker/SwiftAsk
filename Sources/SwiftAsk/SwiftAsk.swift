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

public let noOptions = Set(["no", "n"])
public let yesOptions = Set(["yes", "y"])

fileprivate  let no: String = "N".red + "o"
fileprivate let yes: String = "Y".green + "es"

public enum YesNoType {
    case first
    case second
    case third
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
        case .first:
            return "Y".green + "es " + "/" + "N".red + "o"
        case .second:
            return "Yes".green + " or " + "No".red
        case .third:
            return"[Y]".bold + "es" + " [N]".bold + "o"
    }
}

public func ask( _ question: Question, _ type: YesNoType = .first) -> Bool {
    
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

public func ask(_ question: Question, _ type: YesNoType = .first, answer: (Bool) -> Void) -> Void {
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
