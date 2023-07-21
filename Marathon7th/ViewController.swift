//
//  ViewController.swift
//  Marathon7th
//
//  Created by Ilya Kosov on 21.07.2023.
//

import UIKit

class ViewController: UIViewController {
        
    lazy var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.contentInsetAdjustmentBehavior = .never
        s.delegate = self
        s.contentSize = .init(width: view.bounds.width, height: 1000)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    var imageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "Crazy_Frog"))
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    var imageHeight: CGFloat = 270
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        imageView.frame = .init(origin: .zero,
                                size: .init(width: UIScreen.main.bounds.size.width,
                                            height: imageHeight))
        
        scrollView.addSubview(imageView)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let newHeight = imageHeight - scrollView.contentOffset.y
        imageView.frame = CGRect(x: 0, y: scrollView.contentOffset.y,
                                 width: view.bounds.width, height: newHeight)
        
        let topInset = max(newHeight, imageHeight) - view.safeAreaInsets.top
        scrollView.verticalScrollIndicatorInsets = .init(top: topInset, left: 0, bottom: 0, right: 0)
    }

}

