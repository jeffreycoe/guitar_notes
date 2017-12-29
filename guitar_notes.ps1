# guitar_notes.ps1
# Author: Jeffrey Coe
# https://github.com/jeffreycoe/guitar_notes

[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

$eString = "E","F","F#/Gb","G","G#/Ab","A","A#/Bb","B","C","C#/Db","D","D#/Eb","E"
$aString = "A","A#/Bb","B","C","C#/Db","D","D#/Eb","E","F","F#/Gb","G","G#/Ab","A"
$dString = "D","D#/Eb","E","F","F#/Gb","G","G#/Ab","A","A#/Bb","B","C","C#/Db","D"
$gString = "G","G#/Ab","A","A#/Bb","B","C","C#/Db","D","D#/Eb","E","F","F#/Gb","G"
$bString = "B","C","C#/Db","D","D#/Eb","E","F","F#/Gb","G","G#/Ab","A","A#/Bb","B"

$frets = "0","1st","2nd","3rd","4th","5th","6th","7th","8th","9th","10th","11th","12th"
$strings = 1,2,3,4,5,6

$randomFret = Get-Random -minimum 0 -maximum 13
$randomString = Get-Random -minimum 0 -maximum 6

$fret = $frets[$randomFret]
$string = $strings[$randomString]

switch($string)
{
  1 {
    $note = $eString[$randomFret]
    $string = "1st"
  }
  2 {
    $note = $bString[$randomFret]
    $string = "2nd"
  }
  3 {
    $note = $gString[$randomFret]
    $string = "3rd"
  }
  4 {
    $note = $dString[$randomFret]
    $string = "4th"
  }
  5 {
    $note = $aString[$randomFret]
    $string = "5th"
  }
  6 {
    $note = $eString[$randomFret]
    $string = "6th"
  }
}

$icon = [System.Drawing.SystemIcons]::Information
$notifyBalloon = New-Object System.Windows.Forms.NotifyIcon

$notifyBalloon.Icon = $icon
$notifyBalloon.BalloonTipText = "What note is on the $fret fret $string string?"
$notifyBalloon.BalloonTipTitle = "Guitar Notes"

$notifyBalloon.Visible = $True
$notifyBalloon.ShowBalloonTip(15000)

$notifyBalloon = New-Object System.Windows.Forms.NotifyIcon

$notifyBalloon.Icon = $icon
$notifyBalloon.BalloonTipText = "Answer is: $note"
$notifyBalloon.BalloonTipTitle = "Guitar Notes - Answer"

$notifyBalloon.Visible = $True
$notifyBalloon.ShowBalloonTip(5000)
