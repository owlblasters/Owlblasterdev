#import <Box2D/Box2D.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "SceneScript.h"

#import "Script.h"

#import "Actor.h"
#import "ActorType.h"
#import "Assets.h"
#import "Behavior.h"
#import "Collision.h"
#import "CollisionPoint.h"
#import "Game.h"
#import "GameModel.h"
#import "GroupDef.h"
#import "FadeInTransition.h"
#import "FadeOutTransition.h"
#import "Region.h"
#import "Runnable.h"
#import "Scene.h"
#import "SHThumbstick.h"
#import "Sparrow.h"
#import "Transition.h"



@interface Design_79_79_SceneSwitcher : SceneScript 
{
	@public
		NSString* tempHolder;
		
Region* _Region;

Scene* _Scene;

Actor* _Actor;

float _FadeOutTime;

float _FadeInTime;

NSMutableArray* _RegionSceneList;

NSMutableArray* _RegionScene;

float _RegionID;

NSString* _SceneName;

float _X;

float _Y;

}
@end

@implementation Design_79_79_SceneSwitcher

-(void)load
{
	    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_79_79_SceneSwitcher* self = (Design_79_79_SceneSwitcher*) theScript;
        if((((_Actor != nil) && [Actor isAlive:_Actor]) && !([self isTransitioning])))
{
            for(id item in _RegionSceneList)
{
                _RegionScene = [[Game game] addToWeakCache:[item componentsSeparatedByString:@","]];
                if(([_RegionScene count] >= 2))
{
                    _RegionID = [[_RegionScene objectAtIndex:0] floatValue];
                    
tempHolder = _SceneName;_SceneName = [[Game game] addToWeakCache:[NSString stringWithFormat:@"%@", [_RegionScene objectAtIndex:1]]];
[_SceneName retain];
[tempHolder release];
                    _Region = (Region*)(([self sayToSceneBehavior:@"Scene Switcher" msg:@"RegionWithID" withArgs:[NSArray arrayWithObjects:[NSNumber numberWithFloat:_RegionID],nil]]));
                    if([self isInRegion:_Actor r:_Region])
{
                        if(([_RegionScene count] >= 4))
{
                            _X = [[_RegionScene objectAtIndex:2] floatValue];
                            _Y = [[_RegionScene objectAtIndex:3] floatValue];
                            [[Game game] createActorInNextScene:[_Actor getType] x:_X y:_Y layer:FRONT];
}

                        [self switchScene:[[Game game] getSceneWithName:_SceneName].ID leave:[self createFadeOut:((1000*_FadeOutTime)) color:0] enter:[self createFadeIn:((1000*_FadeInTime)) color:0]];
}

}

}

}

}];

} 

    

/* Params are:__id */
- ( Region*) RegionWithID:(NSArray*)args
{
float __id = (float) [[args objectAtIndex:0] floatValue];
         
                    return [self getRegion: __id];
}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end