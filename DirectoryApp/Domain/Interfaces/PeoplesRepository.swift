//
//  PeoplesRepository.swift
//  DirectoryApp
//
//  Created by Ravali on 03/08/22.
//

import Foundation

protocol PeoplesRepository {
   func getPeoples() async throws -> [PeopleRecord]
    func getImages(for url: String) async throws -> Data 
}

protocol ImageCacher {
    func getImage(url:String)-> Data?
    func saveImage(url:String, data:Data)
}
