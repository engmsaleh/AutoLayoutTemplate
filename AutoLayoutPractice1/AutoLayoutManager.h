//
//  LayoutManager.h
//  AutoLayoutPractice1
//
//  Created by Kartik Shah on 1/11/14.
//  Copyright (c) 2014 Kartik Shah. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KSViewController.h"

@interface AutoLayoutManager : NSObject

@property (strong, nonatomic) KSViewController* delegate;
-(void)setupAutoLayout:(UIInterfaceOrientation)orientation;

@end
