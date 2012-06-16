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



@interface Design_8_8_OnGround : ActorScript 
{
	@public
		NSString* tempHolder;
		
BOOL _HitGround;

BOOL _LimitToTiles;

NSMutableArray* _ExcludedGroups;

}
@end

@implementation Design_8_8_OnGround

-(void)load
{
	    [self handlesCollisions];

    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_8_8_OnGround* self = (Design_8_8_OnGround*) theScript;
        [mActor setActorValue:@"On Ground?" value:[NSNumber numberWithBool:_HitGround]];
        _HitGround = FALSE;
}];
    [self addCollisionListener:mActor func:^(Collision* c, NSMutableArray* list, Script* theScript){
Design_8_8_OnGround* self = (Design_8_8_OnGround*) theScript;
        if([Collision collidedWithSensor:c actor:mActor])
{
            return;
}

        if((_LimitToTiles && !([Collision collidedWithTile:c actor:mActor])))
{
            return;
}

        if(([_ExcludedGroups count] > 0))
{
            for(id item in _ExcludedGroups)
{
                if([self sameAs:[NSString stringWithFormat:@"%@", item] two:[NSString stringWithFormat:@"%@", [[Game game] getGroup:c.otherShape->groupID actor:(Actor*)c.otherShape->GetBody()->GetUserData()]]])
{
                    return;
}

}

}

        if([Collision fromBottom:c actor:mActor])
{
            _HitGround = TRUE;
            return;
}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end