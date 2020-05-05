//
//  SwipeViewContainer.swift
//  SwipeAnimation
//
//  Created by Bhupendra Sharma on 05/05/20.
//  Copyright © 2020 Bhupendra. All rights reserved.
//

import UIKit

class SwipeViewContainer: UIView {
    
    var arrCards: [CardView] = [CardView]()
    var arrLoadedCards: [CardView] = [CardView]()
    var topView: CardView?
    var loadedCardIndex: Int = 0
    
    private func createCardView(at index: Int) -> CardView {
        let card = CardView.init(frame: CGRect.init(x: 10, y: 130, width: 200, height: 200))
        card.backgroundColor = .red
        return card
    }
    
    func createCards(arr: [Int]) {
        for index in 0..<arr.count {
            let card = createCardView(at: index)
            arrCards.append(card)
            
            arrLoadedCards.append(card)
        }
        
        
        for loadIndex in 0..<arrLoadedCards.count {
            let cardView = arrLoadedCards[loadIndex]
            if loadIndex > 0 {
                insertSubview(cardView, belowSubview: arrLoadedCards[loadIndex - 1])
            }
            else {
                addSubview(cardView)
            }
            addConstraiintsToCard(cardView: cardView)
            loadedCardIndex += 1
        }
    }
    
    private func addConstraiintsToCard(cardView: CardView) {
        cardView.translatesAutoresizingMaskIntoConstraints = false
        Constraints.leadingConstraint(control: cardView, parent: self, constant: 20)
        Constraints.trailingConstraint(control: cardView, parent: self, constant: -20)
        Constraints.topConstraint(control: cardView, parent: self, constant: 100)
        Constraints.bottomConstraint(control: cardView, parent: self, constant: -150)
    }

}
