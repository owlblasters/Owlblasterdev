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



@interface Design_269_269_UpgradeButtonBehavior : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

NSString* _TextDescription;

NSString* _TextSecondrow;

}
@end

@implementation Design_269_269_UpgradeButtonBehavior

-(void)load
{
	    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_269_269_UpgradeButtonBehavior* self = (Design_269_269_UpgradeButtonBehavior*) theScript;
if(state == 1){
        [mActor setAnimation:@"Up"];
        _ispressed = FALSE;
}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_269_269_UpgradeButtonBehavior* self = (Design_269_269_UpgradeButtonBehavior*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            if(([[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue] >= 1))
{
                if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                    [self switchScene:15 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                    [self switchScene:14 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                    [self switchScene:16 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:3]])
{
                    [self switchScene:17 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:4]])
{
                    [self switchScene:18 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:5]])
{
                    [self switchScene:7 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:6]])
{
                    [self switchScene:20 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:7]])
{
                    [self switchScene:21 leave:[self createFadeOut:((1000*.25)) color:0] enter:[self createFadeIn:((1000*.25)) color:0]];
}

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
Design_269_269_UpgradeButtonBehavior* self = (Design_269_269_UpgradeButtonBehavior*) theScript;
if(state == 0){
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:[self getSound:411]];
}

        _ispressed = TRUE;
        [mActor setAnimation:@"Pressed"];
}
}];
     
     
     
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_269_269_UpgradeButtonBehavior* self = (Design_269_269_UpgradeButtonBehavior*) theScript;
        [[Game game] setFont:[ self getFont:359] size:1];
        [[Game game] drawString:_TextDescription x:5 y:5];
        [[Game game] drawString:_TextSecondrow x:5 y:25];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end