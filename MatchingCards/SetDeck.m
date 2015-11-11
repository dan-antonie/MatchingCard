//
//  SetDeck.m
//  MatchingCards
//
//  Created by Horatiu on 02/11/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "SetDeck.h"
@interface SetDeck ()
@property(nonatomic,strong) NSArray *colors;
@property(nonatomic,strong) NSArray *shapes;
@end


@implementation SetDeck

-(instancetype) init
{
    self.colors = [[NSArray alloc]initWithObjects:@"red",@"yellow",@"blue", nil];
    self.shapes = [[NSArray alloc]initWithObjects:@"●",@"▲",@"◼︎", nil];
    
    self=[super init];
    if (self) {
        for (int i=1; i<4; i++) {
            for (int j=1; j<4; j++) {
                for (NSString *color in self.colors) {
                    for (NSString *shape in self.shapes) {
                        SetCard *aSetCard = [[SetCard alloc] init];
                        aSetCard.number = i;
                        aSetCard.color = color;
                        aSetCard.colorTrasparency = j;
                        aSetCard.shape = shape;
                        [self addCard:aSetCard];
                    }
               
                
                }
            }
        }
    }
    
    return self;
    
}
@end




