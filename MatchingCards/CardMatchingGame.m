//
//  CardMatchingGame.m
//  MatchingCards
//
//  Created by Horatiu on 29/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards; //of Cards
//@property (nonatomic,strong) NSMutableArray *chosenCards;
@end
@implementation CardMatchingGame
@synthesize numberOfCardsToMatch = _numberOfCardsToMatch;
static const int MISSMATCH_PENALTY=2;
static const int MATCHBONUS=4;
static const int COSTTOCHOOSE=1;
/*-(NSMutableArray*)chosenCards
{
    if (!_chosenCards) {
        _chosenCards = [[NSMutableArray alloc]init];
    }
    return _chosenCards;

}*/
-(NSMutableArray*)cards
{
    if (!_cards) {
        _cards =[[NSMutableArray alloc]init];
        
    }
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger *)count andDeck:(Deck *)deck
{
    self=[super init]; // super's designated initialiser
    


    if (self)
    {
        for (int i =0; i<count; i++) {
            Card *card =[deck drawRandomCard];
            
            if (card) {
                [self.cards addObject:card];
            }
            else {
                self=nil;
                break;
            }
        }
    }
    
    return self;
}

-(Card*)cardAtIndex:(NSInteger *)index
{
    return (index<[self.cards count]) ? [self.cards objectAtIndex:index]: nil;
    
}

- (void)chooseCardAtIndex:(NSUInteger *)index
{
    Card *card = [self cardAtIndex:index];
    //Card *otherCard = [[Card alloc]init];
    
    self.score -= 1;

    if (card.isMatched) {
        return;
    }
    
    if (card.isChosen) {
        card.chosen = NO;
        return;
    }
    
    card.chosen = YES;
    
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    for (Card *otherCard in self.cards)
    {
        if ( otherCard != card && otherCard.isChosen && !otherCard.isMatched ) {
            [tempArray addObject:otherCard];
        }
    }
    
    int tempScore = [card match:tempArray];
    
    //cazul general cu n
    
    if (tempScore == 0 && [tempArray count] >= 2) {
        for (int i = 0; i < [tempArray count] - 1; i++) {
            
            Card *iCard = [tempArray objectAtIndex:i];
            for (int j = i + 1; j < [tempArray count]; j++) {
                Card *jCard = [tempArray objectAtIndex:j];
                tempScore = [iCard match:[NSArray arrayWithObject:jCard]];
                if (tempScore > 0) {
                    break;
                }
            }
        }

    }
    
    
    
    //cazul particular cu 2
//    if ([tempArray count] >= 2 && tempScore == 0) {
//        Card *firstCard = [tempArray firstObject];
//        Card *secondCard = [tempArray lastObject];
//        tempScore = [firstCard match:[NSArray arrayWithObject:secondCard]];
//    }
//    
    //self.score += tempScore;
    

    if (tempScore > 0) {
        
        self.score += (tempScore * 4);

        if ([tempArray count] >=_numberOfCardsToMatch - 1)
        {
            for (Card *aCard in tempArray )
            {
                //daca nu sunt vizibile tre marcate in partea ailalta.
                aCard.matched = YES;
            }
            
            card.matched = YES;
        }
        
    }else
    {
        if ([tempArray count] >=_numberOfCardsToMatch - 1) {
            
            for (Card *aCard in tempArray )
            {
                //Card *carteaDeBaza = self.cards
                
                //daca nu sunt vizibile tre marcate in partea ailalta.
                aCard.chosen = NO;
            }
          //  card.chosen = NO;
            self.score -= 2;
        }
    }
    
}


//-(void) chooseCardAtIndex:(NSUInteger *)index
//{
//    Card *card = [self cardAtIndex:index];
//    Card *otherCard = [[Card alloc]init];
//    
//    if (card.isMatched) {
//        return;
//    }
//    
//    if (card.isChosen) {
//        card.chosen = NO;
//        return;
//    }
//    
//    for (otherCard in self.cards)
//    {
//        if (!otherCard.isChosen || otherCard.isMatched){
//            continue;
//        }
//        
//        [self.chosenCards addObject:otherCard];
//        
//    }
//    
//    if ([self.chosenCards count] >= self.numberOfCardsToMatch-1) {
//        self.score = [card match:self.chosenCards] * MATCHBONUS;
//        if (self.score > 0) {
//            card.matched = YES;
//            for (Card *aCard in self.chosenCards) {
//                aCard.matched = YES;
//            }
//        }
//    }
//        
//    card.chosen = YES;
//
//        
//    
//   // NSLog(self.chosenCards);
//
//}


@end
