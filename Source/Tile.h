//
//  Tile.h
//  2048Tutorial
//
//  Created by Daniele Ciriello on 17/04/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Tile : CCNode

@property (nonatomic, assign) NSInteger value;
- (void)updateValueDisplay;
@property (nonatomic, assign) BOOL mergedThisRound;

@end
