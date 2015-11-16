//
//  AhaWaterWaveView.h
//  AhaWaterWave
//
//  Created by wei on 15/11/16.
//  Copyright © 2015年 livv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AhaWaterWaveView : UIView

@property (nonatomic, assign) CGFloat waveOffset;    // Default as 0
@property (nonatomic, assign) CGFloat waveSpeed;     // Default as 6
@property (nonatomic, assign) CGFloat waveAmplitude; // Default as 6
@property (nonatomic, strong) UIColor * waveColor;   // Default as [UIColor blueColor]


- (void)waveStart;
- (void)waveStop;

@end
