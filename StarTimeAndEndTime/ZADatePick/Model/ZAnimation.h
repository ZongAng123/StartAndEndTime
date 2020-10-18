//
//  ZAnimation.h
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import <Foundation/Foundation.h>
#import "ZAContainerControllerProtocol.h"
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ZAnimationType) {
    ZAnimationTypeBottom = 0,
    ZAnimationTypeCenter,
};
NS_ASSUME_NONNULL_BEGIN

@interface ZAnimation : NSObject <UIViewControllerAnimatedTransitioning>

/**
 Whether it is presenting
 */
@property (nonatomic, getter=isPresenting) BOOL presenting;

/**
 Factory method, create transition animation
 
 @param animationType Animation type
 @param isPresenting  Whether it is presenting
 @return transition animation object
 */
+ (instancetype)animationWithType:(ZAnimationType)animationType presenting:(BOOL)isPresenting;

@end

NS_ASSUME_NONNULL_END
