# UITableViewDemo
UIViewController + UITableView + MJRefresh 实践'

```
/**
reload tableview之前调用

@param block cell设置
*/
- (void)em_reloadData:(EMCellConfigBlock)block;

/**
cell identifier
*/
@property (nonatomic, copy) NSString *cellIdentifier;

/**
是否只有section或只有rows (不支持section下有多个rows) (默认 section count == 1)
*/
@property (nonatomic) BOOL sectionMode;

/**
数据源
*/
@property (nonatomic, strong) NSMutableArray *dataList;

/**
cell固定高度
*/
@property (nonatomic) CGFloat stabledCellHeight;

/**
section 头部高度
*/
@property (nonatomic) CGFloat sectionHeaderHeight;

/**
section 脚部高度
*/
@property (nonatomic) CGFloat sectionFooterHeight;

/**
配置cell高度
*/
@property (nonatomic, copy) CGFloat (^EMCellHeightBlock)(NSInteger index);

/**
配置section 头部高度
*/
@property (nonatomic, copy) CGFloat (^EMHeadHeightBlock)(NSInteger index);

/**
配置section 脚部高度
*/
@property (nonatomic, copy) CGFloat (^EMFootHeightBlock)(NSInteger index);

```


## Rows List
```
- (void)setupTableView {
    self.cellIdentifier = @"cell";
    self.refreshHeaderHidden = YES;
    self.refreshFooterHidden = YES;    
    [self.tableView registerClass:[UITableViewCell class]
        =  forCellReuseIdentifier:@"cell"];

    self.EMCellHeightBlock = ^CGFloat(NSInteger index) {
        if (index % 2 == 0) {
            return 50.0;
        }
        else {
            return 100.0;
        }
    };

    [self em_reloadData:^(UITableViewCell *cell, NSString *item) {
        cell.textLabel.text = item;
    }];
}
```
## Sections List

## Header/Footer Refresh
