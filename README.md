# DPEmptyDataRefresh
# 使用方法

```
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

![DPEmptyDataRefresh](https://github.com/Resory/Images/blob/master/RYNumberKeyboard.gif)
