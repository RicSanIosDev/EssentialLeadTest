//
//  RemoteFeedLoadersTests.swift
//  EssentialFeedTests
//
//  Created by ricardo sanchez on 31/8/25.
//

import XCTest

class RemoteLoaders {

}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoadersTests: XCTestCase {

    func test_init_doestNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteLoaders()

        XCTAssertNil(client.requestedURL)
    }

}
