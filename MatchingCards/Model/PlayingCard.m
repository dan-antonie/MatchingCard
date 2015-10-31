//
//  PlayingCard.m
//  MatchingCards
//
//  Created by Horatiu on 21/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
-(int)match:(NSArray*)otherCards{
    int score = 0;
   /* if ([otherCards count]) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (otherCard.rank == self.rank) {
            score = 4;
        } else if (otherCard.suit == self.suit) {
            score = 1;
        }
    }*/
    for (PlayingCard *otherCard in otherCards) {
        if (otherCard.rank == self.rank) {
            score += 4;
        } else if (otherCard.suit == self.suit) {
            score += 1;
        }

    }
    
    
    return score;
}

-(NSString*)contents
{
 

    NSArray *rankStrings = [PlayingCard rankStrings];
    return [[rankStrings objectAtIndex:self.rank] stringByAppendingString:self.suit];


}
@synthesize suit= _suit;
+(NSArray*) validSuits
{
    NSArray *suitStrings =[[NSArray alloc] initWithObjects: @"♠︎",@"♣︎",@"♥︎",@"♦︎",nil];
    return  suitStrings;
}
+(NSArray*) rankStrings{
    NSArray *rankStrings = [[NSArray alloc] initWithObjects:@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"k",nil];
    return rankStrings;
}
+(NSInteger) maxRank
{
    return [[PlayingCard rankStrings]count];
}
-(void) setSuit:(NSString *)suit
{
    
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit =suit;
    }
    
}

-(NSString*) suit
{
    if (_suit) {
        return _suit;
    }else{
        return @"?";
    }
}
@end
