/// 
/// Copyright (c) 2012-2017 The ANTLR Project. All rights reserved.
/// Use of this file is governed by the BSD 3-clause license that
/// can be found in the LICENSE.txt file in the project root.
/// 

//
//  LookupDictionary.swift
//   antlr.swift
//
//  Created by janyou on 15/9/23.
//

import Foundation

public enum LookupDictionaryType: Int {
    case lookup = 0
    case ordered
}

public struct LookupDictionary {
    private var type: LookupDictionaryType
//    private var cache: HashMap<Int, [ATNConfig]> = HashMap<Int, [ATNConfig]>()
//
    private var cache: Dictionary<ATNConfig, ATNConfig> = Dictionary<ATNConfig, ATNConfig>()
    public init(type: LookupDictionaryType = LookupDictionaryType.lookup) {
        self.type = type
    }

    private func equal(_ lhs: ATNConfig, _ rhs: ATNConfig) -> Bool {
        if type == LookupDictionaryType.lookup {
            if lhs === rhs {
                return true
            }

            let same: Bool =
            lhs.state.stateNumber == rhs.state.stateNumber &&
                    lhs.alt == rhs.alt &&
                    lhs.semanticContext == rhs.semanticContext

            return same

        } else {
            //Ordered
            return lhs == rhs
        }
    }

        public mutating func getOrAdd(_ config: ATNConfig) -> ATNConfig {

            if let configList = cache[config] {
                return configList
            } else {
                cache[config] = config
            }

            return config

        }
    public var isEmpty: Bool {
        return cache.isEmpty
    }

    public func contains(_ config: ATNConfig) -> Bool {

        if let _ = cache[config] {
            return true
        }

        return false

    }
    public mutating func removeAll() {
        cache.removeAll()
    }

}




