//
//  ViewController.m
//  MatchingCards
//
//  Created by Horatiu on 21/10/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//
#import "CardMatchingGame.h"
#import "ViewController.h"
#import "PlayingCardDeck.h"
@interface ViewController ()

@end

@implementation ViewController
/*- (IBAction)gameTypeSelection:(id)sender
{
    UISegmentedControl *segmentedControl = (UISegmentedControl *) sender;
    NSInteger selectedSegment = segmentedControl.selectedSegmentIndex;
    
    if (selectedSegment == 0) {
        //set the numberOfCardsToBeMatched to 2 cards
        self.numberOfCardsToBeMatched = 2;
    }
    else{
        //set the numberOfCardsToBeMatched to 3 cards
        self.numberOfCardsToBeMatched = 3;
    }
}
*/


-(CardMatchingGame*) game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] andDeck:[self createDeck]];
    }
    _game.numberOfCardsToMatch = 2  ;
    return _game;
}


-(Deck*) createDeck
{
    return [[PlayingCardDeck alloc]init];
}



- (IBAction)touchCardButton:(UIButton *)sender
{
    self.tempCard = [self.game cardAtIndex:1];
    NSString *tempLog =[[NSString alloc]init];
    int choosenButonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenButonIndex];
    [self updateUI];
    if (self.gameTypeSegmentedControl.enabled == YES) {
        self.gameTypeSegmentedControl.enabled = NO;
    }
    Card *currentCard = [self.game cardAtIndex:choosenButonIndex];
    self.gameLog.attributedText =  [self titleForCard:currentCard];
    if (currentCard.isMatched) self.gameLog.text = @"is matched";
    if ([currentCard match:[NSArray arrayWithObject:self.tempCard]]) {
        
        
        //self.gameLog.text = [NSString stringWithFormat:@"%@ is mathcing %@",[self titleForCard:currentCard],[self titleForCard:self.tempCard]];
        
    }

    self.tempCard = currentCard;
}

-(void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int buttonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card= [self.game cardAtIndex:buttonIndex];

        [cardButton setAttributedTitle: [self titleForCard:card] forState:UIControlStateNormal];
  
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score:%ld",(long)self.game.score];
        
    }
    
    
    
}

- (void)makeAllButtonsMultiline
{
    for (UIButton *aButton in self.cardButtons) {
        aButton.titleLabel.numberOfLines = 3;
    }
}

- (IBAction)resetGameButton
{
    self.gameTypeSegmentedControl.enabled = YES;
    _game =[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] andDeck:[self createDeck]];
    self.game.numberOfCardsToMatch = 2;
    [self updateUI];
}
-(NSAttributedString*)titleForCard:(Card*) card
{
    return card.isChosen ? [[NSAttributedString alloc] initWithString:  card.contents] : [[NSAttributedString alloc] initWithString: @""];
}
-(UIImage*)backgroundImageForCard:(Card*)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" :@"cardback"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeAllButtonsMultiline];
    
     
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
