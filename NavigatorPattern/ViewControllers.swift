//
//  ViewController.swift
//  NavigatorPattern
//
//  Created by Асанцев Владимир Дмитриевич on 07.09.2021.
//

/*
 (1) таким образом вьюконтроллеры получат свой установленный навигатор (будут знать о сущесвовании навигатора) и смогут переходить на другие контролы
 */

import UIKit

class ViewController1: UIViewController {

}

class SecondFlow: UIViewController {
    weak var navigator: SecondNavigator? //(1)
}
class ViewController21: SecondFlow {
    
    @IBAction func next22(_ sender: Any) {
        navigator?.show(.vc22)
    }
    
}

class ViewController22: SecondFlow {
    @IBAction func next23(_ sender: Any) {
        navigator?.show(.vc23)
    }
    
}

class ViewController23: SecondFlow {

}

class ThirdFlow: UIViewController {
    weak var navigator: ThirdNavigator?
}

class ViewController31: ThirdFlow {
    @IBAction func next32(_ sender: Any) {
        navigator?.show(.vc32)
    }
    
    @IBAction func next33(_ sender: Any) {
        navigator?.show(.vc33)
    }
    
    
}

class ViewController32: ThirdFlow {
    @IBAction func goBack(_ sender: Any) {
        navigator?.goBack()
    }


    @IBAction func goto33(_ sender: Any) {
        navigator?.show(.vc33)
    }

}

class ViewController33: ThirdFlow {
    @IBAction func goToBack(_ sender: Any) {
        navigator?.goBack()
    }
    
}


