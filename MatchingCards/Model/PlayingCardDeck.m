//
//  PlayingCardDeck.m
//  MatchingCards
//
//  Created by Horatiu on 21/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import "PlayingCard.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardDeck
-(instancetype) init
{
    self=[super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits ] ) {
            for (int rank=1; rank<[PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            
        }
                }
    }
    return self;

}
@end
