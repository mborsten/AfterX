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

    func testResetAll() {

        XCTAssertTrue( AfterX.doOnce(task: "reset_all_1", block: {}) )
        XCTAssertFalse( AfterX.doOnce(task: "reset_all_1", block: {}) )

        XCTAssertTrue( AfterX.doOnce(task: "reset_all_2", block: {}) )
        XCTAssertFalse( AfterX.doOnce(task: "reset_all_2", block: {}) )

        AfterX.resetAll()

        XCTAssertTrue( AfterX.doOnce(task: "reset_all_1", block: {}) )
        XCTAssertTrue( AfterX.doOnce(task: "reset_all_2" , block: {}) )

    }

    func testResetOne() {

        XCTAssertTrue( AfterX.doOnce(task: "reset_one_1", block: {}) )
        XCTAssertFalse( AfterX.doOnce(task: "reset_one_1", block: {}) )

        XCTAssertTrue( AfterX.doOnce(task: "reset_one_2", block: {}) )
        XCTAssertFalse( AfterX.doOnce(task: "reset_one_2", block: {}) )

        AfterX.resetCount(forTask: "reset_one_1")

        XCTAssertTrue( AfterX.doOnce(task: "reset_one_1", block: {}) )
        XCTAssertFalse( AfterX.doOnce(task: "reset_one_2" , block: {}) )

    }

    func testEphemeral() {

        XCTAssertFalse(AfterX.checkEphemeral(task: "task_1"))

        AfterX.setupEphemeral(task: "task_1")

        XCTAssertTrue(AfterX.checkEphemeral(task: "task_1"))
        XCTAssertFalse(AfterX.checkEphemeral(task: "task_1"))

    }

}
