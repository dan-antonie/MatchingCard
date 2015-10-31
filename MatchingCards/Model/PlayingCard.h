//
//  PlayingCard.h
//  MatchingCards
//
//  Created by Horatiu on 21/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property(strong,nonatomic) NSString *suit;
@property(nonatomic) NSUInteger *rank;
+(NSArray*) validSuits;
+(NSInteger) maxRank;
@end
