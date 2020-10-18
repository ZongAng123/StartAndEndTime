//
//  ZAnimation.m
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import "ZAnimation.h"
#import "ZABottomAnimation.h"
#import "ZACenterAnimation.h"

@implementation ZAnimation
#pragma mark - Init

- (instancetype)initWithPresenting:(BOOL)isPresenting {
    self = [super init];
    if (self) {
        _presenting = isPresenting;
    }
    return self;
}

+ (instancetype)animationWithType:(ZAnimationType)animationType presenting:(BOOL)isPresenting {

    switch (animationType) {
        case ZAnimationTypeBottom: {
            ZABottomAnimation *bottomAnimation = [[ZABottomAnimation alloc] initWithPresenting:isPresenting];
            return bottomAnimation;
        }
        case ZAnimationTypeCenter: {
            ZACenterAnimation *centerAnimation = [[ZACenterAnimation alloc] initWithPresenting:isPresenting];
            return centerAnimation;
        }
    }
    return nil;
}

#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.25;
}


@end
