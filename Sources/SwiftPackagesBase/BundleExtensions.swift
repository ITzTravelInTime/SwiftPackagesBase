/*
 A Swift Library containing useful utilities code for Any Swift project.
 Copyright (C) 2022 Pietro Caruso

 This library is free software; you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation; either version 2.1 of the License, or (at your option) any later version.

 This library is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more details.

 You should have received a copy of the GNU Lesser General Public License along with this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 */

import Foundation

public extension Bundle {
    ///Gets the version for the current bundle
    var version: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    ///Gets the build number of the current bundle
    var build: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
    
    ///Gets the copyright string for the current bundle
    var copyright: String? {
        return infoDictionary?["NSHumanReadableCopyright"] as? String
    }
    
    ///Gets the name property for the current bundle
    var name: String? {
        return infoDictionary?["CFBundleName"] as? String
    }
}
