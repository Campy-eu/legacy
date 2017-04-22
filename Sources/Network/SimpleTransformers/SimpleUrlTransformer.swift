//
// SimpleUrlTransformer
// EE Utilities
//
// Copyright (c) 2015 Eugene Egorov.
// License: MIT, https://github.com/eugeneego/utilities-ios/blob/master/LICENSE
//

import Foundation

public struct SimpleUrlTransformer: SimpleTransformer {
    public typealias T = URL

    public func from(any value: Any?) -> T? {
        return (value as? String).flatMap(T.init)
    }

    public func to(any value: T?) -> Any? {
        return value?.absoluteString
    }
}
