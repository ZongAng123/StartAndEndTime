//
//  UIColor+HexString.h
//  StarTimeAndEndTime
//
//  Created by 纵昂 on 2020/10/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (HexString)
/**
 *  十六进制的颜色转换为UIColor
 *
 *  @param color   十六进制的颜色
 *
 *  @return   UIColor
 */
+ (UIColor *)colorwithHexString:(NSString *)color;
@end

NS_ASSUME_NONNULL_END
