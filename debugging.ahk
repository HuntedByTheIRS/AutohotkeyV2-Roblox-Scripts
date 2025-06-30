#Requires AutoHotkey v2.0

pitchSteps := 90
pitchDy := -10
yawDx := 8
yawSteps := 31
/**
*Numpad1::
{
    Loop pitchSteps
    {
        DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", pitchDy, "UInt", 0, "UPtr", 0)
    }
}
*Numpad2::
{
    Loop yawSteps
    {
        DllCall("mouse_event", "UInt", 0x0001, "Int", yawDx, "Int", 0, "UInt", 0, "UPtr", 0)
    }
}
* * was doing something with this, pretty much useless. do what you want with it.
*/


Numpad3:: {
    ; Edit this.
    targetRed   := 128
    targetGreen := 0
    targetBlue  := 255

    tolerance := 5
    
    MouseGetPos &x, &y
    color := PixelGetColor(x, y, "RGB")

    red   := (color >> 16) & 0xFF
    green := (color >> 8)  & 0xFF
    blue  :=  color & 0xFF

    isMatch := (
        Abs(red - targetRed) <= tolerance
        && Abs(green - targetGreen) <= tolerance
        && Abs(blue - targetBlue) <= tolerance
    )

    MsgBox "Mouse at: " x ", " y
        . "`nDetected Color: " Format("#{1:06X}", color)
        . "`nRed: " red ", Green: " green ", Blue: " blue
        . "`nTarget: " targetRed ", " targetGreen ", " targetBlue
        . "`nTolerance: ±" tolerance
        . "`nMatch? " (isMatch ? "YES ✅" : "NO ❌")
}
/**
 * * Planning to make some automation for more RNG reliant games, useable for detecting what pet or whatever you got from egg/lootbox.
 * ! AHK Color detection is FUCKED UP. A lot of colors that it reads will be off by less than 5 most of the time, the tolerance is there to make it more reliable.
 * ! This is probably not the best way to do this, but it works for me.
 */
Numpad4::
{
    DllCall("SetCursorPos", "int", 783 , "int", 512)
    ; MouseMove 783, 512, 0
}
/**
 * * Both versions work, actually it does the exact same thing, but I prefer the DllCall version just because my roblox is so fucked up 
 * * that MouseMove doesn't work while shiftlocked. SetCursorPos does though.
 */
Numpad5::
{
    DllCall("mouse_event", "UInt", 0x0001, "Int", 250, "Int", 0, "UInt", 0, "UPtr", 0)
}
/**
 * ! The same shitty workaround, MouseMove just doesn't (for what ever reason) work while having the camera locked.
 * ! Even if you use relative movement, it still doesn't work. I have no idea why, but mouse_event works, even though i'm pretty sure
 * ! MouseMove uses the same goddamn API.
 * ? Please tell me if there's a better way to do this.
 * * Literally just moves the mouse relative to where it currently is. In this case, if you are shiftlocked and press it, it'll move -9 degrees. Good for alignment.
 * * If you need to align yourself with Yaw 0, reset your character. In most games it sets your Yaw value to 0.
 * * You can then use this to look around, using 45°, wait, couldn't I just multiply the DX by 5 to be able to turn 45°?
 * * Give me a second.
 * * ...
 * * ...
 * * Wow, I am atrocious at this whole programming thing.
 * * Well at least now I don't have to make another entire script for this.
 */