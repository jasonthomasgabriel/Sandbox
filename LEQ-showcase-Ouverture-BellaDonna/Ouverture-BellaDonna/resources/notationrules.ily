%%%% LILYPOND ENGRAVING QUICKSTART v4.0.1
%%%% resources/notationrules.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.24.1"

\layout {
  \numericTimeSignature
  \accidentalStyle modern-cautionary

  \set Score.rehearsalMarkFormatter = #format-mark-box-barnumbers

  \override Staff.InstrumentName.self-alignment-X = #RIGHT
  \override Staff.InstrumentName.padding = 0.6\mm
  \override PianoStaff.InstrumentName.self-alignment-X = #RIGHT
  \override PianoStaff.InstrumentName.padding = 0.6\mm

  \override Score.MetronomeMark.Y-offset = 4\mm
  \override Score.RehearsalMark.Y-offset = 4\mm
  \override Score.ChordName.font-family = #'serif
  \override Score.LyricText.font-size = #-1
  
  \override Score.DynamicTextSpanner.font-size = #-0.5
  \override Score.TextSpanner.font-size = #-0.5

  % More comfortable staff distance for leadsheets
  %\override Score.VerticalAxisGroup.default-staff-staff-spacing.basic-distance = #13
  
  % If you want to see barnumbers on every bar for editorial purposes
  % \override Score.BarNumber.break-visibility = ##(#t #t #t)

  \context {
    \Voice
    \consists "Melody_engraver"
    % \consists "Ambitus_engraver" %Out of curiousity, I sometimes use this to check what range I use per instrument.
  }
}
