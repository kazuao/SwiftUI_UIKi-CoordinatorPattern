//
//  FirstViewController.swift
//  CoordinatorProject
//
//  Created by kazunori.aoki on 2022/04/24.
//

import UIKit
import Combine

class FirstViewController: UIViewController {

    var infoLabel: UILabel?
    var viewModel: FirstTabViewModel!
    var showDetailRequested: () -> Void = {}

    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green

        setupInfoLabel()
        setupDetailButton()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        infoLabel?.text = "\(viewModel.name) with email \(viewModel.email)"
    }

    func setupDetailButton() {
        let button = UIButton(frame: CGRect(x: 100, y: 500, width: 200, height: 60))
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Go to Detail", for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)

        self.view.addSubview(button)
    }

    func setupInfoLabel() {
        let infoLabel = UILabel(frame: CGRect(x: 100, y: 300, width: 300, height: 60))
        infoLabel.text = "\(viewModel.name) with email \(viewModel.email)"
        self.view.addSubview(infoLabel)
        self.infoLabel = infoLabel

        viewModel.$email
            .combineLatest(viewModel.$name)
            .sink { [weak self] email, name in

                if name.count + email.count > 0 {
                    self?.infoLabel?.text = "\(name) with email \(email)"
                } else {
                    self?.infoLabel?.text = ""
                }

            }
            .store(in: &subscriptions)
    }

    @objc func buttonAction() {
        showDetailRequested()
    }
}
