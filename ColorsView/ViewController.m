//
//  ViewController.m
//  ColorsView
//
//  Created by FLy on 15/2/22.
//  Copyright (c) 2015年 zmit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) CAGradientLayer *gradientLayer;
@property (strong, nonatomic) NSTimer *timer;


@end

@implementation ViewController
{
    float r;
    float g;
    float b;
    float rr;
    float gg;
    float bb;

    
    BOOL yeseno;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    r=255;
    g=1;
    b=1;
    
    yeseno=NO;
    
    rr=1;
    gg=255;
    bb=1;
    //初始化imageView
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"image"]];
//    imageView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
//    imageView.center = self.view.center;
//    [self.view addSubview:imageView];
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 30)];
    label.text=@"  Hello FLy  我们做朋友吧";
    label.font=[UIFont systemFontOfSize:23];
    label.textColor=[UIColor whiteColor];
//    label.layer.masksToBounds=YES;
    [self.view addSubview:label];
    
    
    //初始化渐变层
    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = label.bounds;
    [label.layer addSublayer:self.gradientLayer];
    
    //设置渐变颜色方向
    self.gradientLayer.startPoint = CGPointMake(0,0);
    self.gradientLayer.endPoint = CGPointMake(1, 0);
    
    //设定颜色组
    self.gradientLayer.colors = @[(__bridge id)[UIColor clearColor].CGColor,
                                  (__bridge id)[UIColor purpleColor].CGColor];
    
    //设定颜色分割点
    self.gradientLayer.locations = @[@(0.0f) ,@(1.0f)];
    
    //定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1f
                                                  target:self
                                                selector:@selector(TimerEvent)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)TimerEvent
{
    
    //定时改变颜色
    if ( yeseno==YES) {
        
        r+=arc4random()%10+10;
        g-=arc4random()%10+10;
        b-=arc4random()%10+10;
        rr-=arc4random()%10+10;
        gg+=arc4random()%10+10;
        bb-=arc4random()%10+10;
        
        if (r>250) {
            yeseno=NO;
        }
        
    }else if (yeseno==NO)
    {
        r-=arc4random()%10+10;
        g+=arc4random()%10+10;
        b+=arc4random()%10+10;
        rr+=arc4random()%10+10;
        gg-=arc4random()%10+10;
        bb+=arc4random()%10+10;
        if (r<0) {
            yeseno=YES;
        }
    }
    
   
    
    
    self.gradientLayer.colors = @[(__bridge id)[UIColor colorWithRed:r / 255.0
                                                               green:g / 255.0
                                                                blue:b / 255.0
                                                               alpha:1.0].CGColor,
                                  (__bridge id)[UIColor colorWithRed:rr / 255.0
                                                               green:gg / 255.0
                                                                blue:bb / 255.0
                                                               alpha:1.0].CGColor];
    
    //定时改变分割点
    self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
}

@end
