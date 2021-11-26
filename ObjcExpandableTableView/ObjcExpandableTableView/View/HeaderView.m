//
//  HeaderView.m
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 25/11/21.
//

#import "HeaderView.h"

@implementation HeaderView
-(id) sharedInstace{
    static HeaderView *shared = nil;
    static dispatch_once_t  queue;
    dispatch_once(&queue, ^{
        shared = [[HeaderView alloc] init];
    });
    return shared;
}

- (UILabel *)createHeaderView:(NSString *) title{
    UIView *view = [[UIView alloc] init];
    [view setUserInteractionEnabled:TRUE];
    [view setFrame:CGRectMake(0, 0, 900, 55)];
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:TRUE];
    [label setFrame:CGRectMake(20, 5, 900, 55)];
    [label setText:title];
    [view addSubview:label];
    return label;
}
@end
