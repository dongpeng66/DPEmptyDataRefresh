# DPEmptyDataRefresh
# 使用方法

```
  下载第三方DZNEmptyDataSet,因为我修改过了,所以需要你手动拖进去
  #import "UIScrollView+DPRefresh.h"
  #import "UIScrollView+DPEmptyDataSet.h"

  [self.tabView setRefreshWithHeaderBlock:^{
        [self head];
    } footerBlock:^{
        [self foot];
    }];
    
    [self.tabView setupEmptyDataText:nil verticalOffset:100 emptyImage:[UIImage imageNamed:@"sdf"] buttonText:@"" tapBlock:^{
        
    }];
```

# 效果

![DPEmptyDataRefresh](https://github.com/dongpeng66/DPEmptyDataRefresh/blob/master/data.png)
