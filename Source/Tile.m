//
//  Tile.m
//  2048Tutorial
//
//  Created by Daniele Ciriello on 17/04/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Tile.h"

@implementation Tile {
	CCLabelTTF *_valueLabel;
	CCNodeColor *_backgroundNode;
}

- (id)init {
    self = [super init];
    if (self) {
        self.value = (arc4random()%2+1)*2;
    }
    return self;
}

- (void)updateValueDisplay {
    _valueLabel.string = [NSString stringWithFormat:@"%d", self.value];
    CCColor *backgroundColor = nil;
    CCColor *fontColor = nil;
    switch (self.value) {
        case 2:
            fontColor = [CCColor colorWithRed:119.f/255.f     green:110.f/255.f blue:101.f/255.f];
            backgroundColor = [CCColor colorWithRed:238.f/255.f     green:228.f/255.f blue:218.f/255.f];
            break;
        case 4:
            fontColor = [CCColor colorWithRed:119.f/255.f     green:110.f/255.f blue:101.f/255.f];
            backgroundColor = [CCColor colorWithRed:237.f/255.f green:224.f/255.f blue:200.f/255.f];
            break;
        case 8:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:242.f/255.f green:177.f/255.f blue:121.f/255.f];
            break;
        case 16:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:245.f/255.f green:149.f/255.f blue:99.f/255.f];
            break;
        case 32:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:246.f/255.f green:124.f/255.f blue:95.f/255.f];
            break;
        case 64:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:246.f/255.f green:94.f/255.f blue:59.f/255.f];
            break;
        case 128:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:237.f/255.f green:207.f/255.f blue:114.f/255.f];
            break;
        case 256:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:237.f/255.f green:204.f/255.f blue:97.f/255.f];
            break;
        case 512:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:237.f/255.f green:200.f/255.f blue:80.f/255.f];
            break;
        case 1024:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:237.f/255.f green:197.f/255.f blue:63.f/255.f];
            break;
        case 2048:
            fontColor = [CCColor colorWithRed:249.f/255.f     green:246.f/255.f blue:242.f/255.f];
            backgroundColor = [CCColor colorWithRed:237.f/255.f green:194.f/255.f blue:47.f/255.f];
            break;
        default:
            fontColor = [CCColor colorWithRed:119.f/255.f     green:110.f/255.f blue:101.f/255.f];
            backgroundColor = [CCColor colorWithRed:238.f/255.f     green:228.f/255.f blue:218.f/255.f];
            break;
    }
    _backgroundNode.color = backgroundColor;
    _valueLabel.color = fontColor;
	
}

- (void)didLoadFromCCB {
    [self updateValueDisplay];
}

@end
