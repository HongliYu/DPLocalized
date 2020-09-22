import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DPLocalizedDemoTests.allTests),
    ]
}
#endif
