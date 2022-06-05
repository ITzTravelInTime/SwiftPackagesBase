/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension String {
    ///Gets the substring btained by the specified character indexes interval
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    ///Gets the substring btained by the specified character indexes interval
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    ///Replaces the first occurance of a particular substring inside the current string with the specified replacement string.and then returns it.
    func replaceFirst(of pattern: String, with replacement: String) -> String {
        if let range = self.range(of: pattern){
            return self.replacingCharacters(in: range, with: replacement)
        }
        
        return self
    }
    
    ///Replaces all the occurances of a particular substring inside the current string with the specified replacement string and then returns it.
    func replaceAll(of pattern:String, with replacement:String) -> String{
        do{
            let regex = try NSRegularExpression(pattern: pattern, options: [])
            let range = NSRange(0..<self.utf16.count)
            return regex.stringByReplacingMatches(in: self, options: [],
                                                  range: range, withTemplate: replacement)
        }catch{
            NSLog("replaceAll error: \(error)")
            return self
        }
    }
    
    ///Returns a copy of the current string without the specified prefix
    func deletingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
    
    ///Returns a copy of the current string without the specified suffix
    func deletingSuffix(_ suffix: String) -> String {
        guard self.hasSuffix(suffix) else { return self }
        return String(self.dropLast(suffix.count))
    }
    
    ///Deletes the specified prefix from the current string
    @inline(__always) mutating func deletePrefix(_ prefix: String){
         self = self.deletingPrefix(prefix)
    }
    
    ///Deletes the specified suffix from the current string
    @inline(__always) mutating func deleteSuffix(_ suffix: String){
        self = self.deletingSuffix(suffix)
    }
    
    ///Returns if the current string contains the specified substring
    @inline(__always) func contains(_ str: String) -> Bool{
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
    func parsed(usingKeys keys: [String: String]) -> String{
        
        var ret = self
        
        for i in keys{
            ret = ret.replacingOccurrences(of: "$" + i.key, with: i.value)
        }
        
        return ret
    }
    
    ///Applies the parsed function to self
    mutating func parse(usingKeys keys: [String: String]){
        self = self.parsed(usingKeys: keys)
    }
}

extension String: Copying{
    ///Returns a copy of the current string
    @inline(__always) public func copy() -> Self{
        return String(self)
    }
}

extension String: BoolRepresentable {
    ///Returns the bool value represented by the string (if it does represent it)
    public func boolValue() -> Bool? {
        
        let value = self.lowercased()
        
        switch value{
        case "yes", "no":
            return value == "yes"
        case "true", "false":
            return value == "true"
        default:
            if let val: UInt64 = self.uIntValue(){
                return val.boolValue()
            }else{
                return nil
            }
        }
        
    }
    
}
 
extension String: CBoolRepresentable {
    ///Returns the bool value represented by the string (if it does represent it)
    public func cStyleBoolValue() -> Bool? {
        if let val: Double = self.floatingPointValue(){
            return val.cStyleBoolValue()
        }
        
        return boolValue()
    }
    
}

extension String: StringRepresentable {
    ///Returns a copy of the current string
    public func stringValue() -> String? {
        return self.copy()
    }
}
 
extension String: IntegerRepresentable {
    ///Returns the integer representation of the current string
    @inline(__always) public func intValue<T: FixedWidthInteger>() -> T? {
        return T(self)
    }
}

extension String: UnsignedIntegerRepresentable {
    ///Returns the unsigned integer representation of the current string
    @inline(__always) public func uIntValue<T: UnsignedInteger & FixedWidthInteger>() -> T? {
        return T(self)
    }
}
 
extension String: FloatingPointRepresentable {
    ///Returns the floatinf point representation of the current string
    @inline(__always) public func floatingPointValue<T: BinaryFloatingPoint>() -> T? {
        guard let val = Double(self) else { return nil } //cheating
        return T(val)
    }
}

extension String: Representable{}
