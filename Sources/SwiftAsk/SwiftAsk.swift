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

public func askYesNo(_ question: String, color: Color?) -> Bool {
    
    if question.isEmpty {
        return false
    }
    
    if let color = color {
        say(question, color: color)
    }
    
    while true {
        
        say("[Y]es".bold.green, newLine: false)
        say(" or ".bold, newLine: false)
        say("[N]o".bold.red, newLine: false)
        
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
