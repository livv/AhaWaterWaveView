//
//  ViewController.m
//  AhaWaterWave
//
//  Created by wei on 15/11/16.
//  Copyright © 2015年 livv. All rights reserved.
//

#import "ViewController.h"
#import "AhaWaterWaveView.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet AhaWaterWaveView * waterWave0;
@property (nonatomic, weak) IBOutlet AhaWaterWaveView * waterWave1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.waterWave1.waveOffset = 0.5;
    [self.waterWave0 waveStart];
    [self.waterWave1 waveStart];
}


@end
