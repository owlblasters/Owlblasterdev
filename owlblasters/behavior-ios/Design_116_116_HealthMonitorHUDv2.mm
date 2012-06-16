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



@interface Design_116_116_HealthMonitorHUDv2 : SceneScript 
{
	@public
		NSString* tempHolder;
		
float cachedHealth;

float maxHealth;

Actor* actor;

NSString* FonttoUse;

ActorType* _PlayerActor;

}
@end

@implementation Design_116_116_HealthMonitorHUDv2

-(void)load
{
	    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_116_116_HealthMonitorHUDv2* self = (Design_116_116_HealthMonitorHUDv2*) theScript;
        if((actor != nil))
{
            if([Actor isAlive:actor])
{
                cachedHealth = [self asNumber:[actor getAttributeForBehavior:@"Health for Player" att:@"currHealth"]];
                [[Game game] setFont:FonttoUse size:1];
                [[Game game] drawString:[[NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:((int) round(maxHealth))]] stringByAppendingString:[@" / " stringByAppendingString:[NSString stringWithFormat:@"%@", [NSNumber numberWithFloat:((int) round(cachedHealth))]]]] x:([self getScreenWidth] - 100) y:10];
}

}

}];
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_116_116_HealthMonitorHUDv2* self = (Design_116_116_HealthMonitorHUDv2*) theScript;
        for(Actor* actorOfType in [self getActorsOfType:_PlayerActor])
{
if(actorOfType != nil && !actorOfType.dead){
            actor = actorOfType;
}
}

        if((actor != nil))
{
            if([Actor isAlive:actor])
{
                cachedHealth = [self asNumber:[actor getAttributeForBehavior:@"Health for Player" att:@"currHealth"]];
                maxHealth = [self asNumber:[actor getAttributeForBehavior:@"Health for Player" att:@"maxHealth"]];
}

}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end