// SPDX-License-Identifier: GPL-2.0-or-later

import XCTest
import OSLog
import Foundation
import SkipBridge
@testable import SkipChessModel

let logger: Logger = Logger(subsystem: "SkipChessModel", category: "Tests")

@available(macOS 13, *)
final class SkipChessModelTests: XCTestCase {
    override func setUp() {
        #if os(Android)
        // needed to load the compiled bridge from the transpiled tests
        loadPeerLibrary(packageName: "skip-chess", moduleName: "SkipChessModel")
        #endif
    }

    func testSkipChessModel() throws {
        logger.log("running testSkipChessModel")
        XCTAssertEqual(1 + 2, 3, "basic test")
    }

    func testViewModel() async throws {
        let vm = ViewModel()
        vm.items.append(Item(title: "ABC"))
        XCTAssertFalse(vm.items.isEmpty)
        XCTAssertEqual("ABC", vm.items.last?.title)

        vm.clear()
        XCTAssertTrue(vm.items.isEmpty)
    }

}
