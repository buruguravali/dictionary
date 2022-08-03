//
//  RoomsViewStates.swift
//  DirectoryApp
//
//  Created by  Ravali on 03/08/22.
//

import Foundation

enum RoomsViewStates: Equatable {
    case showActivityIndicator
    case showRoomsView
    case showError(String)
    case none
}
