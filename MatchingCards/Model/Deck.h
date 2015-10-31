//
//  Deck.h
//  MatchingCards
//
//  Created by Horatiu on 21/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
-(void)addCard:(Card*)card atTop:(BOOL)atTop;
-(void)addCard:(Card *)card ;
-(Card*)drawRandomCard;
@end
