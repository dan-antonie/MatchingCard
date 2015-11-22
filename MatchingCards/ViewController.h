//
//  ViewController.h
//  MatchingCards
//
//  Created by Horatiu on 21/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic) NSInteger numberOfCardsInPlay;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) CardMatchingGame *game;
@property (nonatomic) NSInteger numberOfCardsToBeMatched;
@property (weak, nonatomic) IBOutlet UITextView *gameLog;
@property (strong,nonatomic) Card *tempCard;
@property (strong,nonatomic) NSMutableAttributedString *gameHistory;
@end

