//
//  Map.m
//  ProceduralLevelGeneration
//
//  Created by Kim Pedersen on 13/08/13.
//  Copyright (c) 2013 Kim Pedersen. All rights reserved.
//

#import "Map.h"
//#import "MapTiles.h"
#import "MyScene.h"

//#define DEBUG_MODE 0 // set to 1 to show debug drawn collision walls - decreases performance

//static const CGFloat kMapTileSize = 32.0f; // Size of the tile sprites (assumes tiles are squares)

@interface Map ()
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
    CGPoint startPoint = CGPointMake(self.gridSize.width / 2, self.gridSize.height / 2);
    
    NSUInteger currentFloorCount = 0;
    
    while ( currentFloorCount < self.maxFloorCount )
    {
        currentFloorCount++;
    }
}
@end
