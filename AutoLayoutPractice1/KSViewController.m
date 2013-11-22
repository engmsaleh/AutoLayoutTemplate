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
@property (strong, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *equalWidths;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *equalHeights;
@end

@implementation KSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)updateViewConstraints
{
    [_leftOrTopView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_rightOrBottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    if(UIDeviceOrientationIsLandscape(self.interfaceOrientation))
    {
        //H:|-[LT]-[RT]-|
        //V:|-[LT]-|
        //V:|-[RT]-|
        
        [_containerView removeConstraints:_containerView.constraints];
        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_leftOrTopView]-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView, _rightOrBottomView)]];
        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_leftOrTopView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView)]];
        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_rightOrBottomView)]];
        [_containerView addConstraint:_equalWidths];
        [_containerView addConstraint:_equalHeights];

    }
    else
    {
        //H:|-[LT]-|
        //H:|-[RT]-|
        //V:|-[LT]-[RT]-|
        
        [_containerView removeConstraints:_containerView.constraints];
        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_leftOrTopView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView)]];
        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_rightOrBottomView)]];
        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_leftOrTopView]-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView, _rightOrBottomView)]];
        [_containerView addConstraint:_equalWidths];
        [_containerView addConstraint:_equalHeights];
        
    }
    [super updateViewConstraints];
}

//-(void)updateViewConstraints
//{
//    [_leftOrTopView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    [_rightOrBottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    
//    //[self.view setTranslatesAutoresizingMaskIntoConstraints:NO];
//    if(UIDeviceOrientationIsLandscape(self.interfaceOrientation))
//    {
//        
//        //H:|-[LT]-[RT]-|
//        //V:|-[LT]-|
//        //V:|-[RT]-|
//        
//        [_containerView removeConstraints:_containerView.constraints];
//        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_leftOrTopView]-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView, _rightOrBottomView)]];
//        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_leftOrTopView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView)]];
//        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_rightOrBottomView)]];
//        [_containerView addConstraint:_equalWidths];
//        [_containerView addConstraint:_equalHeights];
//        
//        /*
//         [_containerView removeConstraint: _bottomSpaceLeftTopToRightBottomView];//V:[LT]-[RB]
//         [_containerView removeConstraint:_trailingSpaceLeftTopToSuperview];//H:[LT]-[C]
//         [_containerView removeConstraint:_trailingSpaceRightBottomToSuperview];//H:[RB]-[C]
//         
//         [_containerView removeConstraint:_leadingSpaceLeftTopToSuperview];
//         [_containerView removeConstraint:_leadingSpaceRightBottomToSuperview];
//         [_containerView removeConstraint:_bottomSpaceRightBottomToSuperview];
//         
//         [_containerView addConstraint:_trailingSpaceLeftTopToRightBottomView];//H:[LT]-[RB]
//         [_containerView addConstraint:_rightBottomToTopSpace];//V:[C]-[RB]
//         */
//    }
//    else
//    {
//        //H:|-[LT]-|
//        //H:|-[RT]-|
//        //V:|-[LT]-[RT]-|
//        
//        [_containerView removeConstraints:_containerView.constraints];
//        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_leftOrTopView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView)]];
//        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_rightOrBottomView)]];
//        [_containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_leftOrTopView]-[_rightOrBottomView]-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView, _rightOrBottomView)]];
//        [_containerView addConstraint:_equalWidths];
//        [_containerView addConstraint:_equalHeights];
//        
//        /*
//         [_containerView removeConstraint:_trailingSpaceLeftTopToRightBottomView];//H:[LT]-[RB]
//         [_containerView removeConstraint:_rightBottomToTopSpace];//V:[C]-[RB]
//         
//         [_containerView addConstraint:_bottomSpaceLeftTopToRightBottomView];//V:[LT]-[RB]
//         [_containerView removeConstraint:_equalWidths];
//         
//         [_containerView addConstraint:_leadingSpaceLeftTopToSuperview];//H:[C]-[LT]
//         [_containerView addConstraint:_trailingSpaceLeftTopToSuperview];//H:[LT]-[C]
//         
//         [_containerView addConstraint:_leadingSpaceRightBottomToSuperview];//H:[C]-[RB]
//         [_containerView addConstraint:_trailingSpaceRightBottomToSuperview];//H:[RB]-[C]
//         
//         [_containerView addConstraint:_bottomSpaceRightBottomToSuperview];//V:[RB]-[C]
//         */
//    }
//    //[_leftOrTopView updateConstraints];
//    //[_rightOrBottomView updateConstraints];
//    //[_containerView updateConstraints];
//    //[_leftOrTopView setNeedsUpdateConstraints];
//    //[_rightOrBottomView setNeedsUpdateConstraints];
//    //[_containerView setNeedsUpdateConstraints];
//    //[_containerView layoutSubviews];
//    //[_leftOrTopView layoutSubviews];
//    //[_rightOrBottomView layoutSubviews];
//    
//    [super updateViewConstraints];
//}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
