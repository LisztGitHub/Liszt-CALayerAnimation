//
//  LisztViewController.m
//  Liszt_Animation
//
//  Created by Lester on 16/10/11.
//  Copyright © 2016年 Liszt高级研发群:98787555. All rights reserved.
//

#import "LisztViewController.h"
#import "CALayer+Animation.h"

/** RGBA*/
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
/** 随机颜色数组*/
#define RandomColor_Array @[RGBA(255, 91, 11, 1),RGBA(72, 165, 250, 1),RGBA(255, 162, 37, 1)]
#define RandomColor RandomColor_Array[arc4random_uniform(3)]
#define RandomImage_Array @[@"animaiton_image.jpg",@"animation_image1.png"]
#define RandomImage RandomImage_Array[arc4random_uniform(2)]




/** 设备的宽高 */
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

@interface LisztViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation LisztViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initButtons];
    
    self.titleLabel.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.titleLabel.layer.shadowOpacity = 0.9f;
    self.titleLabel.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    self.titleLabel.layer.shadowRadius = 2.0f;
    
}
-(void)initButtons{
#define Start_X 10.0f           // 第一个按钮的X坐标
#define Start_Y 20.f           // 第一个按钮的Y坐标
#define Width_Space 20        // 2个按钮之间的横间距
#define Height_Space 10.0f      // 竖间距
#define Button_Height  (SCREEN_WIDTH - 20 - 20)/3  // 高
#define Button_Width (SCREEN_WIDTH - 20 - 40)/3      // 宽
    NSArray *array = @[@"cube (正方体)",@"suckEffect (吸收)",@"oglFlip (上下翻转)",@"rippleEffect (水波)",@"pageCurl (打开书本)",@"pageUnCurl (关上书本)",@"fade (曲线)",@"Push (推送)",@"Reveal (揭开)",@"MoveIn (移动)"];
    for(NSInteger i =0; i < array.count;i++){
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:array[i] forState:UIControlStateNormal];
        [button setBackgroundColor:RandomColor];
        button.titleLabel.font = [UIFont systemFontOfSize:12.f];
        if(i==6){
            [button setImage:[UIImage imageNamed:RandomImage] forState:UIControlStateNormal];
        }
        button.tag=i;
        button.frame = CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height);
        button.layer.borderWidth = 1.5f;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.borderColor = [[UIColor cyanColor] CGColor];
        [self.view addSubview:button];
    }
}

-(void)buttonAction:(UIButton *)btn{
    btn.backgroundColor = RandomColor;
    if(btn.tag==6){
        [btn setImage:[UIImage imageNamed:RandomImage] forState:UIControlStateNormal];
    }
    [btn.layer transitionWithAnimationType:btn.tag subType:arc4random_uniform(4) curve:MediaTimingFunctionLinear duration:1.0f];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
