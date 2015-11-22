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
#import "PlayingCardView.h"
#import "Grid.h"
@interface ViewController ()
@property (strong,nonatomic) NSArray *cardViews;
@property (weak, nonatomic) IBOutlet UIView *viewWithCards;

@property (nonatomic, strong) Grid *gridulCuCartile;

@end

@implementation ViewController

- (IBAction)swipeExecuted:(id)sender {
    
    UISwipeGestureRecognizer *theSwipe = (UISwipeGestureRecognizer *)sender;
    CGPoint aPoint = [theSwipe locationInView:self.viewWithCards];
    PlayingCardView *carteaUndeSaDatSwipe = [self cardWhereSwipeHappend:aPoint];
    
    if (carteaUndeSaDatSwipe != nil) {
        [carteaUndeSaDatSwipe setFaceUp:![carteaUndeSaDatSwipe faceUp]];
    }
    
    
}

- (PlayingCardView *)cardWhereSwipeHappend:(CGPoint )swipeLocationPoint
{
    for (PlayingCardView *aView in self.viewWithCards.subviews) {
        if (aView.frame.origin.x < swipeLocationPoint.x && aView.frame.origin.y < swipeLocationPoint.y && aView.frame.origin.x + aView.frame.size.width > swipeLocationPoint.x && aView.frame.origin.y + aView.frame.size.height >swipeLocationPoint.y) {
            return aView;
        }

    }
    

    return nil;
}


- (void)addCardsForRows:(int)nrOfRows forColumns:(int)nrOfColumns
{
    int availableWidthForCard = self.viewWithCards.frame.size.width /nrOfColumns ;
    int availableHeightForCard = self.viewWithCards.frame.size.height / nrOfRows;
    
    
    for (int i = 0; i < nrOfRows; i++) {
        for (int j = 0; j < nrOfColumns; j++) {

            
            PlayingCardView *aCard = [[PlayingCardView alloc] initWithFrame:CGRectMake(availableWidthForCard * j, availableHeightForCard * i, availableWidthForCard, availableHeightForCard)];
            [self.viewWithCards addSubview:aCard];
        }
    }
    
    self.gridulCuCartile = [[Grid alloc] init];
    self.gridulCuCartile.size = CGSizeMake(self.viewWithCards.frame.size.width, self.viewWithCards.frame.size.height);
    self.gridulCuCartile.minimumNumberOfCells = nrOfRows * nrOfColumns;
    self.gridulCuCartile.cellAspectRatio = (float)availableWidthForCard/(float)availableHeightForCard;
    
    
    if (self.gridulCuCartile.inputsAreValid) {
        NSLog(@"Normal ca sunt valide ca abia le desenaram");
    }else
    {
        NSLog(@"Pe aici nu tre sa intre");
    }
    
    
    
    
}



-(CardMatchingGame*) game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:self.numberOfCardsInPlay andDeck:[self createDeck]];
    }
    self.numberOfCardsInPlay = 20 ;
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
    //[self makeAllButtonsMultiline];


    Grid *aGrid = [[Grid alloc] init];
    aGrid.size = self.viewWithCards.bounds.size;
    
//    for (int i = 0; i<self.numberOfCardsInPlay; i++) {
//        PlayingCardView *aPlayingCardView = [[PlayingCardView alloc ] initWithFrame:[aGrid frameOfCellAtRow:i inColumn:i]];
//        [self.viewWithCards addSubview:aPlayingCardView];
//    }
    
     
     
    
    
    [self addCardsForRows:5 forColumns:3];
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
