//
// RandomAPITests.swift
// RandomAPITests
//
// Created by Ethan Allgaier on 1/27/26.
//
import XCTest

final class RandomAPITests: XCTestCase {
    let vm = ViewModel()
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    func testIsLongEnough() throws {
        vm.password = "fhdsajkff"
        XCTAssertTrue(vm.isLongEnough())
    }
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
}
