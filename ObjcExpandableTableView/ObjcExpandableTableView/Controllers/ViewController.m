//
//  ViewController.m
//  ObjcExpandableTableView
//
//  Created by Angelos Staboulis on 24/11/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void) initialViewController{
    _viewModel = [[ViewModel alloc] init];
    _header = [[HeaderView alloc] init];
    _isExpanded = FALSE;
    _indexPatharray = [[NSMutableArray alloc] init];
    [_mainTableView setDelegate:self];
    [_mainTableView setDataSource:self];
    [_viewModel fetchValues:^(NSMutableArray * _Nonnull array) {
        [self->_mainTableView reloadData];
    }];
    [_mainTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialViewController];
    // Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_viewModel.arrayViewModel count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_isExpanded == FALSE){
        return 0;
    }
    return 60.0;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *getHeader = [_header createHeaderView:[NSString stringWithFormat:@"%@",[_viewModel.arrayViewModel objectAtIndex:section]]];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickable:)];
    [gesture setNumberOfTapsRequired:1];
    [getHeader addGestureRecognizer:gesture];
    gesture.view.tag = section;
    return getHeader;
}
- (void) clickable:(UITapGestureRecognizer *) sender{
    [_mainTableView beginUpdates];
    [_indexPatharray removeAllObjects];
    for(int item=0;item<5;item++){
        NSIndexPath *path = [NSIndexPath indexPathForItem:item inSection:sender.view.tag];
        [_indexPatharray addObject:path];
    }
    [_mainTableView deleteRowsAtIndexPaths:_indexPatharray withRowAnimation:(UITableViewRowAnimationFade)];
    [_mainTableView insertRowsAtIndexPaths:_indexPatharray withRowAnimation:(UITableViewRowAnimationFade)];
   
    [_mainTableView endUpdates];
    if(_isExpanded == FALSE){
        _isExpanded = TRUE;
    }
    else{
        _isExpanded = FALSE;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (_isExpanded == TRUE) {
        [cell.textLabel setText:[NSString stringWithFormat:@"Expanding row %ld.%ld",indexPath.section+1,indexPath.row+1]];
        [cell setBounds:CGRectMake(-15, 0, 300, 200)];
    }
    else{
        [cell.textLabel setText:@"Hello World"];
    }
    return cell;
}
@end
