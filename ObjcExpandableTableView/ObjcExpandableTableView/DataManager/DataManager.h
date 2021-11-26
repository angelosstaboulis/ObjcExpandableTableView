//
//  DataManager.h
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 25/11/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataManager : NSObject

@property NSMutableArray *array;
+(id) shareInstace;
-(id)init;
@property NSMutableArray *dataManagerArray;
-(void) initialValues:(void (^) (NSMutableArray* array)) completion;
@end

NS_ASSUME_NONNULL_END
