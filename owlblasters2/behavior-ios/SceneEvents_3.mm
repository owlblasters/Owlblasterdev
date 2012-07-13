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



@interface SceneEvents_3 : SceneScript 
{
	@public
		NSString* tempHolder;
		
float _CurWave;

float _Wavecount;

float _SpawnWhichOwls;

}
@end

@implementation SceneEvents_3

-(void)load
{
	            if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"BackgroundMscOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self loopSound:[self getSound:86]];
}

        [self createRecycledActor:[self getActorType:110] x:280 y:0 layerConst:FRONT];
        [self createRecycledActor:[self getActorType:108] x:-95 y:0 layerConst:FRONT];
        [self createRecycledActor:[self getActorType:110] x:280 y:200 layerConst:FRONT];
        [self createRecycledActor:[self getActorType:108] x:-95 y:200 layerConst:FRONT];
        [self saveGame];

    [self doPeriodically:1000 * 3 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_3* self = (SceneEvents_3*) theScript;
        if([self sameAs:[NSNumber numberWithFloat:[Script randomIntBetween:(int)0 to:(int)1]] two:[NSNumber numberWithFloat:0]])
{
            [self createRecycledActor:[self getActorType:136] x:0 y:430 layerConst:FRONT];
}

        else
{
            [self createRecycledActor:[self getActorType:136] x:200 y:430 layerConst:FRONT];
}

}]];
    [self doPeriodically:1000 * (3 - ((((int) [[self getGameAttribute:@"GameLevel"] floatValue]) % ((int) 12)) / 8)) task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_3* self = (SceneEvents_3*) theScript;
        if(![self sameAs:[NSNumber numberWithFloat:_CurWave] two:[NSNumber numberWithFloat:6]])
{
            _SpawnWhichOwls = [Script randomIntBetween:(int)0 to:(int)(((int) [[self getGameAttribute:@"GameLevel"] floatValue]) % ((int) 12))];
            if((_SpawnWhichOwls <= 3))
{
                [self createRecycledActor:[self getActorType:15] x:[Script randomIntBetween:(int)320 to:(int)0] y:480 layerConst:FRONT];
}

            else if((_SpawnWhichOwls <= 7))
{
                [self createRecycledActor:[self getActorType:112] x:[Script randomIntBetween:(int)320 to:(int)0] y:480 layerConst:FRONT];
}

            else if((_SpawnWhichOwls <= 11))
{
                [self createRecycledActor:[self getActorType:17] x:[Script randomIntBetween:(int)320 to:(int)0] y:480 layerConst:FRONT];
}

}

        for(int index0 = 0; index0 < _Wavecount; index0++)
{
            [self doLater:1000 * (index0 * .2) task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_3* self = (SceneEvents_3*) theScript;
                        _SpawnWhichOwls = [Script randomIntBetween:(int)0 to:(int)(((int) [[self getGameAttribute:@"GameLevel"] floatValue]) % ((int) 12))];
                        if((_SpawnWhichOwls <= 3))
{
                            [self createRecycledActor:[self getActorType:15] x:[Script randomIntBetween:(int)320 to:(int)0] y:480 layerConst:FRONT];
}

                        else if((_SpawnWhichOwls <= 7))
{
                            [self createRecycledActor:[self getActorType:112] x:[Script randomIntBetween:(int)320 to:(int)0] y:480 layerConst:FRONT];
}

                        else if((_SpawnWhichOwls <= 11))
{
                            [self createRecycledActor:[self getActorType:17] x:[Script randomIntBetween:(int)320 to:(int)0] y:480 layerConst:FRONT];
}

}]];
}

        _Wavecount = 0;
}]];
    [self doPeriodically:1000 * 10 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_3* self = (SceneEvents_3*) theScript;
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
    [self doPeriodically:1000 * 1 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_3* self = (SceneEvents_3*) theScript;
        [self createRecycledActor:[self getActorType:110] x:280 y:480 layerConst:FRONT];
        [self createRecycledActor:[self getActorType:108] x:-95 y:480 layerConst:FRONT];
}]];
    [self doLater:1000 * 69 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_3* self = (SceneEvents_3*) theScript;
        [self stopAllSounds];
        [self switchScene:1 leave:[self createFadeOut:((1000*.3)) color:0] enter:[self createFadeIn:((1000*.3)) color:0]];
}]];
    [self doPeriodically:1000 * 10 task:[self createRunnable:^(Runnable* parent, Script* theScript){
SceneEvents_3* self = (SceneEvents_3*) theScript;
        [self saveGame];

}]];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end