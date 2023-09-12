#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
Width := 350
Height := 150
ItemAffix := "" ; Default Affix

#IfWinActive Path of Exile
{

  F8::
  {
    InputBox, ItemAffix, PoE Roll Stopper, Type an Item Affix, Show, Width, Height
    If (ItemAffix == "")
      MsgBox, Without an Affix RollStopper will stop all your rolls, press F8 to configure a new Affix
    Else
      MsgBox, RollStopper key is "%ItemAffix%" remember it only protects you while holding SHIFT
    return
  }
  +lbutton::
  {
    If (ItemAffix == "")
    {
      MsgBox, Without an Affix RollStopper will stop all of your rolls, press F8 to configure a new Affix
      return
    }
    clipboard := "" ; Clear clipboard
    Sleep 1
    Send, ^c
    Sleep 1
    Send, ^c ; Copy twice and sleep to avoid any eventual slowdowns
    Sleep 1
    clipboard := clipboard ; Get clipboard info
    IfInString, clipboard, %ItemAffix% ; Check if ItemAffix is the current item being clicked
    {
      SoundBeep, 400, 500
    }
    else
      click
    return
  }
}