//
//  ViewController.m
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import "ViewController.h"
//第一种方式
#import "ZDatePicker.h"
#import "ZAContainerController.h"
//第二种方式
#import "LYDateIntervalSelectorView.h"
//第三种方式  本代码写的是这个。参考了别人的代码，搬砖
#import "HZQDatePickerView.h"

// 屏幕尺寸 ScreenRect
#define ScreenRect [UIScreen mainScreen].applicationFrame
#define ScreenRectHeight [UIScreen mainScreen].applicationFrame.size.height
#define ScreenRectWidth [UIScreen mainScreen].applicationFrame.size.width
@interface ViewController ()<AlertViewDelegate,HZQDatePickerViewDelegate>
{
    HZQDatePickerView *_pikerView;
}

@property (strong, nonatomic) UILabel *startDate;
@property (strong, nonatomic) UILabel *endDate;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
#pragma mark -
    _startDate = [UILabel new];
    _startDate.frame= CGRectMake(150, 100, 150, 40);
    _startDate.text = @"开始日期";
    _startDate.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_startDate];
    UITapGestureRecognizer *tapRecognizerWeibo=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(staropen)];
    _startDate.userInteractionEnabled = YES ;
    [_startDate addGestureRecognizer:tapRecognizerWeibo];
    
    
#pragma mark -
    _endDate = [UILabel new];
    _endDate.frame= CGRectMake(150, 200, 150, 40);
    _endDate.text = @"结束日期";
    _endDate.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_endDate];
    UITapGestureRecognizer *endTimeTap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(endopen)];
    _endDate.userInteractionEnabled = YES ;
    [_endDate addGestureRecognizer:endTimeTap];
    
    
#pragma mark - 需求：结束日期不能高于开始日期
    
   
    
}
#pragma mark - 开始日期
-(void)staropen{
    NSLog(@"开始日期");
    [self setupDateView:DateTypeOfStart];
}

#pragma mark - 结束日期
-(void)endopen{
    NSLog(@"结束日期");
    [self setupDateView:DateTypeOfEnd];
}
- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, ScreenRectWidth, ScreenRectHeight + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    // 今天开始往后的日期
    [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    // 在今天之前的日期
    // [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
}
- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"ww%d-%@", type, date);
    switch (type) {
        case DateTypeOfStart:
            _startDate.text = [NSString stringWithFormat:@"%@",date];
            
            break;
            
        case DateTypeOfEnd:
            _endDate.text = [NSString stringWithFormat:@"%@",date];
            
            break;
            
        default:
            break;
    }
}

@end
