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



@interface Design_36_36_UpgradeButtonBehavior : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

NSString* _TextDescription;

NSString* _TextSecondRow;

}
@end

@implementation Design_36_36_UpgradeButtonBehavior

-(void)load
{
	     
     
     
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_36_36_UpgradeButtonBehavior* self = (Design_36_36_UpgradeButtonBehavior*) theScript;
        [[Game game] setFont:[ self getFont:26] size:1];
        [[Game game] drawString:_TextDescription x:2 y:3];
        [[Game game] drawString:_TextSecondRow x:2 y:23];
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_36_36_UpgradeButtonBehavior* self = (Design_36_36_UpgradeButtonBehavior*) theScript;
if(state == 0){
        [mActor setAnimation:@"Pressed"];
        _ispressed = TRUE;
}
}];
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_36_36_UpgradeButtonBehavior* self = (Design_36_36_UpgradeButtonBehavior*) theScript;
if(state == 2){
        [mActor setAnimation:@"Up"];
        if(_ispressed)
{
            _ispressed = FALSE;
            if(([[(NSMutableArray*) ([self getGameAttribute:@"Player's guns"]) objectAtIndex:[[self getGameAttribute:@"GunListLoc"] floatValue]] floatValue] >= 1))
{
                if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:0]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:7 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:8 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:2]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:9 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:3]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:10 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:4]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:11 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:5]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:12 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:6]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:13 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

                else if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"GunListLoc"] floatValue]] two:[NSNumber numberWithFloat:7]])
{
                    if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
                        [self playSound:[self getSound:144]];
}

                    [self switchScene:14 leave:[self createFadeOut:((1000*.1)) color:0] enter:[self createFadeIn:((1000*.1)) color:0]];
}

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
Design_36_36_UpgradeButtonBehavior* self = (Design_36_36_UpgradeButtonBehavior*) theScript;
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