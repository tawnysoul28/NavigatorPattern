//
//  ThirdNavigator.swift
//  NavigatorPattern
//
//  Created by Асанцев Владимир Дмитриевич on 07.09.2021.
//

/*
 (1) могут отображаться разные вьюконтроллеры
 (2) "текущий контроллер" обновился после появления его на экране
 (3) взяли вьюконтр, который запрезенитл этот контролер
 */

import UIKit

class ThirdNavigator {
    
    private var currentVC: UIViewController //(1)
//    private let initialController: UIViewController
    
    init() {
        currentVC = UIStoryboard.vcById(Destinition.vc31.rawValue)
//        initialController = currentVC
        
        if let vc = currentVC as? ThirdFlow {
            vc.navigator = self
        }
    }
}

extension ThirdNavigator: BasicNavigation {
    func initialVC() -> UIViewController {
        return currentVC
    }
}

extension ThirdNavigator: BackNavigator {
    
    enum Destinition: String {
        case vc31 = "3.1"
        case vc32 = "3.2"
        case vc33 = "3.3"
    }
    
    func show(_ destinition: Destinition) {
        /*
         если бы контрлы отображались не модально, то нужно написать switch. И при destinition == 3.4, то пушим, иначе презентим.
         */
        
        let destVC = UIStoryboard.vcById(destinition.rawValue)
        if let vc = destVC as? ThirdFlow {
            vc.navigator = self
        }
        currentVC.present(destVC, animated: true) { [weak self] in
            self?.currentVC = destVC //(2)
        }
    }
    
    func goBack() {
        if let parentVC = currentVC.presentingViewController {
            currentVC.dismiss(animated: true) { [weak self] in
                self?.currentVC = parentVC
            }
        } //(3)
    }
    
}

