//
//  ViewController.swift
//  Native Avatar
//
//  Created by Николай Игнатов on 24.07.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
        imageView.tintColor = .systemGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: view.bounds.width, height: 1500)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupView()
        setupConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupAvatar()
    }
    
    private func setupNavigationBar() {
        title = "Avatar"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func setupAvatar() {
        guard let titleView = navigationController?.navigationBar.subviews.first(where: { $0.description.contains("UINavigationBarLargeTitleView") }) else { return }
        
        titleView.addSubview(avatarImageView)

        NSLayoutConstraint.activate([
            avatarImageView.trailingAnchor.constraint(equalTo: titleView.trailingAnchor, constant: -10),
            avatarImageView.bottomAnchor.constraint(equalTo: titleView.bottomAnchor, constant: -10),
            avatarImageView.widthAnchor.constraint(equalToConstant: 36),
            avatarImageView.heightAnchor.constraint(equalToConstant: 36)
        ])
    }
}
