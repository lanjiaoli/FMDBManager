//
//  FMDBManager.h
//  FMDBTest
//
//  Created by L on 2017/11/21.
//  Copyright © 2017年 L. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <FMDB/FMDB.h>
@class Person;

@interface FMDBManager : NSObject
/**
 FMDBManaer 单例

 */
+ (FMDBManager *)shareSingleManager;

/**
 添加数据

 @param model model
 */
- (void)addDataWithPersonModel:(Person *)model;

/**
 更新数据

 @param model model
 */
- (void)updataDataWithPerson:(Person *)model;

/**
 删除数据

 @param model model
 */
- (void)deleteDataWithPerson:(Person *)model;


/**
 查找数据

 @param model person
 */
- (void)searchDataWithPerson:(Person *)model;

/**
 *  获取所有数据
 *
 */
- (NSMutableArray *)getAllPerson;
@end
