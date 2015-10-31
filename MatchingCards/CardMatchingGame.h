//
//  CardMatchingGame.h
//  MatchingCards
//
//  Created by Horatiu on 29/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import "Deck.h"
#import <Foundation/Foundation.h>

@interface CardMatchingGame : NSObject
-(void)chooseCardAtIndex:(NSUInteger*)index;
-(Card*) cardAtIndex:(NSUInteger*)index;

// desinated initialiser
-(instancetype)initWithCardCount:(NSUInteger*)count andDeck:(Deck*) deck;
@property (nonatomic,readonly) NSInteger score;
@property (nonatomic) NSInteger numberOfCardsToMatch;
@end
