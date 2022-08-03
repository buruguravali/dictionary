//
//  PeopleViewStates.swift
//  DirectoryApp
//
//  Created by Ravali on 03/08/22.

import Foundation

enum PeopleViewStates: Equatable {
    case showActivityIndicator
    case showPeopleView
    case showError(String)
    case none
}
