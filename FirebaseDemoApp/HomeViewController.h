//
//  HomeViewController.h
//  FirebaseDemoApp
//
//  Created by Siddharth Suneel on 11/11/16.
//  Copyright © 2016 SiddharthSuneel. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Firebase;

@interface HomeViewController : UIViewController

@property(nonatomic, strong)FIRUser *currentloggedInUser;

@end
