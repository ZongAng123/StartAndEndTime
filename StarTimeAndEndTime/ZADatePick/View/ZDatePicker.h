//
//  ZDatePicker.h
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import "AlertView.h"

typedef NS_ENUM(NSUInteger, ZDatePickerMode) {
    ZDatePickerModeyyyyMM,
    ZDatePickerModeyyyyMMdd,
};

NS_ASSUME_NONNULL_BEGIN

@interface ZDatePicker : AlertView

@property (nonatomic) ZDatePickerMode mode;

/**
 The maximum date defaults to December 2100.12.31
 最大日期默认为2100.12.31
 */
@property (copy, nonatomic) NSString *maximumDate;

/**
 You can set the default date or default year or defalut month
 您可以设置默认日期或默认年份或默认月份
 The default select date is now
 默认选择日期是现在
 */
@property (copy, nonatomic) NSString *defaultDate;

/**
 The minimum default date is January 1900.01.01
 最小默认日期是1900.01.01年1月
 */
@property (copy, nonatomic) NSString *minimumDate;

/**
 Whether to show "today", default is yes
 是否显示“今天”，默认为是
 If today is displayed, the maximum date is now
 如果显示今天，则最大日期为现在
 If you do not show today, the minimum date defaults to January 1900, the maximum date defaults to December 2100,
 如果您今天不显示，则最小日期默认为1900年1月，最大日期默认为2100年12月，
 */
@property (nonatomic, getter = isShowToday) BOOL showToday;

/**
 Whether to display the time outside the range, the default is not
 */
@property (nonatomic, getter=iSshowOutsideDate) BOOL showOutsideDate;

/**
 You can set the default date or default year or defalut month
 Default is this year
 minimumDate <= defaultYear <= maximumDate
 */
@property (nonatomic) NSInteger defaultYear;

/**
 You can set the default date or default year or defalut month
 Default is this month
 1 < defaultMonth < 12
 */
@property (nonatomic) NSInteger defaultMonth;

/**
 You can set the default date or default year or defalut month
 Default is this month
 1 < defaultMonth < 31
 */
@property (nonatomic) NSInteger defaultDay;

/**
 Refresh the data
 */
- (void)refreshData;


@end

NS_ASSUME_NONNULL_END
