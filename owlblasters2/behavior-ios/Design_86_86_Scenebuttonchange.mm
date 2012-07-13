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



@interface Design_86_86_Scenebuttonchange : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _ispressed;

float _ChangeAtlas1;

float _ChangeAtlas2;

float _ChangeAtlas3;

Scene* _changeto;

}
@end

@implementation Design_86_86_Scenebuttonchange

-(void)load
{
	     
    [self addTouchActorListener:mActor func:^(int state, NSMutableArray* list, Script* theScript){
Design_86_86_Scenebuttonchange* self = (Design_86_86_Scenebuttonchange*) theScript;
if(state == 2){
        if([self sameAs:[NSNumber numberWithFloat:[[self getGameAttribute:@"SoundEffectsOn"] floatValue]] two:[NSNumber numberWithFloat:1]])
{
            [self playSound:[self getSound:144]];
}

        [[Assets get] loadAtlas:_ChangeAtlas1];
        [[Assets get] loadAtlas:_ChangeAtlas2];
        [[Assets get] loadAtlas:_ChangeAtlas3];
        [self switchScene:_changeto.ID leave:[self createFadeOut:((1000*.05)) color:0] enter:[self createFadeIn:((1000*.05)) color:0]];
}
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end