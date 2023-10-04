//
//  AnimationVC.swift
//  AnimationWithCocoaPods
//
//  Created by Евгений Лойко on 4.10.23.
//

import UIKit

final class AnimationVC: UIViewController {
    
    @IBOutlet private weak var coreAnimationView: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var coreAnimationBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCoreAnimationView()
    }
    
    @IBAction private func coreAnimationBtnAction(_ sender: UIButton) {
        sender.pulsate()
    }
    
    private func setupCoreAnimationView() {
        UIView.animate(withDuration: 0.8, delay: 0,
                       options: [.autoreverse, .repeat, .curveEaseIn]) { [weak self] in
            self?.coreAnimationView.frame.origin.y += 33
        }
    }
    
    private func setupUI() {
        coreAnimationView.layer.cornerRadius = 20
    }
}
