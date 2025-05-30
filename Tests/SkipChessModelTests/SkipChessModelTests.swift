// SPDX-License-Identifier: GPL-2.0-or-later

#if !SKIP
import Testing
import OSLog
import Foundation
import SkipBridge
import ChessKit
import Stockfish
@testable import SkipChessModel

let logger: Logger = Logger(subsystem: "SkipChessModel", category: "Tests")

@Test func testSkipChessModel() async throws {
    let stream = StockfishEngine.start()
    defer {
        StockfishEngine.stop()
    }

    var iterator = stream.makeAsyncIterator()
    await #expect(iterator.next() == "Stockfish 16 by the Stockfish developers (see AUTHORS file)")


    //FenSerialization.default.serialize(position: Position(board: <#T##Board#>, state: <#T##Position.State#>, counter: <#T##Position.Counter#>))

}
#endif
