//
//  KSViewController.h
//  AutoLayoutPractice1
//
//  Created by Kartik Shah on 11/20/13.
//  Copyright (c) 2013 Kartik Shah. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AutoLayoutManager;
@interface KSViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIView *leftOrTopView;
@property (strong, nonatomic) IBOutlet UIView *rightOrBottomView;
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *equalWidths;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *equalHeights;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewToTop;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewToBottom;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewToTrailing;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *textViewToLeading;


@end
