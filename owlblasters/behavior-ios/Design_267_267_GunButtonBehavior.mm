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



@interface Design_267_267_GunButtonBehavior : ActorScript 
{
	@public
		NSString* tempHolder;
		
Scene* _thisScene;

float _NumberInGunList;

float _thisPrice;

BOOL _ispressed;

Scene* _changeto;

NSString* _TextDescription;

NSString* _TextSecondrow;

}
@end

@implementation Design_267_267_GunButtonBehavior

-(void)load
{
	     
     
     
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_267_267_GunButtonBehavior* self = (Design_267_267_GunButtonBehavior*) theScript;
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:_TextDescription x:5 y:10];
        [[Game game] drawString:_TextSecondrow x:5 y:30];
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_267_267_GunButtonBehavior* self = (Design_267_267_GunButtonBehavior*) theScript;
if(state == 0){
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:[self getSound:411]];
}

        _ispressed = TRUE;
        [mActor setAnimation:@"Pressed"];
}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_267_267_GunButtonBehavior* self = (Design_267_267_GunButtonBehavior*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            [self setGameAttribute:@"CreditsNeeded" value:[NSNumber numberWithFloat:_thisPrice]];
            [self setGameAttribute:@"GunListLoc" value:[NSNumber numberWithFloat:_NumberInGunList]];
}

}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_267_267_GunButtonBehavior* self = (Design_267_267_GunButtonBehavior*) theScript;
if(state == 1){
        [mActor setAnimation:@"Up"];
        _ispressed = FALSE;
}
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end