/// 
/// Copyright (c) 2012-2017 The ANTLR Project. All rights reserved.
/// Use of this file is governed by the BSD 3-clause license that
/// can be found in the LICENSE.txt file in the project root.
/// 

//
//  LookupATNConfig.swift
//  objc2swiftwithswith
//
//  Created by janyou on 15/9/22.
//

import Foundation

public class LookupATNConfig: Hashable {

    public let config: ATNConfig
    public init(_ old: ATNConfig) {
        // dup
        config = old
    }

    public func hash(into hasher: inout Hasher) {
        7.hash(into: &hasher)
        config.hash(into: &hasher)
    }

}

public func ==(lhs: LookupATNConfig, rhs: LookupATNConfig) -> Bool {


    if lhs.config === rhs.config {
        return true
    }

    if (lhs is OrderedATNConfig) && (rhs is OrderedATNConfig) {
        return lhs.config == rhs.config
    }


    let same: Bool =
    lhs.config.state.stateNumber == rhs.config.state.stateNumber &&
            lhs.config.alt == rhs.config.alt &&
            lhs.config.semanticContext == rhs.config.semanticContext

    return same

}
