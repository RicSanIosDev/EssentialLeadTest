//
//  HTTPClient.swift
//  EssentialFeed
//
//  Created by ricardo sanchez on 4/9/25.
//


import Foundation

public enum HTTPClientResult {
    case success(Data, HTTPURLResponse)
    case failure(Error)
}

public protocol HTTPClient {
    func get(from url: URL, completion: @escaping (HTTPClientResult) -> Void)
}
