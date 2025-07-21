//
//  ViewController.swift
//  Observable_UIKit
//
//  Created by SHIRAISHI HIROYUKI on 2025/07/21.
//

import UIKit
import Observation

class ViewController: UIViewController {

    private var viewModel = AuthViewModel()

    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Hello, World!"
        label.textColor = .label
        label.font = .systemFont(ofSize: 36)
        label.textAlignment = .center
        label.backgroundColor = .red
        label.frame = .init(x: 20, y: 0, width: UIScreen.main.bounds.width - 40, height: 100)
        return label
    }()

    lazy var toggleButton: UISwitch = {
        let toggleButton = UISwitch()
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.isOn = false
        toggleButton.addTarget(self, action: #selector(didTapToggleButton(_:)), for: .valueChanged)
        return toggleButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(label)
        self.view.addSubview(toggleButton)

        NSLayoutConstraint.activate([
            toggleButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            toggleButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),

            label.topAnchor.constraint(equalTo: toggleButton.bottomAnchor, constant: 40),
            label.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppearが呼ばれた!!")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppearが呼ばれた!!")


    }
    override func updateProperties() {
        super.updateProperties()
        print("updatePropertiesが呼ばれた!!")
        label.text = "\(viewModel.isLoggedIn)"
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("viewDidLayoutSubviewsが呼ばれた!!")
        label.text = "\(viewModel.isLoggedIn)"
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("viewWillLayoutSubviewsが呼ばれた!!")
    }



    @objc func didTapToggleButton(_ sender: UISwitch) {
        /// https://dev.to/arshtechpro/wwdc-2025-whats-new-in-uikit-1kj4?utm_source=chatgpt.com
        viewModel.isLoggedIn = sender.isOn
    }

}

#Preview {
    ViewController()
}



@Observable
class AuthViewModel {
    var isLoggedIn: Bool = false
    var users: UsersResponse?

    init() {
        loadAuthData()
    }

    func loadAuthData() {
        Task {
            do {
                let urlStr = "https://dummyjson.com/users"
                try self.users =  await Service.shared.callApi(urlStr: urlStr, type: UsersResponse.self)
            } catch {
                print(error)
            }
        }
    }
}

struct AuthData {
    var isLoggedIn: Bool = false
}
