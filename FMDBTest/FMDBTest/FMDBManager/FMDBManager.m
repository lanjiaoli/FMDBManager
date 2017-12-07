//
//  FMDBManager.m
//  FMDBTest
//
//  Created by L on 2017/11/21.
//  Copyright © 2017年 L. All rights reserved.
//

#import "FMDBManager.h"
#import "Person.h"


static FMDBManager *manager = nil;
@interface FMDBManager()<NSCopying,NSMutableCopying>
{
    FMDatabase *_db;
}
@end
@implementation FMDBManager
+ (FMDBManager *)shareSingleManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FMDBManager alloc]init];
        [manager initFMDBData];
    });
    return manager;
}
#pragma mark - init FMDB
- (void)initFMDBData{
    // 获得Documents目录路径
    
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 文件路径
    
    NSString *filePath = [documentsPath stringByAppendingPathComponent:@"person.sqlite"];
    
    // 实例化FMDataBase对象
    
    _db = [FMDatabase databaseWithPath:filePath];
    
    [_db open];
    // 初始化数据表
//    创建数据表SQL
    NSString *chatModelSql = [NSString stringWithFormat:@"CREATE TABLE 'Person' ('Person_ID' VARCHAR(255),'Person_Name' VARCHAR(255),'Person_Age' VARCHAR(255),'Person_Sex' VARCHAR(255))"];
    
    BOOL res = [_db executeUpdate:chatModelSql];
    if (!res) {
        NSLog(@"数据库创建失败");
    }else{
        NSLog(@"数据库创建成功");
    }
    [_db close];
}

/**
 添加数据
 
 @param model model
 */
- (void)addDataWithPersonModel:(Person *)model{
    [_db open];
    [_db executeUpdate:@"INSERT INTO Person(Person_ID,Person_Name,Person_Age,Person_Sex)VALUES(?,?,?,?)",@(model.person_ID),model.name,@(model.age),model.sex];
    [_db close];
}

/**
 更新数据
 
 @param model model
 */
- (void)updataDataWithPerson:(Person *)model{
    [_db open];
    [_db executeUpdate:@"UPDATE 'Person' SET Person_ID = ?  WHERE Person_Name = ?",@(model.person_ID),model.name];
    [_db close];
}

/**
 删除数据
 
 @param model model
 */
- (void)deleteDataWithPerson:(Person *)model{
    [_db open];
    [_db executeUpdate:@"DELETE FROM Person WHERE Person_ID = ?",model.person_ID];
    //多条件用这个方法
//    [_db executeUpdateWithFormat:@"DELETE FROM chatVoice WHERE person_ID = %ld AND person_Age = %ld ",model.person_ID,model.age];
    [_db close];
}


/**
 查找数据
 
 @param model person
 */
- (void)searchDataWithPerson:(Person *)model{
    
}
- (NSMutableArray *)getAllPerson{
    [_db open];
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    FMResultSet *res = [_db executeQuery:@"SELECT * FROM person"];
    while ([res next]) {
        Person *person = [[Person alloc] init];
        person.person_ID = [[res stringForColumn:@"Person_ID"] integerValue];
        person.name = [res stringForColumn:@"Person_Name"];
        person.age = [[res stringForColumn:@"Person_Age"] integerValue];
        person.sex = [res stringForColumn:@"Person_Sex"];
    
        [dataArray addObject:person];
    }
    [_db close];
    return dataArray;
}
#pragma mark - coping Delegate
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    
    if (manager == nil) {
        
        manager = [super allocWithZone:zone];
    }
    return manager;
    
}

-(id)copy{
    
    return self;
    
}

-(id)mutableCopy{
    
    return self;
    
}

-(id)copyWithZone:(NSZone *)zone{
    
    return self;
    
}

-(id)mutableCopyWithZone:(NSZone *)zone{
    
    return self;
    
}
@end

