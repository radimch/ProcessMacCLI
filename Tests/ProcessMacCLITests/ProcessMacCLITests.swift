//
//  ProcessMacCLITests.swift
//  ProcessMacCLI
//
//  Created by Radim  Chlad on 26.04.2025.
//
import XCTest
@testable import ProcessMacCLI


final class ProcessMacCLITests: XCTestCase {
    /**
      Tests if running echo some-text in shell return the same some-text
     */
    func testShellEcho() throws {
        let outputString = "Hello, world!"
        let actual = shell("""
                echo \(outputString) | tr -d "\n"§
                """)
        let expected = outputString

        XCTAssertEqual(actual, expected)
    }
    
    /**
      Test if ps aux returns eleven columns as expected
      % ps aux | head -n1
      USER               PID  %CPU %MEM      VSZ    RSS   TT  STAT STARTED      TIME COMMAND
      % ps aux | head -n1 | wc -w
      11
      ( The final tr -d "\n"$ removes trailing new line )
     */
    func testShellPsAux() throws {
        let expected = "11"
        let actual = shell("""
                 ps aux | head -n1 | wc -w | tr -d "\n"§
            """)
        
        XCTAssertEqual(actual, expected)
    }
}
