//
//  VPS.swift
//
//  Copyright (c) 2016, OVH SAS.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//
//  * Redistributions of source code must retain the above copyright
//  notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright
//  notice, this list of conditions and the following disclaimer in the
//  documentation and/or other materials provided with the distribution.
//  * Neither the name of OVH SAS nor the
//  names of its contributors may be used to endorse or promote products
//  derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY OVH SAS AND CONTRIBUTORS ``AS IS'' AND ANY
//  EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
//  DISCLAIMED. IN NO EVENT SHALL OVH SAS AND CONTRIBUTORS BE LIABLE FOR ANY
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
//  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
//  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
//  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
//  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

import Foundation

enum VPSState: String {
    case running, stopped, unknown
}

struct VPS {
    
    // MARK: - Properties
    
    let name: String?
    let displayName: String?
    let state: VPSState?
    var busy: Bool
    
    
    // MARK: - Build a VPS struct
    static func VPSFromWatchRepresentation(_ representation: [String:AnyObject]) -> VPS {
        var vpsName: String?
        if let name = representation["name"] as? String {
            vpsName = name
        }
        
        var vpsDisplayName: String?
        if let displayName = representation["displayName"] as? String {
            vpsDisplayName = displayName
        }
        
        let vpsState = representation["state"] as! String
        let vpsBusy = representation["busy"] as! Bool
        
        return VPS(name: vpsName, displayName: vpsDisplayName, state: VPSState(rawValue: vpsState), busy: vpsBusy)
    }
}
