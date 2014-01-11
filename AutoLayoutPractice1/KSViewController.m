//
//  KSViewController.m
//  AutoLayoutPractice1
//
//  Created by Kartik Shah on 11/20/13.
//  Copyright (c) 2013 Kartik Shah. All rights reserved.
//

#import "KSViewController.h"
#import "AutoLayoutManager.h"

@interface KSViewController ()
@property (strong, nonatomic) AutoLayoutManager* autoLayoutManager;
@end

@implementation KSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _autoLayoutManager = [[AutoLayoutManager alloc] init];
    _autoLayoutManager.delegate = self;
}

-(void)updateViewConstraints
{
    [_autoLayoutManager setupAutoLayout:self.interfaceOrientation];
    [super updateViewConstraints];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
