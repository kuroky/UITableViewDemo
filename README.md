# UITableViewDemo
UIViewController + UITableView + MJRefresh 实践

```
/**
 cell设置
 
 @param cell custom cell
 @param item model data
 @param indexPath NSIndexPath
 */
typedef void (^MXCellConfigBlock)(id cell, id item, NSIndexPath *indexPath);

/**
 Custom TableViewController
 */
@interface MXBaseTableViewController : UIViewController

/**
 reload tableview之前调用
 
 @param block cell设置
 */
- (void)mx_reloadData:(MXCellConfigBlock)block;

@property (strong, nonatomic, readonly) UITableView *tableView;

/**
 tableview section 一行 
 */
@property (assign, nonatomic) BOOL sectionIsSingle;

/**
 cell identifier
 */
@property (nonatomic, copy) NSString *cellIdentifier;

/**
 Data Source
 */
@property (nonatomic, strong) NSMutableArray *dataList;

/**
 cell rowHeight
 */
@property (nonatomic, assign) CGFloat rowHeight;

/**
 section header高度
 */
@property (nonatomic, assign) CGFloat sectionHeaderHeight;

/**
 section footer高度
 */
@property (nonatomic, assign) CGFloat sectionFooterHeight;

/**
 自定义cell高度
 */
@property (nonatomic, copy) CGFloat (^MXCellHeightBlock)(NSIndexPath *indexPath);

/**
 自定义section 头部高度
 */
@property (nonatomic, copy) CGFloat (^MXHeaderHeightBlock)(NSInteger section);

/**
 自定义section 脚部高度
 */
@property (nonatomic, copy) CGFloat (^MXFooterHeightBlock)(NSInteger section);

#pragma mark - Refresh

/**
 隐藏头部
 */
@property (nonatomic, assign) BOOL hideHeaderRefresh;

/**
 隐藏底部
 */
@property (nonatomic, assign) BOOL hideFooterRefresh;

@property (nonatomic, assign) NSInteger mx_start;
@property (nonatomic, assign) NSInteger mx_count;

/**
 下拉刷新
 */
- (void)mx_headerRefresh;

/**
 上拉刷新
 */
- (void)mx_footerRefresh;

```


## Rows List
```
self.tableView.frame = self.view.bounds;
self.cellIdentifier = @"cell";
self.hideHeaderRefresh = YES;
self.hideFooterRefresh = YES;
[self.tableView registerClass:[UITableViewCell class]
       forCellReuseIdentifier:@"cell"];
    
self.MXCellHeightBlock = ^CGFloat(NSIndexPath *indexPath) {
    if (indexPath.row % 2 == 0) {
        return 50.0;
       }
    else {
        return 100.0;
    }
};
    
[self mx_reloadData:^(UITableViewCell *cell, NSString *item, NSIndexPath *indexPath) {
    cell.textLabel.text = item;
}];
```
## Sections List
```
self.tableView.frame = self.view.bounds;
self.sectionIsSingle = NO;
self.cellIdentifier = @"cell";
self.hideHeaderRefresh = YES;
self.hideFooterRefresh = YES;  
self.rowHeight = 100.0;
[self.tableView registerClass:[UITableViewCell class]
       forCellReuseIdentifier:@"cell"];
    
self.MXHeaderHeightBlock = ^CGFloat(NSInteger index) {
    if (index == 0) {
        return 0;
    }
    else {
        return 10.0;
    }
};
    
[self mx_reloadData:^(UITableViewCell *cell, NSString *item, NSIndexPath *indexPath) {
    cell.textLabel.text = item;
}];
```

## Header/Footer Refresh
```
- (void)mx_headerRefresh {
    [self.dataList removeAllObjects];
    self.mx_start = 0;
    for (NSInteger i = 0; i < 20; i++) {
        [self.dataList addObject:@(i).stringValue];
    }
    self.hideFooterRefresh = NO;
    [super mx_headerRefresh];
}

- (void)mx_footerRefresh {
    NSInteger count = (arc4random() + 1) % 20;
    for (NSInteger i = 0; i < count; i++) {
        [self.dataList addObject:@(i).stringValue];
    }
    
    self.mx_start = self.dataList.count;
    [super mx_footerRefresh];
}
```

