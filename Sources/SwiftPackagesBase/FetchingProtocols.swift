/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

///Generic protocol for fetching values
public protocol FetchProtocol{
    static func getString(_ : String) -> String?
    static func getInteger<T: FixedWidthInteger>(_ : String) -> T?
    static func getBool(_ : String) -> Bool?
}

///Adds data fetching to `FetchProtocol`
public protocol FetchProtocolData: FetchProtocol{
    static func getData(_ : String) -> Data?
}

///Automates the fetching of bool values from integers
public protocol FetchProtocolBoolFromInt: FetchProtocol{}

public extension FetchProtocolBoolFromInt{
    ///Gets a `Bool` value
    static func getBool(_ valueName: String) -> Bool?{
        let res: Int? = Self.getInteger(valueName)
        return res?.boolValue()
    }
}

///Adds automated bool fetching to `FetchProtocolData`
public protocol FetchProtocolDataBoolFromInt: FetchProtocolData{}

///Generic protocol for fetching values
public protocol FetchProtocolInstance{
    func getString(_ valueName: String) -> String?
    func getInteger<T: FixedWidthInteger>(_ valueName: String) -> T?
    func getBool(_ valueName: String) -> Bool?
}

///Adds data fetching to `FetchProtocolInstance`
public protocol FetchProtocolDataInstance: FetchProtocolInstance{
    func getData(_ : String) -> Data?
}

///Automates the fetching of bool values from integers
public protocol FetchProtocolBoolFromIntInstance: FetchProtocolInstance{}

public extension FetchProtocolBoolFromIntInstance{
    ///Gets a `Bool` value
    func getBool(_ valueName: String) -> Bool?{
        let res: Int? = self.getInteger(valueName)
        return res?.boolValue()
    }
}

///Adds automated bool fetching to `FetchProtocolDataInstance`
public protocol FetchProtocolDataBoolFromIntInstance: FetchProtocolDataInstance{}
