static var camMoveOffset:Float = 15;
static var camFollowChars:Bool = true;

function create() {camFollowChars = true; camMoveOffset = 15;}
    
function postCreate() {
    var cameraStart:FlxPoint = strumLines.members[curCameraTarget].characters[0].getCameraPosition();
    cameraStart.y -= 100; FlxG.camera.focusOn(cameraStart);
}

function onCameraMove(camMoveEvent) {
    if (camFollowChars) {
        if (camMoveEvent.strumLine != null && camMoveEvent.strumLine?.characters[0] != null) {
            var poseMovement:FlxPoint = switch (camMoveEvent.strumLine.characters[0].animation.name) {
                case "singLEFT": FlxPoint.get(-camMoveOffset, 0);
                case "singDOWN": FlxPoint.get(0, camMoveOffset);
                case "singUP": FlxPoint.get(0, -camMoveOffset);
                case "singRIGHT": FlxPoint.get(camMoveOffset, 0);
                default: FlxPoint.get(0,0);
            };
            camMoveEvent.position.x += poseMovement.x; camMoveEvent.position.y += poseMovement.y;
            poseMovement.put();
        }
    } else camMoveEvent.cancel();
}

function destroy() {camFollowChars = true; camMoveOffset = 15;}