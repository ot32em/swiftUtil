
protocol StrOptionSet : OptionSet, CustomStringConvertible {
    typealias Label = (Self, String)
    static var labels: [Label] { get }
}

extension StrOptionSet {
    var strs: [String] { return Self.labels
                                .filter{ (label: Label) in self.intersection(label.0).isEmpty == false }
                                .map{    (label: Label) in label.1 }
    }
    public var description: String { return strs.joined(separator: ",") }
}

/* 
client code

:: hook on existed OptionSet

struct Color: OptionSet
{
    let rawValue: Int
    static var red = Color(rawValue:   1 << 0)
    static var green = Color(rawValue: 1 << 1)
    static var blue = Color(rawValue:  1 << 2)
}

extension Color : StrOptionSet {
    static var labels: [Label] { return [
        (.red , "red"),
        (.green, "green"),
        (.blue, "blue")
    ]}
}

:: print it
let purple: Color = [.red, .blue]
print("purple:", purple) // output: purple: red,blue

*/
