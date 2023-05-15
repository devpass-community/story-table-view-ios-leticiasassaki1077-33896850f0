import XCTest
import SnapshotTesting
@testable import EvercodeApp

final class MainViewSnapshotTests: XCTestCase {

    func testMainView() throws {
        
        let mainView = MainView()
        mainView.updateView(items: ["List Item 1", "List Item 2", "List Item 3"])
        assertSnapshot(matching: mainView, as: .image(size: CGSize(width: 300, height: 500)))
    }
}
