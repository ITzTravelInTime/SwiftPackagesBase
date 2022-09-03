/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension StringProtocol{
    
    private init(_ subsequence: Self.SubSequence) {
        let str = String(subsequence).cString(using: .utf8) ?? [0]
        self.init(cString: str)
    }
    
    ///Gets the substring btained by the specified character indexes interval
    subscript (bounds: CountableClosedRange<Int>) -> Self {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return Self(self[start...end])
    }
    
    ///Gets the substring btained by the specified character indexes interval
    subscript (bounds: CountableRange<Int>) -> Self {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return Self(self[start..<end])
    }
    
    ///Replaces the first occurance of a particular substring inside the current string with the specified replacement string.and then returns it.
    func replaceFirst(of pattern: Self, with replacement: Self) -> Self {
        if let range = self.range(of: pattern){
            return Self(self.replacingCharacters(in: range, with: replacement))!
        }
        
        return self
    }
    
    ///Replaces all the occurances of a particular substring inside the current string with the specified replacement string and then returns it.
    func replaceAll(of pattern: Self, with replacement: Self) -> Self{
        do{
            let regex = try NSRegularExpression(pattern: String(pattern), options: [])
            let range = NSRange(0..<self.utf16.count)
            return Self(regex.stringByReplacingMatches(in: String(self), options: [],range: range, withTemplate: String(replacement)))!
        }catch{
            print("replaceAll error: \(error)")
            return self
        }
    }
    
    ///Returns a copy of the current string without the specified prefix
    func deletingPrefix(_ prefix: Self) -> Self {
        guard self.hasPrefix(prefix) else { return self }
        return Self(self.dropFirst(prefix.count))
    }
    
    ///Returns a copy of the current string without the specified suffix
    func deletingSuffix(_ suffix: Self) -> Self {
        guard self.hasSuffix(suffix) else { return self }
        return Self(self.dropLast(suffix.count))
    }
    
    ///Returns if the current string contains the specified substring
    @inline(__always) func contains(_ str: Self) -> Bool{
        return self.range(of: str) != nil
    }
    
    ///Returns if the current string is nly made ut of letters and numbers
    var isAlphanumeric: Bool{
        if self.isEmpty{
            return false
        }
        
        for i in self where (!i.isLetter && !i.isNumber){
            return false
        }
        
        return true
    }
    
    ///Replaces the `$`(dollarsign) characters followed by a particular string key of the kerys dictionary with the specified associated value and then returns the obtained string
    func parsed(usingKeys keys: [Self: Self]) -> Self{
        
        var ret = String(self)
        
        for i in keys{
            ret = ret.replacingOccurrences(of: "$" + i.key, with: i.value)
        }
        
        var val = ret.cString(using: .utf8) ?? [CChar(0)]
        return Self(cString: &val)
    }
    
    ///Applies the parsed function to self
    mutating func parse(usingKeys keys: [Self: Self]){
        self = self.parsed(usingKeys: keys)
    }

    ///Deletes the specified prefix from the current string
    @inline(__always) mutating func deletePrefix(_ prefix: Self){
         self = self.deletingPrefix(prefix)
    }
    
    ///Deletes the specified suffix from the current string
    @inline(__always) mutating func deleteSuffix(_ suffix: Self){
        self = self.deletingSuffix(suffix)
    }
}

extension StringProtocol where Self:Copying{
    ///Returns a copy of the current string
    @inline(__always) public func copy() -> Self{
        return Self(stringLiteral: String(self))
    }
}

extension StringProtocol where Self:BoolRepresentable {
    ///Returns the bool value represented by the string (if it does represent it)
    public func boolValue() -> Bool? {
        
        let value = self.lowercased()
        
        switch value{
        case "yes", "no":
            return value == "yes"
        case "true", "false":
            return value == "true"
        default:
            if let val: Int64 = Int64.init("\(self)"){
                return val.boolValue()
            }else if let val: Double = Double.init("\(self)"){
                return val.boolValue()
            }else{
                return nil
            }
        }
        
    }
    
}
 
extension StringProtocol where Self: CBoolRepresentable {
    ///Returns the bool value represented by the string (if it does represent it)
    public func cStyleBoolValue() -> Bool? {
        
        if let val: Int64 = Int64.init("\(self)"){
            return val.cStyleBoolValue()
        }
        
        if let val: Double = Double.init("\(self)"){
            return val.cStyleBoolValue()
        }
        
        return String(self).boolValue()
    }
    
}

extension StringProtocol where Self: StringRepresentable {
    ///Returns a copy of the current string
    public func stringValue() -> String? {
        return String(self)
    }
}
 
extension StringProtocol where Self: IntegerRepresentable {
    ///Returns the integer representation of the current string
    @inline(__always) public func intValue<T: FixedWidthInteger>() -> T? {
        return T(self)
    }
}

extension StringProtocol where Self: UnsignedIntegerRepresentable {
    ///Returns the unsigned integer representation of the current string
    @inline(__always) public func uIntValue<T: UnsignedInteger & FixedWidthInteger>() -> T? {
        return T(self)
    }
}
 
extension StringProtocol where Self: FloatingPointRepresentable {
    ///Returns the floatinf point representation of the current string
    @inline(__always) public func floatingPointValue<T: BinaryFloatingPoint>() -> T? {
        guard let val = Double(self) else { return nil } //cheating
        return T(val)
    }
}

extension Substring: Representable, Copying{}
extension String: Representable, Copying{}
