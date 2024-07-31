//
//  File.swift
//  
//
//  Created by Greem on 7/31/24.
//

import Foundation

extension Collection{
    public func asyncForEach(_ body: (Element) async throws -> Void) async rethrows {
        for t in self{
            try await body(t)
        }
    }
    public func asyncMap<T>(_ transform: (Element) async throws -> T) async rethrows -> [T] {
        var arr: [T] = []
        for t in self{
            let res = try await transform(t)
            arr.append(res)
        }
        return arr
    }
    
    public func filter(_ isIncluded: (Element) async throws -> Bool) async rethrows -> [Element] {
        var arr:[Element] = []
        for t in self{
            let res = try await isIncluded(t)
            if res{
                arr.append(t)
            }
        }
        return arr
    }
    public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) async throws -> ()) async rethrows -> Result {
        var res = initialResult
        for t in self{
            try await updateAccumulatingResult(&res,t)
        }
        return res
    }
    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) async throws -> Result) async rethrows -> Result {
        var res = initialResult
        for t in self{
            res = try await nextPartialResult(res,t)
        }
        return res
    }
}
