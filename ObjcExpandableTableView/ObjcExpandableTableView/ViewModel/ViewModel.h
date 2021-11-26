//
//  ViewModel.h
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 25/11/21.
//

#import <Foundation/Foundation.h>
#import "DataManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface ViewModel : NSObject
@property NSMutableArray *arrayViewModel;
@property DataManager *data;
- init;
- (void) fetchValues:(void (^) (NSMutableArray* array)) completion;
@end

NS_ASSUME_NONNULL_END
