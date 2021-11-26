//
//  DataManager.m
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 25/11/21.
//

#import "DataManager.h"
@implementation DataManager
+ (id)shareInstace{
    static DataManager *shared=nil;
    static dispatch_once_t queue;
    dispatch_once(&queue, ^{
        shared = [[DataManager alloc] init];
    });
    return shared;
}
-(id)init{
        self = [super init];
        _dataManagerArray = [[NSMutableArray alloc] init];
        return self;
}
- (void)initialValues:(void (^)(NSMutableArray * _Nonnull))completion{
    [_dataManagerArray addObject:@"Expanding row-1.0"];
    [_dataManagerArray addObject:@"Expanding row-2.0"];
    [_dataManagerArray addObject:@"Expanding row-3.0"];
    [_dataManagerArray addObject:@"Expanding row-4.0"];
    [_dataManagerArray addObject:@"Expanding row-5.0"];
    completion(_dataManagerArray);
}
@end
