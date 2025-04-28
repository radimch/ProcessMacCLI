//
//  main.swift
//  ProcessManCLI
//
//  Created by Radim Chlad on 25.04.2025.
//

import Foundation
import AppKit

getProcesses()

func getProcesses() {
     /* Step 1 - retrieve list of processes from system:
     ps aux is standard BSD format, parsing only orig columns 1-4,9,10 and 11 (there may be spaces!)
     and converting it into 7 destination columns
     orig 1  -> col 1 is user
     orig 2  -> col 2 is PID - process id
     orig 3  -> col 3 is %CPU usage
     orig 4  -> col 4 is %MEM consumption
     orig 9  -> col 5 is start time (in very ugly format)
     orig 10 -> col 6 is time consumed by process
     orig 11 -> col 7 is command together with parameters that was run i.e. it may contain whitespaces -> need to be merged into single col.

     moreover quotes have to be removed (tr -d command) because we will save all values in quotes */
    let content = shell("""
             ps aux | awk 'NR >= 1 {
                 for (i = 1; i < 5; i++) {
                     printf "%s%s", $i, ","
                 }
                 for (i = 9; i < 11; i++) {
                     printf "%s%s", $i, ","
                 }
                 for (i = 11; i <= NF; i++) {
                     printf "%s%s", $i, (i==NF ? ORS : OFS)
                 }
             }' | tr -d '"'
        """)
    
    // retrieve current date and time with timezone in format YYYYmmdd-HHMMSS-ZONE
    let date = shell("""
        date "+%Y%m%d-%H%M%S-%Z"
    """).trimmingCharacters(in: .whitespacesAndNewlines)
    // retrieve name of the local machine
    let uname = shell("""
        uname -n
    """).trimmingCharacters(in: .whitespacesAndNewlines)

    // Step 2: Save to file to desktop
    let fileName = "\(date)-\(uname).csv"
    let fileManager = FileManager.default
    let desktopURL = fileManager.homeDirectoryForCurrentUser.appendingPathComponent("Desktop/\(fileName)")
    print("List of local processes will be saved to \(desktopURL)")
    do {
        try content.write(to: desktopURL, atomically: true, encoding: .utf8)
        print("✅ CSV saved to: \(desktopURL.path)")
        NSWorkspace.shared.open(desktopURL)
    } catch {
        print("❌ Failed to write \(desktopURL): \(error)")
    }
}
