//
//  JBWelcomeGuideActivity.h
//  小银袋
//
//  Created by MAC005 on 2018/8/1.
//

#import <UIKit/UIKit.h>
#import "XYPageControl.h"
@interface JBWelcomeGuideActivity : UIViewController<UIScrollViewDelegate>

@property(strong ,nonatomic) UIScrollView   * scrollView;
@property(strong ,nonatomic) XYPageControl  * pageControl;
@property(strong ,nonatomic) NSMutableArray * dataArray ;

@end

