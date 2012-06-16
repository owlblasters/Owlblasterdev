#import <Box2D/Box2D.h>
#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioServices.h>
#import "SceneScript.h"

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



@interface Design_60_60_SimpleMinimap : SceneScript 
{
	@public
		NSString* tempHolder;
		
Actor* _Player;

float _Width;

float _Height;

float _X;

float _Y;

float _Opacity;

UIColor* _MapColor;

UIColor* _PlayerColor;

float _PlayerX;

float _PlayerY;

float _PlayerSize;

}
@end

@implementation Design_60_60_SimpleMinimap

-(void)load
{
	    [self addWhenUpdatedListener:nil func:^(NSMutableArray* list, Script* theScript){
Design_60_60_SimpleMinimap* self = (Design_60_60_SimpleMinimap*) theScript;
        if(((_Player == nil) || !([Actor isAlive:_Player])))
{
            return;
}

        _PlayerX = (_X + (_Width * ([_Player getXCenter] / [self getSceneWidth])));
        _PlayerY = (_Y + (_Height * ([_Player getYCenter] / [self getSceneHeight])));
}];
    [self addWhenDrawingListener:nil func:^(SPRenderSupport* g, int x, int y, BOOL screen, NSMutableArray* list, Script* theScript){
Design_60_60_SimpleMinimap* self = (Design_60_60_SimpleMinimap*) theScript;
        [[Game game] setStrokeThickness:0];
        [[Game game] setColor:_MapColor];
        [[Game game] setAlpha:_Opacity/100.0];
        [[Game game] fillRect:_X y:_Y w:_Width h:_Height];
        [[Game game] setColor:_PlayerColor];
        [[Game game] setAlpha:100/100.0];
        [[Game game] fillCircle:_PlayerX y:_PlayerY radius:_PlayerSize];
}];

} 



-(void)forwardMessage:(NSString*)msg
{
	
}

@end