//
//  RemoteFeedLoadersTests.swift
//  EssentialFeedTests
//
//  Created by ricardo sanchez on 31/8/25.
//

import XCTest

class RemoteFeedLoaders {
    func load() {
        HTTPClient.shared.get(from: URL(string: "https://a-url.com")!)
    }

}

class HTTPClient {
    static var shared = HTTPClient()

    func get(from url: URL?) {}
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL?) {
        requestedURL = url
    }

    var requestedURL: URL?
}

final class RemoteFeedLoadersTests: XCTestCase {

    func test_init_doestNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoaders()

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoaders()

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
