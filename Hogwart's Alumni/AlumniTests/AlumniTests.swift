
import XCTest
@testable import Alumni

class AlumniTests: XCTestCase {
    func test_init_willCallAPIOnce() {
        // Setup
        let doubleApi = APISpy()
        let sut = ViewController(api: doubleApi as AlumniApi)

        // Exercise
        sut.loadViewIfNeeded()

        // Verify
        XCTAssertEqual(doubleApi.apiCalls, 1, "A API deve ser chamada uma só vez")

        // Teardown
    }
}
