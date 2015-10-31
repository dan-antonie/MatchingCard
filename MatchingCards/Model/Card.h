//
//  Card.h
//  MatchingCards
//
//  Created by Horatiu on 21/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic)NSString *contents;
@property(nonatomic,getter=isChosen) BOOL chosen;
@property(nonatomic,getter=isMatched) BOOL matched;
-(int)match:(NSArray *)otherCards;
@end
