//
//  Dictionary+Extension.swift
//  extensions
//
//  Created by shota_todoroki on 2018/02/13.
//  Copyright © 2018 shota_todoroki. All rights reserved.
//

import Foundation

public extension Dictionary {

    struct DictionaryTryValueError: Error {
        public init() {}
    }

    func tryValue(key: Key, error: Error = DictionaryTryValueError()) throws -> Value {
        guard let value: Value = self[key] else {
            throw error
        }
        return value
    }

}
