//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Grid.h"

@implementation MainScene {
    Grid *_grid;
    CCLabelTTF *_scoreLabel;
    CCLabelTTF *_highscoreLabel;
    CCLabelTTF *_delta;
    CGPoint deltaPos;
    int oldScore;
}

- (void)dealloc {
    [_grid removeObserver:self forKeyPath:@"score"];
}

- (void)didLoadFromCCB {
    oldScore = 0;
    [_delta runAction:[CCActionSequence actionWithArray:@[[CCActionFadeOut actionWithDuration:0.f]]]];
    deltaPos = _delta.position;
    [_grid addObserver:self forKeyPath:@"score" options:0 context:NULL];
    [_grid addObserver:self
                                            forKeyPath:@"highscore"
                                               options:0
                                               context:NULL];
    // load highscore
    [self updateHighscore];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    if ([keyPath isEqualToString:@"score"]) {
        _scoreLabel.string = [NSString stringWithFormat:@"%d", _grid.score];
        _delta.string = [NSString stringWithFormat:@"+ %d", _grid.score - oldScore];
        oldScore = _grid.score;
        CGPoint endPosition = CGPointMake(deltaPos.x,deltaPos.y - 0.04f);
        CGPoint startPosition = deltaPos;
        CCActionFadeIn* fadeIn = [CCActionFadeIn actionWithDuration:0.f];
        CCActionFadeOut* fadeOut = [CCActionFadeOut actionWithDuration:0.1f];
        CCActionMoveTo *moveTo = [CCActionMoveTo actionWithDuration:.5f position:endPosition];
        CCActionMoveTo *reset = [CCActionMoveTo actionWithDuration:0.0f position:startPosition];
        //CCActionRemove *hide = [CCActionHide action];
        CCActionSequence *sequence = [CCActionSequence actionWithArray:@[fadeIn, moveTo, fadeOut, reset]];
        [_delta runAction:sequence];
        
    } else if ([keyPath isEqualToString:@"highscore"]) {
        _highscoreLabel.string = [NSString stringWithFormat:@"%d", _grid.highscore.intValue];
    }
}



- (void)updateHighscore {
    NSNumber *newHighscore = [[NSUserDefaults standardUserDefaults] objectForKey:@"highscore"];
    if (newHighscore) {
        _highscoreLabel.string = [NSString stringWithFormat:@"%d", [newHighscore intValue]];
    }
}

- (void)newGame {
    CCScene *mainScene = [CCBReader loadAsScene:@"MainScene"];
    [[CCDirector sharedDirector] replaceScene:mainScene];
}

@end