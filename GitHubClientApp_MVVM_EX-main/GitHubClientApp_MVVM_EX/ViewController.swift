//
//  ViewController.swift
//  GitHubClientApp_MVVM_EX
//
//  Created by SHIRAISHI HIROYUKI on 2022/03/07.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        API().getUser { result in
            print(result)
        }
        // Do any additional setup after loading the view.
    }


}

