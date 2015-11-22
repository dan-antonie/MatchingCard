//
//  SetCardView.m
//  MatchingCards
//
//  Created by Horatiu on 12/11/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import "SetCardView.h"
@interface SetCardView()
@property (nonatomic)CGFloat faceCardScaleFactor;
@end
@implementation SetCardView

#pragma mark - Properties

#define DEFAULT_FACE_CARD_SCALE_FACTOR 0.90

@synthesize faceCardScaleFactor = _faceCardScaleFactor;

- (CGFloat)faceCardScaleFactor
{
    if (!_faceCardScaleFactor) _faceCardScaleFactor = DEFAULT_FACE_CARD_SCALE_FACTOR;
    return _faceCardScaleFactor;
}

- (void)setFaceCardScaleFactor:(CGFloat)faceCardScaleFactor
{
    _faceCardScaleFactor = faceCardScaleFactor;
    [self setNeedsDisplay];
}

- (void)setNumberOfShapes:(NSInteger)numberOfShapes
{
    _numberOfShapes = numberOfShapes;
    [self setNeedsDisplay];
}

- (void)setColorOfShapes:(NSString *)colorOfShapes
{
    _colorOfShapes = colorOfShapes;
    [self setNeedsDisplay];
}
- (void)setFilingOfShapes:(NSString *)filingOfShapes
{
    _filingOfShapes = filingOfShapes;
    [self setNeedsDisplay];
}
- (void)setShape:(NSString *)shape
{
    _shape = shape;
    [self setNeedsDisplay];
}

- (void)setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}

#pragma mark - Gesture Handling

- (void)pinch:(UIPinchGestureRecognizer *)gesture
{
    if ((gesture.state == UIGestureRecognizerStateChanged) ||
        (gesture.state == UIGestureRecognizerStateEnded)) {
        self.faceCardScaleFactor *= gesture.scale;
        gesture.scale = 1.0;
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
