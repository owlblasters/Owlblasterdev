#import <Box2D/Box2D.h>
#import <AudioToolbox/AudioServices.h>
#import <Foundation/Foundation.h>
#import "ActorScript.h"

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



@interface Design_14_14_DieinPit : ActorScript 
{
	@public
		NSString* tempHolder;
		
float _FadeTime;

float _TimeBeforeReload;

}
@end

@implementation Design_14_14_DieinPit

-(void)load
{
	    
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_14_14_DieinPit* self = (Design_14_14_DieinPit*) theScript;
        if(([mActor getYOnScreen] > [self getScreenHeight]))
{
            if(!([self isTransitioning]))
{
                [self reloadCurrentScene:[self createFadeOut:((1000*_FadeTime)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
                [mActor die];
}

}

}];

} 

    -(void)healthDepleated
{
        if([mActor isBehaviorEnabled:@"Spawn Actor Upon Death"])
{
            [mActor disableBehavior:@"Spawn Actor Upon Death"];
            [self doLater:1000 * _TimeBeforeReload task:[self createRunnable:^(Runnable* parent, Script* theScript){
Design_14_14_DieinPit* self = (Design_14_14_DieinPit*) theScript;
                        [self reloadCurrentScene:[self createFadeOut:((1000*_FadeTime)) color:0] enter:[self createFadeIn:((1000*1)) color:0]];
}]];
}

}



-(void)forwardMessage:(NSString*)msg
{
	
}

@end