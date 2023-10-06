//
//  AnimationVC.swift
//  AnimationWithCocoaPods
//
//  Created by Евгений Лойко on 4.10.23.
//

import UIKit
import Lottie

final class AnimationVC: UIViewController {
    
    @IBOutlet private weak var coreAnimationLbl: UILabel!
    @IBOutlet private weak var coreAnimationView: UIView!
    @IBOutlet private weak var stackView: UIStackView!
    @IBOutlet private weak var coreAnimationBtn: UIButton!
    
    private var lottieAnimationView: LottieAnimationView!
    private let jsonArray = ["cat-head", "confetti", "home", "rugby-ball", "target"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCoreAnimationView()
        setupLottieAnimationView()
    }
    
    @IBAction private func coreAnimationBtnAction(_ sender: UIButton) {
        sender.pulsate()
        coreAnimationLbl.pulsate()
    }
    
    @IBAction private func lottieAnimationBtnAction(_ sender: UIButton) {
        sender.pulsate()
        lottieAnimationView.play { completed in
            print("Lottie animation completed")
        }
    }
    
    private func setupCoreAnimationView() {
        coreAnimationView.layer.cornerRadius = 20
        UIView.animate(withDuration: 0.8, delay: 0,
                       options: [.autoreverse, .repeat, .curveEaseIn]) { [weak self] in
            self?.coreAnimationView.frame.origin.y += 33
        }
    }
    
    private func setupLottieAnimationView() {
        guard let randomJson = jsonArray.randomElement() else { return }
        lottieAnimationView = .init(name: randomJson)
        lottieAnimationView.backgroundColor = #colorLiteral(red: 0.9057577848, green: 0.4593967199, blue: 0, alpha: 1)
        lottieAnimationView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        lottieAnimationView.layer.cornerRadius = 20
        UIView.animate(withDuration: 0.8, delay: 0,
                       options: [.autoreverse, .repeat, .curveEaseIn]) { [weak self] in
            self?.lottieAnimationView.frame.origin.y -= 33
        }
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .playOnce
        lottieAnimationView.animationSpeed = 0.8
        stackView.addArrangedSubview(lottieAnimationView)
    }
}
