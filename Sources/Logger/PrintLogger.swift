//
// PrintLogger
// Legacy
//
// Copyright (c) 2016 Eugene Egorov.
// License: MIT, https://github.com/eugeneego/legacy/blob/master/LICENSE
//

import Foundation

/// Simple print logger. Output is similar to NSLogLogger, but does not have its limitations. Output goes to stdout.
public class PrintLogger: Logger {
    private let dateFormatter: DateFormatter

    public init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS ZZZZZ"
    }

    private func name(for level: LoggingLevel) -> String {
        switch level {
            case .verbose:
                return "💬️"
            case .debug:
                return "🔬"
            case .info:
                return "🌵"
            case .warning:
                return "🖖"
            case .error:
                return "⛑"
        }
    }

    public func log(
        _ message: @autoclosure () -> String,
        meta: @autoclosure () -> [String: String],
        level: LoggingLevel,
        tag: String,
        function: String
    ) {
        print("\(dateFormatter.string(from: Date())) \(name(for: level)) \(tag)\(function.isEmpty ? "" : ".\(function)") \(message())")
    }
}
