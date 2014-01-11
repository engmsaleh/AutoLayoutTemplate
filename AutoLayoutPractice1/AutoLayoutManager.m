//
//  LayoutManager.m
//  AutoLayoutPractice1
//
//  Created by Kartik Shah on 1/11/14.
//  Copyright (c) 2014 Kartik Shah. All rights reserved.
//

#import "AutoLayoutManager.h"

@interface AutoLayoutManager()
@end

@implementation AutoLayoutManager

-(void)setupAutoLayout:(UIInterfaceOrientation)orientation
{
        NSDictionary* views = @{ @"_leftOrTopView" : self.delegate.leftOrTopView, @"_rightOrBottomView" : self.delegate.rightOrBottomView};

        [self.delegate.leftOrTopView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.delegate.rightOrBottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
        
        if(UIDeviceOrientationIsLandscape(orientation))
        {
            [self.delegate.containerView removeConstraints:self.delegate.containerView.constraints];
            [self.delegate.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_leftOrTopView]-[_rightOrBottomView]-|" options:0 metrics:nil views:views]];
            [self.delegate.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_leftOrTopView]-|" options:0 metrics:nil views:views]];
            [self.delegate.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_rightOrBottomView]-|" options:0 metrics:nil views:views]];
            [self.delegate.containerView addConstraint: [NSLayoutConstraint constraintWithItem:self.delegate.leftOrTopView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.delegate.rightOrBottomView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0 ]];
            [self.delegate.containerView addConstraint: [NSLayoutConstraint constraintWithItem:self.delegate.leftOrTopView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.delegate.rightOrBottomView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
            self.delegate.textViewToTop.constant = 330;
            self.delegate.textViewToBottom.constant = 250;
            self.delegate.textViewToLeading.constant = 20;
            self.delegate.textViewToTrailing.constant = 20;
        }
        else
        {
            [self.delegate.containerView removeConstraints:self.delegate.containerView.constraints];
            [self.delegate.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_leftOrTopView]-|" options:0 metrics:nil views:views]];
            [self.delegate.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-[_rightOrBottomView]-|" options:0 metrics:nil views:views]];
            [self.delegate.containerView addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[_leftOrTopView]-[_rightOrBottomView]-|" options:0 metrics:nil views:views]];
            [self.delegate.containerView addConstraint: [NSLayoutConstraint constraintWithItem:self.delegate.leftOrTopView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.delegate.rightOrBottomView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0 ]];
            [self.delegate.containerView addConstraint: [NSLayoutConstraint constraintWithItem:self.delegate.leftOrTopView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.delegate.rightOrBottomView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
            self.delegate.textViewToTop.constant = 100;
            self.delegate.textViewToBottom.constant = 50;
            self.delegate.textViewToLeading.constant = 400;
            self.delegate.textViewToTrailing.constant = 20;
        }
}

@end
