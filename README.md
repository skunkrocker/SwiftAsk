# SwiftAsk

Simple Swift library for asking the user the hard questions on the Command line.

## Usage

Ask the question and execute the block only when positive answer is given.

```swift
let question = Question(question: "Wonna play game", color: .blue)
ask(question, .yes_or_no) {
    say("Glad you agree!!".bold)
}
```

Ask clear yes no questions.

```swift
let answer = askYesNo("Do you like cats?", color: .yellow)
if answer {
    say("Yes they are cute.")
} else {
    say("I see, you are more of a dog person.")
}
```
Ask questions in different colors and use different types of [Y]es [N]o question.
```swift
let question = Question(question: "Wonna play game", color: .cyan)
ask(question, .yes_no_brackets) { answer in
    say("You answered with: \(answer)")
}
```
