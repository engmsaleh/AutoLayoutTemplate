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

//Constraints true in both orientation
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightBottomToBottomSpace;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *equalWidths;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *equalHeights;

//Only applicable in Landscape
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *trailingSpaceLeftTopToRightBottomView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *rightBottomToTopSpace;

//Only applicable in Portrait
@property (strong, nonatomic) NSLayoutConstraint *bottomSpaceLeftTopToRightBottomView;
@property (strong, nonatomic) NSLayoutConstraint *trailingSpaceLeftTopToSuperview;
@property (strong, nonatomic) NSLayoutConstraint *trailingSpaceRightBottomToSuperview;

@property (strong, nonatomic) NSLayoutConstraint *leadingSpaceLeftTopToSuperview;
@property (strong, nonatomic) NSLayoutConstraint *leadingSpaceRightBottomToSuperview;
@property (strong, nonatomic) NSLayoutConstraint *bottomSpaceRightBottomToSuperview;

//@property (strong, nonatomic) NSArray* portraitSpacingBetweenViews;
//@property (strong, nonatomic) NSArray* portraitTrailingSpaceLeftTopToSuperView;
@end

@implementation KSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
   _bottomSpaceLeftTopToRightBottomView = [NSLayoutConstraint constraintWithItem:_leftOrTopView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:_rightOrBottomView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    //_equalHeights = [NSLayoutConstraint constraintWithItem:_leftOrTopView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:_rightOrBottomView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
     _trailingSpaceLeftTopToSuperview = [NSLayoutConstraint constraintWithItem:_containerView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_leftOrTopView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
    _trailingSpaceRightBottomToSuperview = [NSLayoutConstraint constraintWithItem:_containerView   attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_rightOrBottomView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
    
    _leadingSpaceLeftTopToSuperview =  [NSLayoutConstraint constraintWithItem:_leftOrTopView   attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_containerView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
    
    _leadingSpaceRightBottomToSuperview =  [NSLayoutConstraint constraintWithItem:_rightOrBottomView   attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:_containerView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:20];
    
    _bottomSpaceRightBottomToSuperview =  [NSLayoutConstraint constraintWithItem:_containerView   attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_rightOrBottomView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    
    //Get the views dictionary
    //NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(_leftOrTopView, _rightOrBottomView);

    //_topSpacingToLeftTopView =
    //_leadingSpaceToLeftTopView =
    //_trailingSpaceToRightBottomView =
    //_bottomSpaceToRightBottomView =
    //_leftTopRightLeftEqualWidth
    //_leftTopRightBottomEqualHeight
    //_landscapeSpacingBetweenViews
    //_portraitSpacingBetweenViews
    //_portraitSpacingBetweenViews = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[_leftOrTopView]-[_rightOrBottomView]" options:NSLayoutFormatAlignAllLeft metrics:nil views:viewsDictionary];
    //_portraitTrailingSpaceLeftTopToSuperView = [NSLayoutConstraint constraintsWithVisualFormat:@"[_leftOrTopView]-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:NSDictionaryOfVariableBindings(_leftOrTopView)];
    
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
