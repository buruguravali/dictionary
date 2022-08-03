//
//  EndPoints.swift
//  DirectoryApp
//
//  Created by Ravali on 03/08/22.

import Foundation

struct EndPoint {
    static let baseUrl = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
}

enum Path: String {
    case rooms
    case people
}
