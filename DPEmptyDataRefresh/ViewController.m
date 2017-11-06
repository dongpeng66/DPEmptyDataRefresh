//
//  ViewController.m
//  DPEmptyDataRefresh
//
//  Created by 人众 on 2017/10/24.
//
//

#import "ViewController.h"
#import "UIScrollView+DPRefresh.h"
#import "UIScrollView+DPEmptyDataSet.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UITableView *tabView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tabView];
    [self setupTableView];
    
    
}
- (void) setupTableView{
    
    
    UIView *headerView = [UIView new];
    headerView.backgroundColor = [UIColor redColor];
    headerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    [self.tabView setTableHeaderView:headerView];
    self.tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tabView.rowHeight = 44;
    [self.tabView setRefreshWithHeaderBlock:^{
        [self head];
    } footerBlock:^{
        [self foot];
    }];
    
    [self.tabView setupEmptyDataText:nil verticalOffset:100 emptyImage:[UIImage imageNamed:@"sdf"] buttonText:@"" tapBlock:^{
        
    }];
    
}


- (void) head{
    
    [self.dataArray removeAllObjects];
    
    for (int i = 1; i<6; i++) {
        [self.dataArray addObject:@(i)];
    }
    
    [self.tabView headerEndRefreshing];
    
    [self.tabView reloadData];
}


- (void) foot{
    
    for (int i = 1; i<6; i++) {
        [self.dataArray addObject:@(i)];
    }
    [self.tabView footerEndRefreshing];
    
    [self.tabView reloadData];
}
-(UITableView *)tabView{
    if (_tabView==nil) {
        _tabView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tabView.dataSource=self;
        _tabView.delegate=self;
    }
    return _tabView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *SimpleTableViewIdentifier = @"SimpleTableViewIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SimpleTableViewIdentifier"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableViewIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = [NSString stringWithFormat:@"row %ld",(long)indexPath.row];
    
    return cell;
}

#pragma mark Getter Setter

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
