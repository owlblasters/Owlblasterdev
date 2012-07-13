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



@interface Design_34_34_changevalue : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

NSString* _TextDescription;

NSString* _TextSecondRow;

NSString* _SetThisVar;

float _SetThisVarTo;

}
@end

@implementation Design_34_34_changevalue

-(void)load
{
	     
     
     
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_34_34_changevalue* self = (Design_34_34_changevalue*) theScript;
        [[Game game] setFont:[ self getFont:26] size:1];
        [[Game game] drawString:_TextDescription x:5 y:10];
        [[Game game] drawString:_TextSecondRow x:5 y:30];
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_34_34_changevalue* self = (Design_34_34_changevalue*) theScript;
if(state == 0){
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:[self getSound:144]];
}

        [mActor setAnimation:@"Pressed"];
        _ispressed = TRUE;
}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_34_34_changevalue* self = (Design_34_34_changevalue*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            [self setGameAttribute:_SetThisVar value:[NSNumber numberWithFloat:_SetThisVarTo]];
}

}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_34_34_changevalue* self = (Design_34_34_changevalue*) theScript;
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