/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension FileManager{
    ///Returns if the file system is Case-Sensitive at the specified directry.
    func isCaseSensitive(atPath path: String) -> Bool {
#if os(Linux)
        return true //assumes true on linux
#else
        var sensitive = false
        let url = URL(fileURLWithPath: path)
        
        if let resourceValues = try? url.resourceValues(forKeys: [.volumeSupportsCaseSensitiveNamesKey]), let isCS = resourceValues.volumeSupportsCaseSensitiveNames{
            
            sensitive = isCS
            
        }
        return sensitive
#endif
    }
    
#if !os(Linux)
    ///Gets the size of the specified file
    func fileSize(atURL url: URL) -> Int?{
        do {
            let val = try url.resourceValues(forKeys: [.totalFileAllocatedSizeKey, .fileAllocatedSizeKey])
            return val.totalFileAllocatedSize ?? val.fileAllocatedSize
        } catch let err{
            print(err.localizedDescription)
            return nil
        }
    }
    
    ///Gets the size of the specified file
    func fileSize(path: String) -> Int?{
        let url = URL(fileURLWithPath: path)
        return fileSize(atURL: url)
    }
        
    ///Gets the size of the specified directry
    func directorySize(atURL url: URL) -> Int? {
        if let enumerator = self.enumerator(at: url, includingPropertiesForKeys: [.totalFileAllocatedSizeKey, .fileAllocatedSizeKey], options: [], errorHandler: { (_, error) -> Bool in
            print(error)
            return false
        }) {
            var bytes = 0
            for case let url_ as URL in enumerator {
                //bytes += url_.fileSize ?? 0
                bytes += fileSize(atURL: url_) ?? 0
            }
            return bytes
        } else {
            return nil
        }
    }
    
    ///Gets the size of the specified directry
    func directorySize(atPath path: String) -> Int? {
        let url = URL(fileURLWithPath: path)
        return directorySize(atURL: url)
    }
#endif
    
    
    private func itemExists(atPath path: String, mustBeDirectory: Bool) -> Bool {
        var isDirectory = ObjCBool(true)
        let exists = self.fileExists(atPath: path, isDirectory: &isDirectory)
        return exists && (isDirectory.boolValue == mustBeDirectory)
    }
    
    ///Checks if the specified directry exists
    @inline(__always) func directoryExists(atPath path: String) -> Bool {
        return itemExists(atPath: path, mustBeDirectory: true)
    }
    
    ///Checks if the specified directry exists
    @inline(__always) func directoryExists(atURL url: URL) -> Bool {
        return itemExists(atPath: url.path, mustBeDirectory: true)
    }
    
    ///Checks if the specified file exists
    @inline(__always) func fileExistsAndIsFile(atPath path: String) -> Bool {
        return itemExists(atPath: path, mustBeDirectory: false)
    }
    
    ///Checks if the specified file exists
    @inline(__always) func fileExistsAndIsFile(atURL url: URL) -> Bool {
        return itemExists(atPath: url.path, mustBeDirectory: false)
    }
    
    
}


