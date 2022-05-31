/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

#if !os(watchOS) || swift(>=5.4)

import XCTest
@testable import SwiftPackagesBase

final class SwiftPackagesBaseTests: XCTestCase {
    
    //TODO: Add more exaustive tests
    
    func testArrays() throws{
        print("Array testing ...")
        
        XCTAssertEqual(["", "", "a", "b", "a", "", "c"].removingDuplicates(), ["", "a", "b", "c"], "Array duplicates test failed")
        
        XCTAssertEqual(["a", "b", "c"].stringList(), "a\nb\nc", "Array to string list test failed")
        
        XCTAssertEqual(["a", "b", "c"].stringLine(), "a b c", "Array to string line test failed")
        
        print("Array testing complete")
    }
    
    func testIntegerTesting() throws{
        print("Integer testing ...")
        
        XCTAssertEqual(0.boolValue(), false, "Integer to bool value conversion failure 1")
        
        XCTAssertEqual(1.boolValue(), true, "Integer to bool value conversion failure 2")
        
        XCTAssertNil(69.boolValue(), "Integer to bool value conversion failure 3")
        
        XCTAssertEqual(69.stringValue(), "69", "Integer to string value conversion failure")
        
        print("Integer testing complete")
    }
    
    func testRepresentableString() throws{
        print("RepresentableString testing ...")
        
        XCTAssertEqual("test".isString(), true, "String RepresentableString testing failed 1")
        
        XCTAssertEqual("test".stringValue(), "test", "String RepresentableString testing failed 2")
        
        XCTAssertEqual(Int(0).isString(), true, "Integer RepresentableString testing failed 1")
        
        XCTAssertEqual(Int(0).stringValue(), "0", "Integer RepresentableString testing failed 2")
        
        XCTAssertEqual(UInt(0).isString(), true, "Unsigned Integer RepresentableString testing failed 1")
        
        XCTAssertEqual(UInt(0).stringValue(), "0", "Unsigned Integer RepresentableString testing failed 2")
        
        print("RepresentableString testing complete")
    }
    
    func testRepresentableBool() throws{
        print("RepresentableBool testing ...")
        
        XCTAssertEqual("yes".boolValue(), true, "String RepresentableBool testing failed 1")
        
        XCTAssertEqual("no".boolValue(), false, "String RepresentableBool testing failed 2")
        
        XCTAssertEqual("true".boolValue(), true, "String RepresentableBool testing failed 3")
        
        XCTAssertEqual("false".boolValue(), false, "String RepresentableBool testing failed 4")
        
        XCTAssertEqual("Yes".boolValue(), true, "String RepresentableBool testing failed 5")
        
        XCTAssertEqual("nO".boolValue(), false, "String RepresentableBool testing failed 6")
        
        XCTAssertEqual("truE".boolValue(), true, "String RepresentableBool testing failed 7")
        
        XCTAssertEqual("faLse".boolValue(), false, "String RepresentableBool testing failed 8")
        
        XCTAssertEqual("0".boolValue(), false, "String RepresentableBool testing failed 9")
        
        XCTAssertEqual("1".boolValue(), true, "String RepresentableBool testing failed 10")
        
        XCTAssertNil("69".boolValue(), "String RepresentableBool testing failed 11")
        
        XCTAssertNil("ye".boolValue(), "String RepresentableBool testing failed 12")
        
        XCTAssertEqual("false".isBool(), true, "String RepresentableBool testing failed 13")
        
        XCTAssertEqual("faLse".isBool(), true, "String RepresentableBool testing failed 14")
        
        XCTAssertEqual("0".isBool(), true, "String RepresentableBool testing failed 15")
        
        XCTAssertEqual("1".isBool(), true, "String RepresentableBool testing failed 16")
        
        XCTAssertEqual("69".isBool(), false, "String RepresentableBool testing failed 17")
        
        XCTAssertEqual("ye".isBool(), false, "String RepresentableBool testing failed 12")
        
        
        
        print("RepresentableBool testing complete")
    }
    
    func testStrings() throws{
        print("Strings testing ...")
        
        XCTAssertEqual("aaaa----bbbbccc-----d".replaceFirst(of: "----", with: ""), "aaaabbbbccc-----d")
        
        XCTAssertEqual("aaaa----bbbbccc-----d".replaceAll(of: "----", with: ""), "aaaabbbbccc-d")
        
        XCTAssertEqual("aaaaabbbbbb".deletingPrefix("aaaa"), "abbbbbb")
        
        XCTAssertEqual("aaaaabbbbbb".deletingSuffix("bbb"), "aaaaabbb")
        
        XCTAssertEqual("aaaa----bbbbccc-----d".replaceFirst(of: "------", with: ""), "aaaa----bbbbccc-----d")
        
        XCTAssertEqual("aaaa----bbbbccc-----d".replaceAll(of: "------", with: ""), "aaaa----bbbbccc-----d")
        
        XCTAssertEqual("aaaaabbbbbb".deletingPrefix("fff"), "aaaaabbbbbb")
        
        XCTAssertEqual("aaaaabbbbbb".deletingSuffix("fff"), "aaaaabbbbbb")
        
        XCTAssertEqual("-69".isInt(), true)
        
        XCTAssertEqual("69".isInt(), true)
        
        XCTAssertEqual("aaaaabbbbcccxxxx".isInt(), false)
        
        XCTAssertEqual("-64".intValue() as Int?, -64)
        
        XCTAssertNil("aaabbbbccccdddxxxxwww".intValue() as Int?)
        
        XCTAssertEqual("-69".isUInt(), false)
        
        XCTAssertEqual("69".isUInt(), true)
        
        XCTAssertEqual("aaaaabbbbcccxxxx".isUInt(), false)
        
        XCTAssertEqual("64".uIntValue() as UInt?, 64)
        
        XCTAssertNil("-64".uIntValue() as UInt?)
        
        XCTAssertNil("aaabbbbccccdddxxxxwww".uIntValue() as UInt?)
        
        XCTAssertEqual("-69".isUInt64(), false)
        
        XCTAssertEqual("69".isUInt64(), true)
        
        XCTAssertEqual("aaaaabbbbcccxxxx".isUInt64(), false)
        
        XCTAssertEqual("64".uInt64Value() as UInt64?, 64)
        
        XCTAssertNil("-64".uInt64Value() as UInt64?)
        
        XCTAssertNil("aaabbbbccccdddxxxxwww".uInt64Value() as UInt64?)
        
        XCTAssertEqual("-69".isSInt(), true)
        
        XCTAssertEqual("69".isSInt(), true)
        
        XCTAssertEqual("aaaaabbbbcccxxxx".isSInt(), false)
        
        XCTAssertEqual("-64".sIntValue() as Int?, -64)
        
        XCTAssertNotNil("64".sIntValue() as Int?)
        
        XCTAssertNil("aaabbbbccccdddxxxxwww".sIntValue() as Int?)
        
        XCTAssertEqual("-69".isInt64(), true)
        
        XCTAssertEqual("69".isInt64(), true)
        
        XCTAssertEqual("aaaaabbbbcccxxxx".isInt64(), false)
        
        XCTAssertEqual("64".int64Value() as Int64?, 64)
        
        XCTAssertNotNil("-64".int64Value() as Int64?)
        
        XCTAssertNil("aaabbbbccccdddxxxxwww".int64Value() as Int64?)
        
        XCTAssertEqual("aaaabbbbcccc".contains("cc"), true)
        
        XCTAssertEqual("aaaabbbbcbc".contains("cc"), false)
        
        XCTAssertEqual("aaaaaaa69".isAlphanumeric, true)
        
        XCTAssertEqual("aaaaaaa69------".isAlphanumeric, false)
        
        XCTAssertEqual("aaaaaaaaaaa".copy(), "aaaaaaaaaaa")
        
        print("Strings testing complete")
    }
    
    func testSimulatableDetectable() throws{
        class Foo: SimulatableDetectable{

            ///if this property is nil the `actualStatus` property will be returned by the `status` propert, otherwise that will return the value of this property
            static var simulatedStatus: Bool? = nil
            
            ///Returns the actual status
            static func calculateStatus() -> Bool {
                return false
            }
            
            ///Initializer for compliance with the protocol
            public required init(){ }
            
        }
        
        XCTAssertEqual(Foo.status, false) //returns false
        XCTAssertEqual(Foo.actualStatus, false) //returns false

        Foo.simulatedStatus = true

        XCTAssertEqual(Foo.status, true) //returns true
        XCTAssertEqual(Foo.actualStatus, false) //returns false
    }
    
    /*
    func testAll() throws {
        try testArrays()
        try testIntegerTesting()
        try testStrings()
    }
     */
}

#endif
