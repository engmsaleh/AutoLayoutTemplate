//
//  KSViewController.m
//  AutoLayoutPractice1
//
//  Created by Kartik Shah on 11/20/13.
//  Copyright (c) 2013 Kartik Shah. All rights reserved.
//

#import "KSViewController.h"

@interface KSViewController ()
@property (strong, nonatomic) IBOutlet UIView *leftOrTopView;
@property (strong, nonatomic) IBOutlet UIView *rightOrBottomView;
@property (strong, nonatomic) IBOutlet UIView *conatinerView;

//Constraints true in both orientation
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightBottomToBottomSpace;

//Only applicable in Landscape
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *trailingSpaceLeftTopToRightBottomView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *equalWidths;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *leftTopToBottomSpace;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightBottomToTopSpace;

//Only applicable in Portrait
@property (strong, nonatomic) NSLayoutConstraint *bottomSpaceLeftTopToRightBottomView;
@property (strong, nonatomic) NSLayoutConstraint *equalHeights;
@property (strong, nonatomic) NSLayoutConstraint *trailingSpaceLeftTopToSuperview;


@end

@implementation KSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _bottomSpaceLeftTopToRightBottomView = [NSLayoutConstraint constraintWithItem:_leftOrTopView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_rightOrBottomView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    _equalHeights = [NSLayoutConstraint constraintWithItem:_leftOrTopView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightOrBottomView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    _trailingSpaceLeftTopToSuperview = [NSLayoutConstraint constraintWithItem:_leftOrTopView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:_conatinerView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:20];

    // Get the views dictionary
    //NSDictionary *viewsDictionary =
    //     NSDictionaryOfVariableBindings(_leftOrTopView, _leftOrTopView);
    
     //_portraitBetweenViews = [NSLayoutConstraint constraintWithVisualFormat:@"[_leftOrTopView]-[_rightOrBottomView]" option   ns:NSLayoutFormatAlignAllBaseline metrics:Nil views:viewsDictionary];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_leftOrTopView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_rightOrBottomView setTranslatesAutoresizingMaskIntoConstraints:NO];

    if(UIDeviceOrientationIsLandscape(self.interfaceOrientation))
    {
        [_leftOrTopView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_rightOrBottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        [_leftOrTopView addConstraint:_leftTopToBottomSpace];
        [_leftOrTopView removeConstraint:_bottomSpaceLeftTopToRightBottomView];
        
        //[self.view addConstraint:_equalWidths];
        //[self.view removeConstraint:_equalHeights];
        
        [_leftOrTopView removeConstraint:_trailingSpaceLeftTopToSuperview];
    }
    else
    {
        [_leftOrTopView removeConstraint:_leftTopToBottomSpace];
        [_leftOrTopView addConstraint:_bottomSpaceLeftTopToRightBottomView];
        
        //[self.view removeConstraint:_equalWidths];
        //[self.view addConstraint:_equalHeights];
        
        //[_leftOrTopView addConstraint:_trailingSpaceLeftTopToSuperview];
    }
    [_leftOrTopView updateConstraintsIfNeeded];
    [_rightOrBottomView updateConstraintsIfNeeded];
    [_conatinerView updateConstraintsIfNeeded];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
