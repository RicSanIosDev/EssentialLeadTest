//
//  RemoteFeedLoadersTests.swift
//  EssentialFeedTests
//
//  Created by ricardo sanchez on 31/8/25.
//

import XCTest

class RemoteFeedLoaders {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }

}

class HTTPClient {
    static let shared = HTTPClient()

    private init() {}
    var requestedURL: URL?
}

final class RemoteFeedLoadersTests: XCTestCase {

    func test_init_doestNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoaders()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoaders()

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
