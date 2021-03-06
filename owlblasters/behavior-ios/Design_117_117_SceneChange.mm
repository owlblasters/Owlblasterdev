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



@interface Design_117_117_SceneChange : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

Scene* _changeto;

NSString* _TextDescription;

NSString* _TextSecondrow;

}
@end

@implementation Design_117_117_SceneChange

-(void)load
{
	    [self doesCustomDrawing];
        [self saveGame];

     
     
     
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_117_117_SceneChange* self = (Design_117_117_SceneChange*) theScript;
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:_TextDescription x:5 y:10];
        [[Game game] drawString:_TextSecondrow x:5 y:30];
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_117_117_SceneChange* self = (Design_117_117_SceneChange*) theScript;
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
Design_117_117_SceneChange* self = (Design_117_117_SceneChange*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            [self switchScene:_changeto.ID leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_117_117_SceneChange* self = (Design_117_117_SceneChange*) theScript;
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