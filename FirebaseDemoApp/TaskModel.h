//
//  RemainderModel.h
//  FirebaseDemoApp
//
//  Created by Siddharth Suneel on 17/11/16.
//  Copyright © 2016 SiddharthSuneel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TaskModel : NSObject

@property (nonatomic, strong) NSString *taskId;
@property (nonatomic, strong) NSString *createdBy;
@property (nonatomic, strong) NSString *createdDate;
@property (nonatomic, strong) NSString *dueDate;
@property (nonatomic, strong) NSString *taskStatus;
@property (nonatomic, strong) NSString *locationLattitude;
@property (nonatomic, strong) NSString *locationLongitude;
@property (nonatomic, strong) NSString *messageString;

@end
