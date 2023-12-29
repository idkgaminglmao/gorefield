//
import funkin.game.ComboRating;
import flixel.addons.display.FlxBackdrop;


var heatWaveShader:CustomShader;

function create() 
{
    comboGroup.x += 300;
    comboGroup.y += 300;

    gameOverSong = "gameOvers/cryfield/Gorefield_Gameover_Cryfield";
	retrySFX = "gameOvers/cryfield/Continue";

    var rain_image = "stages/cryfield/lluvia";
    
    if (PlayState.instance.SONG.meta.name == 'Nocturnal Meow')
    {
        stage.stageSprites["BG_C"].color = 0xFF7C7C7C;

        for (char in [boyfriend, dad]) 
        {
            var newShader = new CustomShader("wrath");
            newShader.uDirection = 45;
            newShader.uOverlayOpacity = 0.5;
            newShader.uDistance = 30.;
            newShader.uChoke = 20.;
            newShader.uPower = char == dad ? .2 : .7;
        
            newShader.uShadeColor = [219 / 255, 106 / 255, 104 / 255];
            newShader.uOverlayColor = [41 / 255, 8 / 255, 33 / 255];
        
            var uv = char.frame.uv;
            newShader.applyRect = [uv.x, uv.y, uv.width, uv.height];

            char.danceOnBeat = !(char.forceIsOnScreen = true);
            if (FlxG.save.data.wrath) char.shader = newShader;
        }
    }

	var rain:FlxBackdrop = new FlxBackdrop(Paths.image(rain_image), 0x11, 0, -10);
    //rain.colorTransform.color = 0xFFFFFFFF;
	rain.velocity.set(-80, 1200);
    remove(stage.stageSprites["black_overlay"]);
	add(rain);
    add(stage.stageSprites["black_overlay"]);

    heatWaveShader = new CustomShader("heatwave");
    heatWaveShader.time = 0; heatWaveShader.speed = 10; 
    heatWaveShader.strength = 1.38; 

    if (FlxG.save.data.heatwave) rain.shader = heatWaveShader;

    comboRatings = [
		new ComboRating(0, "F", 0xFF941616),
		new ComboRating(0.5, "E", 0xFFCF1414),
		new ComboRating(0.7, "D", 0xFFFFAA44),
		new ComboRating(0.8, "C", 0xFFFFA02D),
		new ComboRating(0.85, "B", 0xFFFE8503),
		new ComboRating(0.9, "A", 0xFF933AB6),
		new ComboRating(0.95, "S", 0xFFB11EEA),
		new ComboRating(1, "S++", 0xFFC63BFD),
	];
}

var tottalTime:Float = 0;
function update(elapsed:Float){
    tottalTime += elapsed;
    heatWaveShader.time = tottalTime;
}

function draw(e) {
	for (char in [boyfriend, dad]) 
    {
        if (char.shader == null) continue;

        var uv = char.frame.uv;
        char.shader.applyRect = [uv.x, uv.y, uv.width, uv.height];
    }
}

function postCreate()
{
    if (PlayState.instance.SONG.meta.name == 'Nocturnal Meow')
    {
        dad.setPosition(300,0);
        boyfriend.setPosition(1450,600);
        defaultCamZoom = 1;
        strumLineDadZoom = 0.8;
        strumLineBfZoom = 1.5;
        snapCam();
    }
}