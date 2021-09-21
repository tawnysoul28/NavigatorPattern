//
//  MainNavigator.swift
//  NavigatorPattern
//
//  Created by Асанцев Владимир Дмитриевич on 07.09.2021.
//

/*
 (1) MainNavigator – должен быть ЕДИНСТВЕННЫМ главным навигатором и всегда жить в памяти. Singleton
 (2) переустановить стандартный виндов на наш виндов, в котором будет новый контроллер (мэйн контроллер)
 
 (3) в главном навигаторе нужно проинициализировать SecondNavigator и ThirdNavigator и соханить их в navigators. Это будет кол-во табов в таббаре.
 (4) берем навигаторы и преобразуем их в вьконтроллеры
 (5) установили преобразованные началтные контроллеры в таббар
 (6) достать вью контроллер по айдишнику из сториборда
 (7) вставили единичный контрол 1 первым в массиве контролов
 (8)
 (9)
 */

import UIKit

protocol BasicNavigation {
    func initialVC() -> UIViewController
}// чтобы мог общаться со своими "дочерними" навигаторами и спросить начальный контроллер для табов

protocol Navigator {
    associatedtype Destinition
    
    func show(_ destinition: Destinition)
} // необходим, чтобы сам контрол (2.1) сказал своему навигатору, в котором он находится "ало, перекинь меня с 2.1 на 2.2"

protocol BackNavigator: Navigator {
    func goBack()
} // необходим, чтобы с 3.2 вернуться на 3.1

class MainNavigator {
    
    static let shared = MainNavigator() //(1)
    
    let window: UIWindow //(2)
    let tabBar: UITabBarController
    private var navigators: [BasicNavigation] //(3)
    
    init() {
        window = UIWindow()
        tabBar = UITabBarController()
        
        navigators = [SecondNavigator(), ThirdNavigator()] //(3)
        
        var controllers = navigators.map({ $0.initialVC()}) //(4)
        let firstVC = UIStoryboard.vcById("1")
        controllers.insert(firstVC, at: 0) //(7)
        
        controllers.forEach { (controller) in
            let barItem = UITabBarItem(title: "title", image: nil, selectedImage: nil)
            controller.tabBarItem = barItem
        }
        
        
        tabBar.viewControllers = controllers //(5)
        
        window.rootViewController = tabBar
        window.makeKey() //сделать наш виндов ключевым
    }
}

extension UIStoryboard {
    static func vcById(_ id: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: id)
    } //(6)
}
