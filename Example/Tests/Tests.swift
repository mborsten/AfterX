import UIKit
import XCTest
import AfterX

class Tests: XCTestCase {

    private let onceTask = "once"
    private let onceAfterTask = "once_after"

    override func setUp() {
        super.setUp()
        AfterX.resetAll()
    }
    
    override func tearDown() {

        AfterX.resetAll()
        super.tearDown()
    }
    
    func testOnceFireFirstTime() {
        var didOnce = false

        AfterX.doOnce(task: onceTask) { 
            didOnce = true
        }
        XCTAssertTrue(didOnce)
    }

    func testOnceDoesntFireSecondTime() {
        var didOnce = false

        AfterX.doOnce(task: onceTask) {
            didOnce = true
        }
        XCTAssertTrue(didOnce)

        didOnce = false

        AfterX.doOnce(task: onceTask) { 
            didOnce = true
        }

        XCTAssertFalse(didOnce)
    }

    func testDoOnceAfter() {


    }
}
