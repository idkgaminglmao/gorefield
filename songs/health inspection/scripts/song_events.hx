import hxvlc.flixel.FlxVideo;

var video:FlxVideo;

function create() 
{
    video = new FlxVideo();
    video.load(Assets.getPath(Paths.video("OH_NO_AGAIN")));
    video.onEndReached.add(
        function()
        {
            canPause = true;
            startedCountdown = true;

            startTimer = new FlxTimer();

            video.dispose();

            FlxG.camera.flash(0xffD4DE8F);
        }
    );

    gf.scrollFactor.set(1, 1);
    gf.visible = false;
}

function stepHit(step:Int) 
{
    switch (step) 
    {
        case 832:
            video.play();
            canPause = false;
        case 864:
            gf.visible = true;
            
            dad.x = -500;
        case 1652:
            camFollowChars = false;
        case 1653:
            FlxTween.tween(dad, {x: 800}, 0.8);
        case 1662:
            FlxTween.cancelTweensOf(dad);
            camFollowChars = true;

            gf.visible = false;
            dad.x = -490;
    }
}