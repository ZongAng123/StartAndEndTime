//
//  ZABottomAnimation.m
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import "ZABottomAnimation.h"

@implementation ZABottomAnimation

#pragma mark - Private

- (void)presentAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    id<ZAContainerControllerProtocol> toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *contentView = [toVC contentView];
    UIView *backgroundView = [toVC backgroundView];
    
    backgroundView.alpha = 0.0;
    contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(contentView.frame));
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:[toVC viewContainer]];
    
    [UIView animateWithDuration:0.25 animations:^{
        backgroundView.alpha = 1.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         contentView.transform = CGAffineTransformIdentity;
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}

- (void)dismissAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    id<ZAContainerControllerProtocol> fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *contentView = [fromVC contentView];
    UIView *backgroundView = [fromVC backgroundView];
    
    contentView.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:0.25 animations:^{
        backgroundView.alpha = 0.0;
    } completion:nil];
    
    [UIView animateWithDuration:0.25
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         contentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(contentView.frame));
                     } completion:^(BOOL finished) {
                         [transitionContext completeTransition:YES];
                     }];
}


#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting) {
        [self presentAnimateTransition:transitionContext];
    }else {
        [self dismissAnimateTransition:transitionContext];
    }
}
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (self.isPresenting) {
        return 0.45;
    }
    return 0.25;
}


@end
