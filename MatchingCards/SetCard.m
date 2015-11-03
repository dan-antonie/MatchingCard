//
//  SetCard.m
//  MatchingCards
//
//  Created by Horatiu on 02/11/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

-(int)match:(NSArray*)otherCards{
    int score = 0;
    SetCard *firstCard = [otherCards firstObject];
    SetCard *secondCard = [otherCards lastObject];
    // sameColor all  cards have the same color
    // diferentColor all cards  have diferent color
    BOOL sameColor = (self.color == firstCard.color) && (firstCard.color == secondCard.color);
    BOOL diferentColor = (self.color != firstCard.color) && (firstCard.color != secondCard.color) && (self.color != secondCard.color);
    BOOL sameNumber = (self.number == firstCard.number) && (firstCard.number== secondCard.number);
    BOOL diferentNumber = (self.number != firstCard.number) && (firstCard.number != secondCard.number) && (self.number != secondCard.number);
    BOOL sameShape = (self.shape == firstCard.shape) && (firstCard.shape== secondCard.shape);
    BOOL diferentShape = (self.shape != firstCard.shape) && (firstCard.shape != secondCard.shape) && (self.shape != secondCard.shape);
    BOOL sameColorTransparency = (self.colorTrasparency == firstCard.colorTrasparency) && (firstCard.colorTrasparency == secondCard.colorTrasparency);
    BOOL diferntColorTransparency = (self.colorTrasparency != firstCard.colorTrasparency) && (firstCard.colorTrasparency != secondCard.colorTrasparency) && (self.colorTrasparency != secondCard.colorTrasparency);
    
    if ((sameColor || diferentColor ) && (sameColorTransparency || diferntColorTransparency) && (sameNumber || diferentNumber) && (sameShape || diferentShape)) {
        
        score = 8;
    }
    
    
    return score;
    }





@end
