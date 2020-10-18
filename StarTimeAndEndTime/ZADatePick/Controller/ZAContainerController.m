//
//  ZAContainerController.m
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import "ZAContainerController.h"
#import "ZAppMacro.h"
#import "ZAnimation.h"

@interface ZAContainerController ()<UIViewControllerTransitioningDelegate>

@property (nonatomic) ZAnimationType animationType;

@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIView *backgroundView;
@end

@implementation ZAContainerController

#pragma mark - init
#pragma mark -

- (instancetype)init {
    if (self = [super init]) {
        [self configContainerController];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self configContainerController];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self configContainerController];
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self configContainerController];
    }
    return self;
}

- (instancetype)initWithContentView:(AlertView *)contentView
                      animationType:(ZAnimationType)animationType {
    self = [super init];
    if (self) {
        _contentView = contentView;
        _animationType = animationType;
        [self configContainerController];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    [self.view insertSubview:self.backgroundView atIndex:0];
    [self.view addSubview:self.contentView];
    [self addSingleTapGestures];
    
    [self autoLayoutSubviews];
    
}

#pragma mark - IBActions
#pragma mark -

- (void)singleTap:(UITapGestureRecognizer *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private
#pragma mark -

- (void)configContainerController {
    self.providesPresentationContextTransitionStyle = YES;
    self.definesPresentationContext = YES;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.transitioningDelegate = self;
}

- (void)addSingleTapGestures {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [self.backgroundView addGestureRecognizer:singleTap];
}

- (void)autoLayoutSubviews {

    CGFloat contentWidth = CGRectGetWidth(self.contentView.frame);
    CGFloat contentHeight = CGRectGetHeight(self.contentView.frame);

    switch (self.animationType) {
        case ZAnimationTypeBottom: {
            self.contentView.frame = CGRectMake((ZAScreenWidth-contentWidth)/2, ZAScreenHeight-contentHeight, contentWidth, contentHeight);
            break;
        }
        case ZAnimationTypeCenter: {
            self.contentView.center = self.view.center;
            break;
        }
    }
}

#pragma mark - Delegate Collection

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [ZAnimation animationWithType:self.animationType presenting:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [ZAnimation animationWithType:self.animationType presenting:NO];
}

- (UIView *)viewContainer {
    return self.view;
}

- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:self.view.bounds];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
    }
    return _backgroundView;
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
