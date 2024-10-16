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
    r2 r4. \caesura cs16 \p d | %4
    
    e8 16 16 ~ 8 a16 16 ~ 8 e r8 cs16 d | %5
  }

% Part definitions
  % Full Score Part Definition 
  part_soprano_score = \new Staff \with {
    instrumentName = "Soprano"
    shortInstrumentName = "S."
    midiInstrument = "flute"
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