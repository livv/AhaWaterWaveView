//
//  AhaWaterWaveView.m
//  AhaWaterWave
//
//  Created by wei on 15/11/16.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "AhaWaterWaveView.h"


@interface AhaWaterWaveView()

@property (nonatomic, strong) CADisplayLink * waveDisplaylink;
@property (nonatomic, strong) CAShapeLayer  * waveLayer;

@end

@implementation AhaWaterWaveView {
    
    CGFloat _offsetX;
}


- (id)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    [self config];
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self config];
    }
    
    return self;
}

- (void)config {
    
    self.backgroundColor = [UIColor clearColor];
    self.layer.masksToBounds  = YES;
    
    self.waveAmplitude = 6;
    self.waveSpeed = 6;
    self.waveColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.3];
}


#pragma mark - public

- (void)waveStart {

    self.waveLayer.fillColor = self.waveColor.CGColor;
    [self.layer addSublayer:self.waveLayer];
    self.waveDisplaylink = [CADisplayLink displayLinkWithTarget:self selector:@selector(getCurrentWave:)];
    [self.waveDisplaylink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}

- (void)waveStop {
    [self.waveLayer removeFromSuperlayer];
    [self.waveDisplaylink invalidate];
    self.waveDisplaylink = nil;
}


#pragma mark - helpers

- (void)setWaveOffset:(CGFloat)waveOffset {
    
    _waveOffset = waveOffset;
    
    _offsetX += (_waveOffset * self.frame.size.width);
}

- (void)getCurrentWave:(CADisplayLink *)displayLink {
    
    _offsetX += self.waveSpeed;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, nil, 0, self.frame.size.height * .5);
    CGFloat y = 0.0f;
    for (float x = 0.0f; x <=  self.frame.size.width ; x++) {
        y = self.waveAmplitude * cosf((360 / self.frame.size.width) * (x * M_PI / 180) - _offsetX * M_PI / 180) + self.frame.size.height * .5;
        CGPathAddLineToPoint(path, nil, x, y);
    }
    
    CGPathAddLineToPoint(path, nil, self.frame.size.width, self.frame.size.height);
    CGPathAddLineToPoint(path, nil, 0, self.frame.size.height);
    CGPathCloseSubpath(path);

    
    self.waveLayer.path = path;
    
    CGPathRelease(path);
}


#pragma mark - getters

- (CAShapeLayer *)waveLayer {
    if (!_waveLayer) {
        _waveLayer = [CAShapeLayer layer];
    }
    return _waveLayer;
}

@end
