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



@interface Design_272_272_EquipBehavior : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

NSString* _TextDescription;

NSString* _TextSecondrow;

}
@end

@implementation Design_272_272_EquipBehavior

-(void)load
{
	    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_272_272_EquipBehavior* self = (Design_272_272_EquipBehavior*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            if((1 <= [[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]))
{
                if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                    [self playSound:[self getSound:412]];
}

                for(int index0 = 0; index0 < 8; index0++)
{
                    if([self sameAs:[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:(index0 - 1)] two:[NSNumber numberWithFloat:2]])
{
                        [(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) replaceObjectAtIndex:(index0 - 1) withObject:[NSNumber numberWithFloat:1]];
}

}

                [(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) replaceObjectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue] withObject:[NSNumber numberWithFloat:2]];
}

            else
{
                if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                    [self playSound:[self getSound:371]];
}

}

}

}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_272_272_EquipBehavior* self = (Design_272_272_EquipBehavior*) theScript;
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
Design_272_272_EquipBehavior* self = (Design_272_272_EquipBehavior*) theScript;
if(state == 1){
        [mActor setAnimation:@"Up"];
        _ispressed = FALSE;
}
}];
     
     
     
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_272_272_EquipBehavior* self = (Design_272_272_EquipBehavior*) theScript;
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:_TextDescription x:5 y:5];
        [[Game game] drawString:_TextSecondrow x:5 y:25];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end