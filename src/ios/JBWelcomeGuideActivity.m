//
//  JBWelcomeGuideActivity.m
//  小银袋
//
//  Created by MAC005 on 2018/8/1.
//

#import "JBWelcomeGuideActivity.h"
#define kTiYanButtonWidth 134
#define kTiYanButtonHeight 39

#define kScreenWidth [[UIScreen mainScreen]bounds].size.width
#define kScreenHeight [[UIScreen mainScreen]bounds].size.height


#define kJBUnselectPointColor [self colorWithHexString:@"#efefef"]
#define kJBselectPointColor [self colorWithHexString:@"#cc9201"]

@interface JBWelcomeGuideActivity ()
{
    UIButton * button ;
    
}

@end

@implementation JBWelcomeGuideActivity
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden=YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  createData];
    [self  createScrollView];
    [self  createPageContorl];
    //  [self  createNSTimer];// 立即体验按钮添加动画效果
    // Do any additional setup after loading the view.
}
//定时器
//-(void)createNSTimer{
//
//    NSTimer * timer =  [NSTimer scheduledTimerWithTimeInterval:2.2 target:self selector:@selector(function:) userInfo:nil repeats:YES];
//
//}
//获取数据
-(void)createData{
    self.dataArray = [NSMutableArray arrayWithObjects:@"pic_guidepage_1.png",@"pic_guidepage_2.png",@"pic_guidepage_3.png", nil];
}
//创建PageContorl
-(void)createPageContorl{
    
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, kScreenHeight-60, kScreenWidth, 40)];
    self.pageControl.numberOfPages   = [self.dataArray count];
    self.pageControl.currentPage = 0;
    self.pageControl.currentPageIndicatorTintColor =kJBselectPointColor;
    self.pageControl.pageIndicatorTintColor = kJBUnselectPointColor;
    
    [self.pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pageControl];
}
//此方法用来 点击pageControl上的圆点时 让 scrollView 停留在相应的 界面上
-(void)pageTurn:(UIPageControl*)sender  {
    
    CGSize viewSize = self.scrollView.frame.size;
    CGRect rect = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [self.scrollView scrollRectToVisible:rect animated:YES];
    
}
//创建ScrollView
-(void)createScrollView{
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    self.scrollView.backgroundColor = [UIColor orangeColor];
    self.scrollView.showsHorizontalScrollIndicator = NO ;
    self.scrollView.showsVerticalScrollIndicator   = NO ;
    self.scrollView.delegate = self ;
    self.scrollView.bounces  = NO   ;
    self.scrollView.pagingEnabled = YES ;
    self.scrollView.scrollEnabled = YES ;
    self.automaticallyAdjustsScrollViewInsets = NO ;
    self.scrollView.contentSize = CGSizeMake(kScreenWidth*self.dataArray.count, kScreenHeight);
    
    for (int i = 0; i < self.dataArray.count; i++) {
        
        UIImageView * image = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth*i,0, kScreenWidth, kScreenHeight)];
        [image  setImage:[UIImage imageNamed:self.dataArray[i]]];
        image.userInteractionEnabled = YES;
        
        if (i==self.dataArray.count-1) {
            
            
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame       = CGRectMake(kScreenWidth/2.0-kTiYanButtonWidth/2.0, kScreenHeight*0.8, kTiYanButtonWidth, kTiYanButtonHeight) ;
            button.backgroundColor=[self colorWithHexString:@"#cc9201"];
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            [button.layer setBorderWidth:1.0];
            [button.layer setMasksToBounds:YES];
            [button.layer setCornerRadius:5];
            button.layer.borderColor = [UIColor whiteColor].CGColor ;
            button.titleLabel.font = [UIFont systemFontOfSize:16];;
            [button setTintColor:[UIColor whiteColor]];
            [button addTarget:self action:@selector(bttonClick) forControlEvents:UIControlEventTouchUpInside];
            [image addSubview:button];
            
        }
        [self.scrollView addSubview:image];
    }
    [self.view addSubview:self.scrollView];
    
}
//立即体验按钮 添加 简单的动画效果
//-(void)function:(NSInteger)count{
//
//    [UIView animateWithDuration:2 animations:^{
//
//        button.frame       = CGRectMake(WIDTH/2-60, HEIGHT*0.85, 120, 30) ;
//         button.alpha = 1.0 ;
//    }completion:^(BOOL finished) {
//
//        [UIView animateWithDuration:2 animations:^{
//        button.frame       = CGRectMake(WIDTH/2-70, HEIGHT*0.85, 140, 40) ;
//        button.alpha = 0.5 ;
//        button.titleLabel.alpha = 1 ;
//        }];
//    }];
//
//}
-(void)bttonClick{
    //    跳转页面动画效果
    //    UIModalTransitionStyleCoverVertical
    //    UIModalTransitionStyleFlipHorizontal
    //    UIModalTransitionStyleCrossDissolve
    //    UIModalTransitionStylePartialCurl
    //    UIModalPresentationFullScreen
    //    UIModalPresentationPageSheet
    //    UIModalPresentationFormSheet
    //    UIModalPresentationCurrentContext
    //    UIModalPresentationCustom
    //    UIModalPresentationOverFullScreen
    //    UIModalPresentationOverCurrentContext
    //    UIModalPresentationPopover
    //    UIModalPresentationNone
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark *******************UIScrollview*********************************
//scorllview开始滚动的时候调用此方法
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    
}
// scorllview停止滚动时调用此方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ([scrollView isMemberOfClass:[UITableView class]]) {
        
    }else{
        
        int pageCount = fabs(scrollView.contentOffset.x)/scrollView.frame.size.width;
        self.pageControl.currentPage = pageCount ;
        
    }
}


-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString hasPrefix:@"#"]) cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}
@end
