//
//  ViewController.h
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 24/11/21.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "ViewModel.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;
@property NSMutableArray *array;
@property NSMutableArray<NSIndexPath *> *indexPatharray;
@property BOOL isExpanded;
@property HeaderView *header;
@property ViewModel *viewModel;
- (void) initialViewController;
- (void) clickable:(UITapGestureRecognizer *) sender;
@end

