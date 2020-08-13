//
//  Animator.swift
//  Mixer
//
//  Created by Franklin Byaruhanga on 12/08/2020.
//  Copyright © 2020 Franklin Byaruhanga. All rights reserved.
//

import UIKit


public struct Animator {
    let objectAnimator = UIViewPropertyAnimator(duration: 2, curve: .linear)
}

public extension Animator {
    func addRotationAnimation(to view: UIView, with angleSize:CGFloat = CGFloat.pi) {
        objectAnimator.addAnimations {
            view.center = CGPoint(x: 40, y: 40)
            view.transform = .init(rotationAngle: angleSize)
        }
    }


    func addresizeAnimation(to view: UIView,with scaleSize: CGFloat = 6) {
        objectAnimator.addAnimations {
            view.center = CGPoint(x: 40, y: 40)
            view.transform = .init(scaleX: scaleSize, y: scaleSize)
        }
    }


    func addMoveAnimation(to view: UIView) {
        objectAnimator.addAnimations {
            view.transform = .init(translationX: 256, y: 256)
            view.center = CGPoint(x: 250, y: 250)
        }
    }

    func resetAnimatedView(to view: UIView) {
        view.transform = .identity
    }
}

public extension Animator {
    func startAnimations(in view: UIView, when isMenuOpened: Bool) {
        if !isMenuOpened {
            objectAnimator.startAnimation()

            objectAnimator.addCompletion { _ in
                let reversePropertyAnimator = UIViewPropertyAnimator(duration: 2, curve: .linear)
                reversePropertyAnimator.addAnimations {
                    self.resetAnimatedView(to: view)
                }
                reversePropertyAnimator.startAnimation()
            }
        }
    }
}


