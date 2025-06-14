import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /// UIKit
//        let view: UIGlassEffect = .init()
//        view.isInteractive = true

        /// SwiftUI
        let swiftUIView = EllipsisView(items: Items.allCases)
        let hostingCtr = UIHostingController(rootView: swiftUIView)
        self.addChild(hostingCtr)
        self.view.addSubview(hostingCtr.view)
        hostingCtr.didMove(toParent: self)
        hostingCtr.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingCtr.view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            hostingCtr.view.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            hostingCtr.view.widthAnchor.constraint(equalToConstant: 320),
            hostingCtr.view.heightAnchor.constraint(equalToConstant: 320)
        ])
    }


}

