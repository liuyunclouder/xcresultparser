//
//  CLIResultFormatter.swift
//  xcresult2text
//
//  Created by Alex da Franca on 02.06.21.
//

import Foundation

struct CLIResultFormatter: XCResultFormatting {
    private let cliStyle = CLIFormat()
    private let indentWidth = "  "
    
    func documentPrefix(title: String) -> String {
        return ""
    }
    var documentSuffix: String {
        return ""
    }
    var accordionOpenTag: String {
        return ""
    }
    var accordionCloseTag: String {
        return ""
    }
    var tableOpenTag: String {
        return ""
    }
    var tableCloseTag: String {
        return ""
    }
    var divider: String {
        return "-----------------\n"
    }
    func resultSummaryLine(_ item: String, failed: Bool) -> String {
        return color(for: failed) + indentWidth + item + cliStyle.reset
    }
    func resultSummaryLineWarning(_ item: String, hasWarnings: Bool) -> String {
        return warningColor(for: hasWarnings) + indentWidth + item + cliStyle.reset
    }
    func testConfiguration(_ item: String) -> String {
        return cliStyle.bold + item + cliStyle.reset
    }
    func testTarget(_ item: String, failed: Bool) -> String {
        return color(for: failed) + indentWidth + item + cliStyle.reset
    }
    func testClass(_ item: String, failed: Bool) -> String {
        return color(for: failed) + String(repeating: indentWidth, count: 2) + item + cliStyle.reset
    }
    func singleTestItem(_ item: String, failed: Bool) -> String {
        return singleItemColor(for: failed) + String(repeating: indentWidth, count: 3) + item + cliStyle.reset
    }
    func failedTestItem(_ item: String, message: String) -> String {
        return singleItemColor(for: true) + String(repeating: indentWidth, count: 3) + item + "\n" +
            String(repeating: indentWidth, count: 4) + message + cliStyle.reset
    }
    func codeCoverageTargetSummary(_ item: String) -> String {
        return indentWidth + cliStyle.bold + item + cliStyle.reset
    }
    func codeCoverageFileSummary(_ item: String) -> String {
        return String(repeating: indentWidth, count: 2) + item
    }
    func codeCoverageFunctionSummary(_ items: [String]) -> String {
        return String(repeating: indentWidth, count: 3) + items.joined(separator: " ")
    }
    
    // MARK: - Private
    
    // Red <-> Black
    private func color(for failure: Bool) -> String {
        return failure ? cliStyle.red: ""
    }
    // Yellow <-> Black
    private func warningColor(for failure: Bool) -> String {
        return failure ? cliStyle.yellow: ""
    }
    // Red <-> Green
    private func singleItemColor(for failure: Bool) -> String {
        return failure ? cliStyle.red: cliStyle.green
    }
}
