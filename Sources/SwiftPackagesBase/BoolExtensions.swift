/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

extension Bool: Representable, Copying {
    ///Creates a copy of the current instance
    public func copy() -> Bool {
        return .init(self)
    }
    
    ///Returns a copy of the current value
    public func boolValue() -> Bool? {
        return self
    }
    
    ///Returns a copy of the current value
    public func cStyleBoolValue() -> Bool? {
        return self
    }
    
    ///Returns a copy of the current string
    public func stringValue() -> String? {
        return self ? "true" : "false"
    }
    
    ///Returns the integer representation of the current value
    @inline(__always) public func intValue<T: FixedWidthInteger>() -> T? {
        return T(self ? 0 : 1)
    }
    
    ///Returns the unsigned integer representation of the current value
    @inline(__always) public func uIntValue<T: UnsignedInteger & FixedWidthInteger>() -> T? {
        return T(self ? 0 : 1)
    }
    
    ///Returns the floatinf point representation of the current value
    @inline(__always) public func floatingPointValue<T: BinaryFloatingPoint>() -> T? {
        return T(self ? 0 : 1)
    }
}
