/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

///Standard protocol for objects that can be converted to a `String`
public protocol StringRepresentable{
    func stringValue() -> String?
}

///Standard protocol for objects that can be converted to a `Bool`
public protocol BoolRepresentable{
    func boolValue() -> Bool?
}

///Standard protocol for objects that can be converted to a `Bool` (using the C conventin) or a `CBool`
public protocol CBoolRepresentable{
    func cStyleBoolValue() -> Bool?
}

///Standard protocol for objects that can be converted to an integer
public protocol IntegerRepresentable{
    func intValue<T: FixedWidthInteger>() -> T?
}

///Standard protocol for objects that can be converted to an unsigned integer
public protocol UnsignedIntegerRepresentable{
    func uIntValue<T: UnsignedInteger & FixedWidthInteger>() -> T?
}

///Standard protocol for objects that can be converted to a `UInt64`
public protocol UInt64Representable{
    func uInt64Value() -> UInt64?
}

///Standard protocol for objects that can be converted to a signed integer
public protocol SignedIntegerRepresentable: IntegerRepresentable{}

///Standard protocol for objects that can be converted to a `Int64`
public protocol Int64Representable{
    func int64Value() -> Int64?
}

///Standard protocol for objects that can be converted to a `FloatingPoint` type
public protocol FloatingPointRepresentable{
    func floatingPointValue<T: BinaryFloatingPoint>() -> T?
}

///Standard protocol for objects that can be converted to a `Float` type
public protocol FloatRepresentable{
    func floatValue() -> Float?
}

#if !os(iOS) && !targetEnvironment(macCatalyst) && !os(tvOS) && !os(watchOS) && !(arch(arm) || arch(arm64) || arch(arm64_32))
///Standard protocol for objects that can be converted to a `Float80` type
///NOTE: Available just for macOS and linux, on other platforms it's just an empty protocol
public protocol Float80Representable{
    func float80Value() -> Float80?
}

#else

///Standard protocol for objects that can be converted to a `Float80` type.
///NOTE: Available just for macOS (intel only) and linux, on other platforms it's just an empty protocol
public protocol Float80Representable {}

#endif

#if (arch(arm) || arch(arm64) || arch(arm64_32)) && !os(Linux)
///Standard protocol for objects that can be converted to a `Float16` type
///NOTE: Available just for arm platforms on recent apple os releases, on other platforms it's just an empty protocol
public protocol Float16Representable{
    @available(watchOS 7.0, iOS 14, tvOS 14, macOS 11.0, *) func float16Value() -> Float16?
}
#else
///Standard protocol for objects that can be converted to a `Float16` type
///NOTE: Available just for arm platforms on recent apple os releases, on other platforms it's just an empty protocol
public protocol Float16Representable{}
#endif

///Standard protocol for objects that can be converted to a `Double` type
public protocol DoubleRepresentable{
    func doubleValue() -> Double?
}

///Standard protocol for objects that can be converted to: `String`, `Bool`, C and Obj-c Bool types, `Integer`, `SignedInteger`, `UnsignedInteger`, `UInt64` and `Int64`
public protocol Representable: BoolRepresentable, CBoolRepresentable, StringRepresentable, UnsignedIntegerRepresentable, UInt64Representable, SignedIntegerRepresentable, Int64Representable, FloatingPointRepresentable, FloatRepresentable, Float80Representable, DoubleRepresentable, Float16Representable {}
