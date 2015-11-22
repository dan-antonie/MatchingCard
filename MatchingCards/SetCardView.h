//
//  SetCardView.h
//  MatchingCards
//
//  Created by Horatiu on 12/11/15.
//  Copyright (c) 2015 Horatiu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView
@property (nonatomic) NSInteger numberOfShapes;
@property (strong,nonatomic) NSString *shape;
@property (strong,nonatomic) NSString *colorOfShapes;
@property (strong,nonatomic) NSString *filingOfShapes;
@property (nonatomic) BOOL faceUp;
@end
