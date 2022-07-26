/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

#if !os(Linux)
@available(macOS 10.15, iOS 13.0, watchOS 6.0, tvOS 13, *) extension RawRepresentable where Self:Identifiable{
    public var id: RawValue{
        return rawValue
    }
}

#if os(macOS)
import AppKit

public extension NSColor{
    ///Returns a random color
    static func random() -> Self{
        return .init(red: CGFloat(arc4random_uniform(UInt32(UInt8.max))), green: CGFloat(arc4random_uniform(UInt32(UInt8.max))), blue: CGFloat(arc4random_uniform(UInt32(UInt8.max))), alpha: 1)
    }
}

public extension CGColor{
    ///Returns a random color
    static func random() -> CGColor{
        return NSColor.random().cgColor
    }
}
#else
import UIKit

public extension UIColor{
    ///Returns a random color
    static func random() -> Self{
        return .init(red: CGFloat(arc4random_uniform(UInt32(UInt8.max))), green: CGFloat(arc4random_uniform(UInt32(UInt8.max))), blue: CGFloat(arc4random_uniform(UInt32(UInt8.max))), alpha: 1)
    }
}

public extension CGColor{
    ///Returns a random color
    static func random() -> CGColor{
        return UIColor.random().cgColor
    }
}
#endif

#endif
