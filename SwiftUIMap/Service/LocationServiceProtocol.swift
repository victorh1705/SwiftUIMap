//
//  LocationServiceProtocol.swift
//  SwiftUIMap
//
//  Created by Victor Henrique de Oliveira on 01/11/22.
//

import Foundation

protocol LocationServiceProtocol {
    func fetch() -> [Location]
}
