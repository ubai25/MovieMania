//
//  APIConnectionTests.swift
//  MovieManiaTests
//
//  Created by Ahmad Ubaidillah on 13/07/21.
//

import XCTest
@testable import MovieMania

class APIConnectionTests: XCTestCase {
    let imagUrl = "https://www.themoviedb.org/t/p/w440_and_h660_face/jTswp6KyDYKtvC52GbHagrZbGvD.jpg"

    var apiConnection : APIConnection!
    
    override func setUp() {
        super.setUp()
        apiConnection = APIConnection()
    }
    
    override func tearDown() {
        apiConnection = nil
        super.tearDown()
    }
    
    func testUIImageFromUrl(){
        let image = apiConnection.load(path: imagUrl)
        
        XCTAssertNotNil(image)
    }

}
