//
//  UserModel.h
//  FirebaseDemoApp
//
//  Created by Siddharth Suneel on 17/11/16.
//  Copyright © 2016 SiddharthSuneel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeviceModal.h"
#import "TaskModel.h"

@interface UserModel : NSObject

@property (nonatomic, strong) NSNumber *userId;
@property (nonatomic, strong) NSNumber *userStatus;
@property (nonatomic, strong) NSString *userName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *contact;
@property (nonatomic, strong) NSMutableArray *devices;
@property (nonatomic, strong) NSMutableArray *remainders;

@end
