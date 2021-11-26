//
//  HeaderView.h
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 25/11/21.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : NSObject
-(UILabel *) createHeaderView:(NSString *) title;
-(id) sharedInstace;
@end

NS_ASSUME_NONNULL_END
