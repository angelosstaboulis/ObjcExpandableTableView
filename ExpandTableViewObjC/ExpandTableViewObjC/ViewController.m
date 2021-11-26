//
//  ViewController.m
//  ExpandTableViewObjC
//
//  Created by Angelos Staboulis on 16/11/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSArray *array = @[@[@"Num1",@[@"1",@"2",@"3",@"4",@"5"]]];
- (void)viewDidLoad {
    [super viewDidLoad];
    [_mainTableView setDataSource:self];
    [_mainTableView setDelegate:self];
    _getArray1 = [array[0] objectAtIndexedSubscript:1];
    _arrayNumbers = [[NSMutableArray alloc] init];
    [_arrayNumbers addObjectsFromArray:_getArray1];
    _expanded = FALSE;
    _indexPathArray = [[NSMutableArray alloc] init];
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] init];
    [view setFrame:CGRectMake(0, 0, 900, 55)];
    UILabel *lblTitle = [[UILabel alloc] init];
    [lblTitle setFrame:CGRectMake(10, -12, 250, 50)];
    [lblTitle setText:[NSString stringWithFormat:@"%@",array[section][0]]];
    _btnExpand = [[UIButton alloc] init];
    [_btnExpand setFrame:CGRectMake(200, -12, 160, 50)];
    [_btnExpand setUserInteractionEnabled:TRUE];
    [_btnExpand setTitle:(_expanded ? @"Collapse" : @"Expand") forState:UIControlStateNormal];
    [_btnExpand addTarget:self action:@selector(clickExpand:) forControlEvents:UIControlEventTouchDown];
    [_btnExpand setTag:section];
    [_btnExpand setTitleColor:UIColor.blueColor forState:UIControlStateNormal];
    [view addSubview:lblTitle];
    [view addSubview:_btnExpand];
    return view;
}
- (void)clickExpand:(UIButton *)button{
    if(_expanded){
        _expanded = FALSE;
        [_btnExpand setTitle:(_expanded ? @"Collapse" : @"Expand") forState:UIControlStateNormal];
        [_mainTableView beginUpdates];
        for(int item=0;item<5;item++){
            NSIndexPath *path = [NSIndexPath indexPathForRow:item inSection:0];
            [_indexPathArray addObject:path];
        }
       
        [_mainTableView deleteRowsAtIndexPaths:_indexPathArray withRowAnimation:UITableViewRowAnimationFade];
        [_mainTableView endUpdates];
    }
    else{
        _expanded = TRUE;
        [_btnExpand setTitle:(_expanded ? @"Collapse" : @"Expand") forState:UIControlStateNormal];
        [_mainTableView beginUpdates];
        for(int item=0;item<5;item++){
            NSIndexPath *path = [NSIndexPath indexPathForRow:item inSection:0];
            [_indexPathArray addObject:path];
        }
        if (_arrayNumbers.count > 0) {
            [_arrayNumbers removeAllObjects];
        }
        for(int item=0;item<5;item++){
            [_arrayNumbers insertObject:[NSString stringWithFormat:@"%d",item] atIndex:item];
        }
        [_mainTableView insertRowsAtIndexPaths:_indexPathArray withRowAnimation:UITableViewRowAnimationFade];
        [_mainTableView endUpdates];
    }
  
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_expanded == FALSE){
        return 0;
    }
    return [_arrayNumbers count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(indexPath.row < _getArray1.count){
        [cell.textLabel setText:[_arrayNumbers objectAtIndex:indexPath.row]];
    }
    else{
        
    }
    return cell;
}
@end
