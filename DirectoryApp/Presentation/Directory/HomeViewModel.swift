//
//  HomeViewModel.swift
//  DirectoryApp
//
//  Created by Ravali on 03/08/22.
//

import Foundation

protocol HomeViewModelOutput {
    var numberOfItems: Int { get }
    func getTitle(for index:Int)-> String
}

final class HomeViewModel: HomeViewModelOutput {
    
    let directoreis: [String] = [NSLocalizedString("peoples", comment: ""), NSLocalizedString("rooms", comment: "")]
    
    var numberOfItems: Int {
        return directoreis.count
    }
    
    func getTitle(for index:Int)-> String {
        return directoreis[index]
    }
    
}
