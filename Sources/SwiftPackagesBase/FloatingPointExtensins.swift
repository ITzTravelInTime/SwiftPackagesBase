/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension Representable where Self:BinaryFloatingPoint{
    
    @inline(__always) func intValue<T: FixedWidthInteger>() -> T?{
        return T(exactly: self.rounded())
    }
    
    @inline(__always) func uIntValue<T: UnsignedInteger & FixedWidthInteger>() -> T?{
        return T(exactly: self.rounded())
    }
    
    @inline(__always) func floatingPointValue<T: BinaryFloatingPoint>() -> T? {
        return T(self)
    }
}

extension Float: Representable{}
extension Double: Representable{}
extension Float80: Representable{}
