//
//  DataUtils.swift
//  Gears
//
//  Created by Candid Cod3r on 5/3/19.
//  Copyright (c) 2019 Candid Cod3r.
//

public struct DataUtils {
    public static func build<ModelType: Model>(from data: Data) -> ModelType? where ModelType: Codable {
        do {
            let result = try JSONDecoder().decode(ModelType.self, from: data)
            return result
        } catch {
            let jsonString = String(data: data, encoding: String.Encoding.utf8) ?? ""
            assertionFailure("Unable to parse json: \(jsonString) for type: \(ModelType.self)")
            return nil
        }
    }
}
