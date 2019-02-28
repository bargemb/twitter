//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by Mayur Barge on 2/21/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContent: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    var favourited:Bool = false
    var tweetId:Int = -1
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setFavourite(_ isFavourited:Bool){
        favourited = isFavourited
        if (favourited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    @IBAction func favouriteTweet(_ sender: Any) {
        let toBeFavorited = !favourited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavourite(true)
            }, failure: { (error) in
                print("Favorite did not succeed \(error )")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavourite(false)
            }, failure: { (error) in
                print("Unfavorite did not succeed \(error )")
            })
        }
    }
    @IBAction func retweet(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
