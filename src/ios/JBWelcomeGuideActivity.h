//
//  JBWelcomeGuideActivity.h
//  小银袋
//
//  Created by MAC005 on 2018/8/1.
//

#import <UIKit/UIKit.h>
@interface JBWelcomeGuideActivity : UIViewController<UIScrollViewDelegate>

@property(strong ,nonatomic) UIScrollView   * scrollView;
@property(strong ,nonatomic) UIPageControl  * pageControl;
@property(strong ,nonatomic) NSMutableArray * dataArray ;

@end

