/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension IntegerRepresentable where Self: BinaryFloatingPoint{
    
    ///Returns self approximated comverted to the desired integer type
    @inline(__always) func intValue<T: FixedWidthInteger>() -> T?{
        return T(exactly: self.rounded())
    }
    
}
    
public extension UnsignedIntegerRepresentable where Self: BinaryFloatingPoint{
    ///Returns self approximated comverted to the desired unsigned integer type
    @inline(__always) func uIntValue<T: UnsignedInteger & FixedWidthInteger>() -> T?{
        return T(exactly: self.rounded())
    }
}
 
public extension FloatingPointRepresentable where Self: BinaryFloatingPoint{
    ///Returns self comverted to the desired floating point type
    @inline(__always) func floatingPointValue<T: BinaryFloatingPoint>() -> T? {
        return T(self)
    }
}

public extension Copying where Self: BinaryFloatingPoint{
    ///Creates a cpy f the current instance
    @inline(__always) func copy() -> Self{
        return Self(self)
    }
}

extension Float: Representable, Copying{}
extension Double: Representable, Copying{}

#if (arch(arm) || arch(arm64) || arch(arm64_32)) && !os(Linux)
@available(watchOS 7.0, iOS 14, tvOS 14, macOS 11.0, *) extension Float16: Representable, Copying{}
#endif

#if !os(iOS) && !targetEnvironment(macCatalyst) && !os(tvOS) && !os(watchOS) && !(arch(arm) || arch(arm64) || arch(arm64_32))
extension Float80: Representable, Copying{}
#endif
