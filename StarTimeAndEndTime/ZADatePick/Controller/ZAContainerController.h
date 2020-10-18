//
//  ZAContainerController.h
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import <UIKit/UIKit.h>
#import "ZAnimation.h"
#import "ZAContainerControllerProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface ZAContainerController : UIViewController <ZAContainerControllerProtocol>

- (instancetype)initWithContentView:(UIView *)contentView
                      animationType:(ZAnimationType)animationType;

@end

NS_ASSUME_NONNULL_END
