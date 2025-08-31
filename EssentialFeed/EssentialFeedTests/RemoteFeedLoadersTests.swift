//
//  RemoteFeedLoadersTests.swift
//  EssentialFeedTests
//
//  Created by ricardo sanchez on 31/8/25.
//

import XCTest

class RemoteFeedLoaders {
    let client: HTTPClient

    init(client: HTTPClient) {
        self.client = client
    }

    func load() {
        client.get(from: URL(string: "https://a-url.com")!)
    }

}

protocol HTTPClient {
    func get(from url: URL?)
}

class HTTPClientSpy: HTTPClient {
    func get(from url: URL?) {
        requestedURL = url
    }

    var requestedURL: URL?
}

final class RemoteFeedLoadersTests: XCTestCase {

    func test_init_doestNotRequestDataFromURL() {
        let client = HTTPClientSpy()
        _ = RemoteFeedLoaders(client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoaders(client: client)

        sut.load()

        XCTAssertNotNil(client.requestedURL)
    }
}
