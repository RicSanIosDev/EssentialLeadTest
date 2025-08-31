//
//  RemoteFeedLoadersTests.swift
//  EssentialFeedTests
//
//  Created by ricardo sanchez on 31/8/25.
//

import XCTest

class RemoteFeedLoaders {
    let client: HTTPClient
    let url: URL

    init(url: URL, client: HTTPClient) {
        self.client = client
        self.url = url
    }

    func load() {
        client.get(from: url)
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
        let url = URL(string: "http://a-url.com")!
        let client = HTTPClientSpy()
        _ = RemoteFeedLoaders(url: url, client: client)

        XCTAssertNil(client.requestedURL)
    }

    func test_load_requestDataFromURL() {
        let url = URL(string: "http://a-given-url.com")!
        let client = HTTPClientSpy()
        let sut = RemoteFeedLoaders(url: url, client: client)

        sut.load()

        XCTAssertEqual(client.requestedURL, url)
    }
}
