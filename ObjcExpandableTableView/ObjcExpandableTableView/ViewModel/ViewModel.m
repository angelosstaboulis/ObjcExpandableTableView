//
//  ViewModel.m
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 25/11/21.
//

#import "ViewModel.h"
#import "DataManager.h"
@implementation ViewModel
-(id) init{
    self = [super init];
    if(self){
        _data = [DataManager shareInstace];
        _arrayViewModel = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)fetchValues:(void (^)(NSMutableArray * _Nonnull))completion{
    [_data initialValues:^(NSMutableArray * _Nonnull array) {
        [self->_arrayViewModel addObjectsFromArray:array];
        completion(self->_arrayViewModel);
    }];
}
@end
