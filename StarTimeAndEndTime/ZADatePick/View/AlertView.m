//
//  AlertView.m
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import "AlertView.h"
#import "ZDatePicker.h"

@implementation AlertView

#pragma mark - Init
+ (instancetype)alertBoxWithType:(AlertViewType)type {
    switch (type) {
        case AlertViewTypeDatePicker: {
            ZDatePicker *datePicker = [[ZDatePicker alloc] init];
            return datePicker;
        }
    }
    return nil;
}

- (void)didMoveToWindow {
    [super didMoveToWindow];
    [self viewDidLoad];
    [self autoLayoutSubviews];
}

- (void)didMoveToSuperview {
    [super didMoveToSuperview];
    [self viewDidLoad];
    [self autoLayoutSubviews];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
