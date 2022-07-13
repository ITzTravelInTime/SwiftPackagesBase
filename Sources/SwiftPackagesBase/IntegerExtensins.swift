/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension FixedWidthInteger{
    ///Assuming that the current string represents an ammount of byte, this returns an approximation of it in form of a string with a mesurement unit suffixed to it.
    func sizeString() -> String{
        var n = Double(self), nc = Double(self)
        var div: Self = 1, divc: Self = 1
        
        while n > 1024 {
            div *= 1024
            n = Double(self) / Double(div)
        }
        
        while nc > 1000 {
            divc *= 1000
            nc = Double(self) / Double(divc)
        }
        
        var suffix = ""
        
        //log10(Double(div))
        switch log10(Double(divc)) {
        case 3:
            suffix = "KB"
        case 6:
            suffix = "MB"
        case 9:
            suffix = "GB"
        case 12:
            suffix = "TB"
        case 15:
            suffix = "PB"
        default:
            suffix = "Byte"
            n = Double(self)
        }
        
        if floor(n) != n{
            return "\(String(format: "%.2f", n)) \(suffix)"
        }else{
            return "\(UInt64(n)) \(suffix)"
        }
        
    }
}

public extension IntegerRepresentable where Self:FixedWidthInteger{
    ///Returns self converted to the desired integer type
    @inline(__always) func intValue<T: FixedWidthInteger>() -> T?{
        return T(self)
    }
}
 
public extension UnsignedIntegerRepresentable where Self:FixedWidthInteger{
    ///Returns self converted to the desired unsigned integer type
    @inline(__always) func uIntValue<T: UnsignedInteger & FixedWidthInteger>() -> T?{
        return T(self)
    }
}

public extension FloatingPointRepresentable where Self:FixedWidthInteger{
    ///Returns self converted to the desired floating point type
    @inline(__always) func floatingPointValue<T: BinaryFloatingPoint>() -> T? {
        return T(exactly: self)
    }
}

extension Copying where Self: FixedWidthInteger{
    ///Returns a copy of self
    @inline(__always) public func copy() -> Self{
        return Self(self)
    }
}

extension Int8: Representable, Copying{}
extension Int16: Representable, Copying{}
extension Int32: Representable, Copying{}
extension Int64: Representable, Copying{}
extension Int: Representable, Copying{}

extension UInt8: Representable, Copying{}
extension UInt16: Representable, Copying{}
extension UInt32: Representable, Copying{}
extension UInt64: Representable, Copying{}
extension UInt: Representable, Copying{}
