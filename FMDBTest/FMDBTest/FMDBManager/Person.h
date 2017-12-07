//
//  Person.h
//  FMDBTest
//
//  Created by L on 2017/11/23.
//  Copyright © 2017年 L. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,assign) NSInteger person_ID;
@property (nonatomic,copy) NSString *name;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, assign) NSInteger age;
@end
