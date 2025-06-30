#Requires AutoHotkey v2.0

resetSteps := 90
resetDy := 10
pauseAfterReset := 1

pitchSteps := 90
pitchDy := -10

*Numpad1::
{
    Loop resetSteps
    {
        DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", resetDy, "UInt", 0, "UPtr", 0)
        /**
         * ! This is a shitty workaround for the mouse not being able to move with MouseMove(), the ONLY function some-what decent enough to move the mouse effectively. Yet, it doesn't even work for some apps.
         */
    }

    Sleep pauseAfterReset

    Loop pitchSteps
    {
        DllCall("mouse_event", "UInt", 0x0001, "Int", 0, "Int", pitchDy, "UInt", 0, "UPtr", 0)
    }
}
/**
 * * Instructions: Look direction down (10° in roblox), then press Numpad1 to look 45° up and be able to jump at perfect distance.
 * FIXME: Fix said shitty workaround for the mouse not being able to move with MouseMove().
 * TODO: Also add support for looking at Yaw 45° so you can get a little extra distance.
 * toodles
 */