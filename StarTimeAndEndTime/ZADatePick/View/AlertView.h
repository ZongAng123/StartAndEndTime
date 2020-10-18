//
//  AlertView.h
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import <UIKit/UIKit.h>

@class AlertView;

typedef NS_ENUM(NSUInteger, AlertViewType) {
    AlertViewTypeDatePicker,
};

@protocol AlertViewDelegate <NSObject>

@optional
- (void)alertBox:(AlertView *)alertBox didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)alertBox:(AlertView *)alertBox didSelectedResult:(id)result;

@end

NS_ASSUME_NONNULL_BEGIN

@interface AlertView : UIView <AlertViewDelegate>

@property (weak, nonatomic) id<AlertViewDelegate> delegate;

+ (instancetype)alertBoxWithType:(AlertViewType)type;

- (void)viewDidLoad;

- (void)autoLayoutSubviews;

@end

NS_ASSUME_NONNULL_END
