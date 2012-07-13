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



@interface Design_62_62_EquipBehavior : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

NSString* _TextDescription;

NSString* _TextSecondRow;

}
@end

@implementation Design_62_62_EquipBehavior

-(void)load
{
	     
     
     
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_62_62_EquipBehavior* self = (Design_62_62_EquipBehavior*) theScript;
        [[Game game] setFont:[ self getFont:26] size:1];
        [[Game game] drawString:_TextDescription x:2 y:3];
        [[Game game] drawString:_TextSecondRow x:2 y:23];
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_62_62_EquipBehavior* self = (Design_62_62_EquipBehavior*) theScript;
if(state == 0){
        [mActor setAnimation:@"Pressed"];
        _ispressed = TRUE;
}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_62_62_EquipBehavior* self = (Design_62_62_EquipBehavior*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            if((1 <= [[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue]))
{
                if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                    [self playSound:[self getSound:145]];
}

                for(int index0 = 0; index0 < 8; index0++)
{
                    if([self sameAs:[NSNumber numberWithFloat:[[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:index0] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                        [(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) replaceObjectAtIndex:index0 withObject:[NSNumber numberWithFloat:1]];
}

}

                [(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) replaceObjectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue] withObject:[NSNumber numberWithFloat:2]];
}

            else
{
                if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                    [self playSound:[self getSound:146]];
}

}

}

}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_62_62_EquipBehavior* self = (Design_62_62_EquipBehavior*) theScript;
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