//
//  Map.m
//  ProceduralLevelGeneration
//
//  Created by Kim Pedersen on 13/08/13.
//  Copyright (c) 2013 Kim Pedersen. All rights reserved.
//

#import "Map.h"
#import "MapTiles.h"
#import "MyScene.h"

@interface Map ()
@property (nonatomic) MapTiles *tiles;
@end
@implementation Map

+ (instancetype) mapWithGridSize:(CGSize)gridSize
{
    return [[self alloc] initWithGridSize:gridSize];
}

- (instancetype) initWithGridSize:(CGSize)gridSize
{
    if (( self = [super init] ))
    {
        self.gridSize = gridSize;
        _spawnPoint = CGPointZero;
        _exitPoint = CGPointZero;
    }
    return self;
}
- (void) generateTileGrid
{
    CGPoint startPoint = CGPointMake(self.tiles.gridSize.width / 2, self.tiles.gridSize.height / 2);
    // 1
    [self.tiles setTileType:MapTileTypeFloor at:startPoint];
    NSUInteger currentFloorCount = 1;
    // 2
    CGPoint currentPosition = startPoint;
    while ( currentFloorCount < self.maxFloorCount )
    {
        // 3
        NSInteger direction = [self randomNumberBetweenMin:1 andMax:4];
        CGPoint newPosition;
        // 4
        switch ( direction )
        {
            case 1: // Up
                newPosition = CGPointMake(currentPosition.x, currentPosition.y - 1);
                break;
            case 2: // Down
                newPosition = CGPointMake(currentPosition.x, currentPosition.y + 1);
                break;
            case 3: // Left
                newPosition = CGPointMake(currentPosition.x - 1, currentPosition.y);
                break;
            case 4: // Right
                newPosition = CGPointMake(currentPosition.x + 1, currentPosition.y);
                break;
        }
        //5
        if([self.tiles isValidTileCoordinateAt:newPosition] &&
           ![self.tiles isEdgeTileAt:newPosition] &&
           [self.tiles tileTypeAt:newPosition] == MapTileTypeNone)
        {
            currentPosition = newPosition;
            [self.tiles setTileType:MapTileTypeFloor at:currentPosition];
            currentFloorCount++;
        }
    }
    // 6
    _exitPoint = currentPosition;
    // 7
    NSLog(@"%@", [self.tiles description]);
}
- (void) generate
{
    self.tiles = [[MapTiles alloc] initWithGridSize:self.gridSize];
    [self generateTileGrid];
}
- (NSInteger) randomNumberBetweenMin:(NSInteger)min andMax:(NSInteger)max
{
    return min + arc4random() % (max - min);
}
@end
