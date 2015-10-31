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
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameTypeSegmentedControl;
@property (nonatomic) NSInteger numberOfCardsToBeMatched;
@property (weak, nonatomic) IBOutlet UITextView *gameLog;
@end

@implementation ViewController
- (IBAction)gameTypeSelection:(id)sender
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



-(CardMatchingGame*) game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] andDeck:[self createDeck]];
    }
    return _game;
}


-(Deck*) createDeck
{
    return [[PlayingCardDeck alloc]init];
}



- (IBAction)touchCardButton:(UIButton *)sender
{
    int choosenButonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choosenButonIndex];
    [self updateUI];
    if (self.gameTypeSegmentedControl.enabled == YES) {
        self.gameTypeSegmentedControl.enabled = NO;
    }
    

}

-(void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int buttonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card= [self.game cardAtIndex:buttonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"%d",self.game.score];
        self.gameLog.text = [self titleForCard:card];
    
    }
    
    
    
    
}
- (IBAction)resetGameButton
{
    self.gameTypeSegmentedControl.enabled = YES;
    _game =[[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] andDeck:[self createDeck]];
    [self updateUI];
}
-(NSString*)titleForCard:(Card*) card
{
    return card.isChosen ? card.contents : @"";
}
-(UIImage*)backgroundImageForCard:(Card*)card{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" :@"cardback"];
}
- (void)viewDidLoad {
        [super viewDidLoad];
     
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
