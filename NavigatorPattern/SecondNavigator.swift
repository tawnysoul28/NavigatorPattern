//
//  SecondNavigator.swift
//  NavigatorPattern
//
//  Created by Асанцев Владимир Дмитриевич on 07.09.2021.
//

/*
 (1) – тот vc на который собираемся перейти
 */

import UIKit

class SecondNavigator {
    
    private let navigationController: UINavigationController //здесь будет храниться навконтрол, который был создан MainNavigator_ом при создании.
    
    init() {
        let rootVC = UIStoryboard.vcById(Destinition.vc21.rawValue)
        navigationController = UINavigationController(rootViewController: rootVC)
        
        if let vc = rootVC as? SecondFlow {
            vc.navigator = self
        }
    }
}

extension SecondNavigator: BasicNavigation {
    func initialVC() -> UIViewController {
        return navigationController
    }
}

extension SecondNavigator: Navigator {
    enum Destinition: String {
        case vc21 = "2.1"
        case vc22 = "2.2"
        case vc23 = "2.3"
    }
    
    func show(_ destinition: Destinition) {
        let destVC = UIStoryboard.vcById(destinition.rawValue) //(1)
        navigationController.pushViewController(destVC, animated: true)
        
        if let vc = destVC as? SecondFlow {
            vc.navigator = self
        }
    }
}
