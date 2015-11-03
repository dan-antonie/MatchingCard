//
//  SetCard.h
//  MatchingCards
//
//  Created by Horatiu on 02/11/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import "Card.h"
#import <Foundation/Foundation.h>

@interface SetCard : Card
@property(strong,nonatomic) NSString *shape;
@property(strong,nonatomic) NSString *color;
@property(nonatomic) NSInteger colorTrasparency;
@property(nonatomic) NSInteger number;
@end
