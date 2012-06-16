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



@interface SceneEvents_0 : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _CurWave;

float _Wavecount;

float _SpawnWhichOwls;

}
@end

@implementation SceneEvents_0

-(void)load
{
	            if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"BackgroundMscOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self loopSound:[self getSound:155]];
}

        [self createRecycledActor:[self getActorType:372] x:([self getScreenWidth] - 30) y:[self getScreenHeight] layerConst:FRONT];
        [self createRecycledActor:[self getActorType:160] x:(30 - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:160],nil]]) floatValue]) y:[self getScreenHeight] layerConst:FRONT];
        [self saveGame];

    [self doPeriodically:1000 * 3 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        if([self sameAs:[NSNumber numberWithFloat:[Script randomIntBetween:(int)0 to:(int)1]] two:[NSNumber numberWithFloat:0]])
{
            [self createRecycledActor:[self getActorType:206] x:0 y:([self getScreenHeight] - 50) layerConst:FRONT];
}

        else
{
            [self createRecycledActor:[self getActorType:206] x:([self getScreenWidth] - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:206],nil]]) floatValue]) y:([self getScreenHeight] - 50) layerConst:FRONT];
}

}]];
    [self doPeriodically:1000 * (3 - ((((int) [[self getGameAttribute:@"gameLevel"] floatValue]) % ((int) 12)) / 8)) task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        if(![self sameAs:[NSNumber numberWithFloat:_CurWave] two:[NSNumber numberWithFloat:6]])
{
            _SpawnWhichOwls = [Script randomIntBetween:(int)0 to:(int)(((int) [[self getGameAttribute:@"gameLevel"] floatValue]) % ((int) 12))];
            if((_SpawnWhichOwls <= 3))
{
                [self createRecycledActor:[self getActorType:92] x:[Script randomIntBetween:(int)20 to:(int)(([self getScreenWidth] - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:92],nil]]) floatValue]) - 20)] y:[self getScreenHeight] layerConst:FRONT];
}

            else if((_SpawnWhichOwls <= 7))
{
                [self createRecycledActor:[self getActorType:349] x:[Script randomIntBetween:(int)20 to:(int)(([self getScreenWidth] - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:349],nil]]) floatValue]) - 20)] y:[self getScreenHeight] layerConst:FRONT];
}

            else if((_SpawnWhichOwls <= 11))
{
                [self createRecycledActor:[self getActorType:424] x:[Script randomIntBetween:(int)20 to:(int)(([self getScreenWidth] - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:424],nil]]) floatValue]) - 20)] y:[self getScreenHeight] layerConst:FRONT];
}

}

        for(int index0 = 0; index0 < _Wavecount; index0++)
{
            [self doLater:1000 * (index0 * .2) task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
                        _SpawnWhichOwls = [Script randomIntBetween:(int)0 to:(int)(((int) [[self getGameAttribute:@"gameLevel"] floatValue]) % ((int) 12))];
                        if((_SpawnWhichOwls <= 3))
{
                            [self createRecycledActor:[self getActorType:92] x:[Script randomIntBetween:(int)20 to:(int)(([self getScreenWidth] - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:92],nil]]) floatValue]) - 20)] y:[self getScreenHeight] layerConst:FRONT];
}

                        else if((_SpawnWhichOwls <= 7))
{
                            [self createRecycledActor:[self getActorType:349] x:[Script randomIntBetween:(int)20 to:(int)(([self getScreenWidth] - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:349],nil]]) floatValue]) - 20)] y:[self getScreenHeight] layerConst:FRONT];
}

                        else if((_SpawnWhichOwls <= 11))
{
                            [self createRecycledActor:[self getActorType:424] x:[Script randomIntBetween:(int)20 to:(int)(([self getScreenWidth] - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:424],nil]]) floatValue]) - 20)] y:[self getScreenHeight] layerConst:FRONT];
}

}]];
}

        _Wavecount = 0;
}]];
    [self doPeriodically:1000 * 1 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        [self createRecycledActor:[self getActorType:372] x:([self getScreenWidth] - 30) y:[self getScreenHeight] layerConst:FRONT];
        [self createRecycledActor:[self getActorType:160] x:(30 - (float)[([self sayToSceneBehavior:@"SceneEvents_0" msg:@"getTheWidthOfActortype" withArgs:[NSArray arrayWithObjects:[self getActorType:160],nil]]) floatValue]) y:[self getScreenHeight] layerConst:FRONT];
}]];
    [self doPeriodically:1000 * 10 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        _CurWave = (1 + _CurWave);
        if((_CurWave < 6))
{
            _Wavecount = (_CurWave + 1);
}

        if([self sameAs:[NSNumber numberWithFloat:_CurWave] two:[NSNumber numberWithFloat:3]])
{
            _Wavecount = 5;
}

        if(([self sameAs:[NSNumber numberWithFloat:_CurWave] two:[NSNumber numberWithFloat:4]] || [self sameAs:[NSNumber numberWithFloat:_CurWave] two:[NSNumber numberWithFloat:5]]))
{
            _Wavecount = 4;
}

        if([self sameAs:[NSNumber numberWithFloat:_CurWave] two:[NSNumber numberWithFloat:6]])
{
            _Wavecount = 8;
}

}]];
    [self doLater:1000 * 69 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        [self switchScene:6 leave:[self createFadeOut:((1000*.3)) color:0] enter:[self createFadeIn:((1000*.3)) color:0]];
}]];
    [self doPeriodically:1000 * 10 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_0* self = (SceneEvents_0*) theScript;
        [self saveGame];

}]];

} 

    

/* Params are:__actortype */
- ( NSNumber*) getTheWidthOfActortype:(NSArray*)args
{
ActorType* __actortype = (ActorType*) [args objectAtIndex:0];
        return Assets.get().resources[__actortype.spriteID].width;
}


-(void)forwardMessage:(NSString*)msg
{
	
}

@end