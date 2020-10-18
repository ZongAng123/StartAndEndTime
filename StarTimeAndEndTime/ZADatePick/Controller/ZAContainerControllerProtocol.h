//
//  ZAContainerControllerProtocol.h
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "AlertView.h"

@protocol ZAContainerControllerProtocol <NSObject>

@required

- (UIView *)viewContainer;
- (AlertView *)contentView;
- (UIView *)backgroundView;

@end
