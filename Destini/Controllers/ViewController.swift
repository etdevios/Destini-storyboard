//
//  ViewController.swift
//  Destini
//
//  Created by Eduard Tokarev on 22.02.2023.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var storyLabel: UILabel!
    @IBOutlet private weak var choice1Button: UIButton!
    @IBOutlet private weak var choice2Button: UIButton!
    
    private var storyBrain = StoryBrain()

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    @IBAction private func choiceMade(_ sender: UIButton) {
        if let userAnswer = sender.currentTitle {
            storyBrain.nextStory(userAnswer)
            updateUI()
        }
    }
    
    private func updateUI() {
        storyLabel.text = storyBrain.getStoryTitle()
        setEdgeInsets(for: [choice1Button, choice2Button])
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
    
    private func setEdgeInsets(for choiceButton: [UIButton]) {
        choiceButton.forEach { item in
            item.contentEdgeInsets = UIEdgeInsets(
                top: 16,
                left: 16,
                bottom: 16,
                right: 16
            )
        }
    }
}

