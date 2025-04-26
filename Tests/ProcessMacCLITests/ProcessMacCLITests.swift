//
//  ProcessMacCLITests.swift
//  ProcessMacCLI
//
//  Created by Radim  Chlad on 26.04.2025.
//
import XCTest
@testable import ProcessMacCLI

final class ProcessMacCLITests: XCTestCase {
    func testShell() throws {
        let outputString = "Hello, world!"
        let actual = shell("""
                echo \(outputString) | tr -d "\n"§
                """)
        let expected = outputString

        XCTAssertEqual(actual, expected)
    }
}
