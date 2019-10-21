
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
extension VTDecodeInfoFlags : StrOptionSet {
    static var labels: [Label] { return [
        (.asynchronous, "asynchronous"),
        (.frameDropped, "frameDropped"),
        (.imageBufferModifiable, "imageBufferModifiable")
    ]}
}

:: print it
let flags: VTDecodeInfoFlags = [.asynchronous, .frameDropped]
print(flags) // asynchronous,frameDropped
*/
