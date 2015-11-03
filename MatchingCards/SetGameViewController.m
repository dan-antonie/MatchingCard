//
//  SetGameViewController.m
//  MatchingCards
//
//  Created by Horatiu on 02/11/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import "SetDeck.h"
#import "CardMatchingGame.h"
#import "SetGameViewController.h"

@interface SetGameViewController ()
@property (nonatomic, strong  )  CardMatchingGame *game;
@end

@implementation SetGameViewController
@synthesize game;
-(CardMatchingGame*) game{
    if(!game){
        game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] andDeck:[self createDeck]];
    }
    game.numberOfCardsToMatch = 3  ;
    return game;
}


-(Deck*) createDeck
{
    return [[SetDeck alloc]init];
}








-(NSAttributedString*)titleForCard:(SetCard*) card
{
    NSMutableAttributedString *content = [[NSMutableAttributedString alloc]initWithString:card.shape];
    if (card.number == 2) {
        [content appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        [content appendAttributedString:[[NSAttributedString alloc] initWithString:card.shape]];
    }
    if (card.number == 3) {
        [content appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        [content appendAttributedString:[[NSAttributedString alloc] initWithString:card.shape]];
        [content appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
        [content appendAttributedString:[[NSAttributedString alloc] initWithString:card.shape]];
    }
    
   
    
    return card.isChosen ? content : [[NSAttributedString alloc] initWithString:@""];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
