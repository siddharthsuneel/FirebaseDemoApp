//
//  UIAlertController+Window.h
//  IAFLMobile
//
//  Created by Siddharth Suneel on 23/08/16.
//  Copyright © 2016 DMi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Window)

- (void)show;
- (void)show:(BOOL)animated;
+ (void)displayOkAlertWithTitle:(NSString *)title message:(NSString *)aMessage;
+ (void)displayOkAlertWithTitle:(NSString *)title message:(NSString *)aMessage okAction:(UIAlertAction *)action;

@end
