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



@interface Design_261_261_changelist : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

NSString* _SetThisVar;

float _SetThisVarTo;

float _ListNumber;

float _ListValue;

NSString* _TextDescription;

NSString* _TextSecondrow;

}
@end

@implementation Design_261_261_changelist

-(void)load
{
	     
     
     
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_261_261_changelist* self = (Design_261_261_changelist*) theScript;
if(state == 0){
        _ispressed = TRUE;
        [mActor setAnimation:@"Pressed"];
}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_261_261_changelist* self = (Design_261_261_changelist*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            [self setGameAttribute:_ListNumber value:[NSNumber numberWithFloat:_ListValue]];
            [(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) replaceObjectAtIndex:_ListNumber withObject:[NSNumber numberWithFloat:_ListValue]];
}

}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_261_261_changelist* self = (Design_261_261_changelist*) theScript;
if(state == 1){
        [mActor setAnimation:@"Up"];
        _ispressed = FALSE;
}
}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_261_261_changelist* self = (Design_261_261_changelist*) theScript;
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:_TextDescription x:5 y:10];
        [[Game game] drawString:_TextSecondrow x:5 y:30];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end