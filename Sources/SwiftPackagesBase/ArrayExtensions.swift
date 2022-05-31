/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension Array where Element == String{
    
    ///Resturns the current array as a string, each element of the array is a new line on the string.
    func stringList() -> String{
        var ret = ""
        for r in self{
            ret += r + "\n"
        }
        
        if !ret.isEmpty{
            ret.removeLast()
        }
        
        return ret
    }
    
    ///Resturns the current array as a string, each element of the array is a added to the string and then separated from the previous ne with a space.
    func stringLine() -> String{
        var ret = ""
        for r in self{
            ret += r + " "
        }
        
        if !ret.isEmpty{
            ret.removeLast()
        }
        
        return ret
    }
    
}

public extension Array where Element: Equatable{
    ///Remves the duplicate elements from the array and returns it.
    ///The array items are ordered as they first appear.
    func removingDuplicates() -> Self{
        var ret = [Element]()
        
        for i in self{
            if !ret.contains(i){
                ret.append(i)
            }
        }
        
        return ret
    }
    
    ///Remves duplicate items from the current array and keeps only the first occurance of each one.
    mutating func removeDuplicates(){
        self = self.removingDuplicates()
    }
}
