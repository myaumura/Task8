//
//  ViewController.swift
//  Task8
//
//  Created by Gusev Kirill on 23.11.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupScrollView()
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.setupNavBar()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
    }
    
    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.bounds.width, height: view.bounds.height * 1.5)
    }
}

extension UINavigationBar {
    func setupNavBar() {
        DispatchQueue.main.async { [unowned self] in
            guard let largeTitleClass = NSClassFromString("_UINavigationBarLargeTitleView") as? UIView.Type,
                  let largeTitleView = self.subviews.first(where: {
                      $0.isKind(of: largeTitleClass)
                  }) else { return }
            
            
            let avatarImage = UIImage(systemName: "person.crop.circle.fill")
            let imageView = UIImageView(image: avatarImage)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFill
            imageView.tintColor = .lightGray
            largeTitleView.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 36),
                imageView.heightAnchor.constraint(equalToConstant: 36),
                imageView.trailingAnchor.constraint(equalTo: largeTitleView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                imageView.bottomAnchor.constraint(equalTo: largeTitleView.bottomAnchor, constant: -6)
            ])
        }
    }
}
