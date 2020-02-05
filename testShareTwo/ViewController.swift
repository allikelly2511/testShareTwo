//
//  ViewController.swift
//  testShareTwo
//
//  Created by  on 2/5/20.
//  Copyright © 2020 Appsorama. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sharingImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sharedPressed(_ sender: UIButton) {
        if let storiesUrl = URL(string: "instagram-stories://share"){
            if UIApplication.shared.canOpenURL(storiesUrl) {
                guard let image = sharingImage.image else { return }
                guard let imageData = image.pngData() else { return }
                let pasteboardItems: [String: Any] = [
                    "com.instagram.sharedSticker.stickerImage": imageData,
                    "com.instagram.sharedSticker.backgroundTopColor": "#1dd1a1",
                    "com.instagram.sharedSticker.backgroundBottomColor": "#1dd1a1"
                ]
                let pasteboardOptions = [
                    UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
                ]
                UIPasteboard.general.setItems([pasteboardItems], options: pasteboardOptions)
                UIApplication.shared.open(storiesUrl, options: [:], completionHandler: nil)
            } else {
                print("User doesn't have Instagram on their device :( #loser")
            }
        }
    }
    
}

