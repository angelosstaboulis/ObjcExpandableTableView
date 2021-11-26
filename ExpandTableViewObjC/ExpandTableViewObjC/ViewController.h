//
//  ViewController.h
//  ExpandTableViewObjC
//
//  Created by Angelos Staboulis on 16/11/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property (strong,nonatomic) NSArray *getArray1;
@property (strong,nonatomic) NSMutableArray<NSIndexPath *>  *indexPathArray;
@property (strong,nonatomic) UIButton *btnExpand;
@property NSMutableArray *arrayNumbers;

@property bool expanded;
@property int counter;
- (void) clickExpand:(UIButton *)button;
@end

