/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension StringRepresentable{
    ///Returns if the current instance can be converted to a `String`
    func isString() -> Bool{
        return self.stringValue() != nil
    }
}

public extension BoolRepresentable{
    ///Returns if the current instance can be converted to a `Bool`
    func isBool() -> Bool{
        return self.boolValue() != nil
    }
}

public extension CBoolRepresentable{
    ///Returns if the current instance can be converted to a `CBool`
    func isCBool() -> Bool{
        return self.cStyleBoolValue() != nil
    }
    
    ///Returns the current instance converted to a `CBool`
    func cBoolValue() -> CBool?{
        return self.cStyleBoolValue()
    }
    
    ///Returns the current instance converted to a `ObjCBool`
    func cBoolValue() -> ObjCBool?{
        guard let val: Bool = self.cStyleBoolValue() else { return nil }
        return ObjCBool(val)
    }
}

public extension IntegerRepresentable{
    ///Returns if the current instance can be converted to an Integer
    func isIntOfType<T: FixedWidthInteger>(exampleValue: T = 0) -> Bool{
        let val: T? = self.intValue()
        return val != nil
    }
    
    ///Returns if the current instance can be converted to an Integer
    func isInt() -> Bool{
        let val: Int? = self.intValue()
        return val != nil
    }
}

public extension UnsignedIntegerRepresentable{
    ///Returns if the current instance can be converted to an unsigned integer
    func isUIntOfType<T: UnsignedInteger & FixedWidthInteger>(exampleValue: T = 0) -> Bool{
        let val: T? = self.uIntValue()
        return val != nil
    }
    
    ///Returns if the current instance can be converted to an unsigned integer
    func isUInt() -> Bool{
        let val: UInt? = self.uIntValue()
        return val != nil
    }
}

public extension UInt64Representable{
    ///Returns if the current instance can be converted to a `UInt64`
    func isUInt64() -> Bool{
        return self.uInt64Value() != nil
    }
}

public extension UInt64Representable where Self: UnsignedIntegerRepresentable{
    ///Returns the current instance can be converted to a `UInt64`
    func uInt64Value() -> UInt64?{
        guard let val: UInt64 = self.uIntValue() else { return nil }
        return val
    }
}

public extension SignedIntegerRepresentable{
    ///Returns the current instance converted to a signed integer
    func sIntValue<T: SignedInteger & FixedWidthInteger>() -> T?{
        return self.intValue()
    }
    
    ///Returns if the current instance can be converted to an signed integer
    func isSIntOfType<T: SignedInteger & FixedWidthInteger>(exampleValue: T = 0) -> Bool{
        let val: T? = self.sIntValue()
        return val != nil
    }
    
    ///Returns if the current instance can be converted to a signed integer
    func isSInt() -> Bool{
        let val: Int? = self.sIntValue()
        return val != nil
    }
}

public extension Int64Representable{
    ///Returns if the current instance can be converted to a `Int64`
    func isInt64() -> Bool{
        return self.int64Value() != nil
    }
}

public extension Int64Representable where Self:SignedIntegerRepresentable{
    ///Returns the current instance can be converted to a `Int64`
    func int64Value() -> Int64?{
        guard let val: Int64 = self.sIntValue() else { return nil }
        return val
    }
}

public extension FloatingPointRepresentable{
    ///Returns if the current instance can be converted to a `FlatingPoint` of the specified type
    func isFloatingPointOfType<T: BinaryFloatingPoint>(exampleValue: T = 0) -> Bool{
        let val: T? = self.floatingPointValue()
        return val != nil
    }
    
    ///Returns if the current instance can be converted to a `FlatingPoint`
    func isFloatingPoint() -> Bool{
        let val: Double? = self.floatingPointValue()
        return val != nil
    }
}


public extension FloatRepresentable{
    ///Returns if the current instance can be converted to a `Float`
    func isFloat() -> Bool{
        let val: Float? = self.floatValue()
        return val != nil
    }
}

#if !os(iOS) && !targetEnvironment(macCatalyst) && !os(tvOS) && !os(watchOS) && !(arch(arm) || arch(arm64))
public extension Float80Representable{
    ///Returns if the current instance can be converted to a `FlatingPoint`
    func isFloatingPoint() -> Bool{
        let val: Float80? = self.float80Value()
        return val != nil
    }
}
#endif

public extension DoubleRepresentable{
    ///Returns if the current instance can be converted to a `FlatingPoint`
    func isDouble() -> Bool{
        let val: Double? = self.doubleValue()
        return val != nil
    }
}

public extension FloatRepresentable where Self: FloatingPointRepresentable{
    ///Returns self converted to the `Float` type
    func floatValue() -> Float?{
        guard let val: Float = self.floatingPointValue() else { return nil }
        return val
    }
}

#if !os(iOS) && !targetEnvironment(macCatalyst) && !os(tvOS) && !os(watchOS) && !(arch(arm) || arch(arm64))
public extension Float80Representable where Self: FloatingPointRepresentable{
    ///Returns self converted to the `Float80` type
    func float80Value() -> Float80?{
        guard let val: Float80 = self.floatingPointValue() else { return nil }
        return val
    }
}
#endif

public extension DoubleRepresentable where Self: FloatingPointRepresentable{
    ///Returns self converted to the `Double` type
    func doubleValue() -> Double?{
        guard let val: Double = self.floatingPointValue() else { return nil }
        return val
    }
}
