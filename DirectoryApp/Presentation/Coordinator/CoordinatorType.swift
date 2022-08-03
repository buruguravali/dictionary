//
//  CoordinatorType.swift
//  DirectoryApp
//
//  Created by  Ravali on 03/08/22.
//

import Foundation
import UIKit

protocol CoordinatorType: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}
