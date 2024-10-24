%%%% LILYPOND ENGRAVING QUICKSTART v4.0.2
%%%% music/parts/instrument_library/voice/soprano.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.25.20"
\language "english"

% Insert (optional) lyrics into file below
  \include "lyrics/lyrics_soprano.ily"

% Note input 
  notes_soprano = \relative c' {
    \dynamicUp % position dynamics above the staff
    
    R1*3 | %1-3
    r2 r4.^\markup{\bold \caps "Bella: " \smaller \italic "(ad lib.)"} \caesura cs16 \p d | %4
    
    \barNumberCheck 5
    
    \staffHighlight "lightsteelblue" % Editorial - Esus2/G#-chord should be an Eadd9/G#. Figure a way to fix it at some point
    e8 16 16 ~ 8 a16 16 ~ 8 e r8 cs16 d | %5
    \stopStaffHighlight
    e8 16 16 ~ 8 a16 16 4 r8. cs,16 | %6
    e8 16 16 ~ 8 16 16 8 r8 \tuplet 3/2 { r8 e a, } fs'4\mf \breathe fs8\tenuto\f gs\tenuto | %7
    a8 16 16 ~ 8 gs \tuplet 3/2 { r8 gs fs } fs8 gs | %8
    \tuplet 3/2 { a4 a fs } <>\mf\> \tuplet 3/2 { e8 e cs ~ } | %9
    \override TextScript.outside-staff-priority = #50
    cs8 r8 \xNote { b4^\markup{\smaller "(parlando)"}\p } r4 r4 \breathe \once \override Hairpin.to-barline = ##f e8^\markup{\smaller "(cantado)"}\tenuto\mf\< a\tenuto | %10
    \revert TextScript.outside-staff-priority
    
    \barNumberCheck 11
    
    gs8\f fs16 gs ~ 8 a16 e ~ e a,8 r16 \tuplet 3/2 { a8 e' a } | %11
    gs8 fs16 gs ~ 16 a r16 a ~ a4 r8 e8 | %12
    d8\p cs16 a' ~ 8 cs, b ds b fs' | %13
    r8 f8 ~4 r4 \once \override Hairpin.to-barline = ##f \tuplet 3/2 { r8 e8\tenuto\mf\< a\tenuto } | %14
    gs8\f fs16 gs ~ 8 a16 e ~ 16 a,8. \tuplet 3/2 { r8 e' a } | %15
    gs8 fs16 gs ~ 16 a8. \tuplet 3/2 { r8 cs4 } r4 | %16
    r8 d,8\p ~ 16 cs8. a4 ~ 2 \breathe r16 cs16\mf cs d | %17
  }

% Part definitions
  % Full Score Part Definition 
  part_soprano_score = \new Staff \with {
    %instrumentName = "Soprano"
    %shortInstrumentName = "S."
    midiInstrument = "flute"
    midiMinimumVolume = 0.4
  } { \clef treble \new Voice = "soprano_voice" { << \removeWithTag #'part \global \removeWithTag #'part \notes_soprano >> } }

  % Part Only Part Definition  
  part_soprano_part = \new Staff \with {
    midiInstrument = "flute"
  } { \clef treble \new Voice = "soprano_voice" { << \removeWithTag #'score \global \removeWithTag #'score \compressMMRests { \notes_soprano } >> } }

  % Attach lyrics
  part_lyrics_soprano = \new Lyrics {
    \lyricsto "soprano_voice" \lyrics_soprano
  }
  
% Scoring (for part only purposes)
  scoring_soprano_part = {
    <<
      \part_soprano_part
      \part_lyrics_soprano
    >>
  }