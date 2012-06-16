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



@interface Design_83_83_OnScreenButton : ActorScript 
{
	@public
		NSString* tempHolder;
		
NSString* _NormalAnimation;

NSString* _PressedAnimation;

NSString* _Control;

BOOL _KillActorinFlash;

BOOL _Touching;

}
@end

@implementation Design_83_83_OnScreenButton

-(void)load
{
	            _Touching = FALSE;
        [mActor makeAlwaysSimulate];
        [mActor anchorToScreen];
         
    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_83_83_OnScreenButton* self = (Design_83_83_OnScreenButton*) theScript;
        if((!(_Touching) && [mActor touchedActor]))
{
            _Touching = TRUE;
            if((_PressedAnimation != nil))
{
                [mActor setAnimation:_PressedAnimation];
}

            [self simulateKeyPress:_Control];
}

        if([[Game game] releasedTouch])
{
            if((_NormalAnimation != nil))
{
                [mActor setAnimation:_NormalAnimation];
}

            if(_Touching)
{
                [self simulateKeyRelease:_Control];
                _Touching = FALSE;
}

}

}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end