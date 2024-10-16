%%%% LILYPOND ENGRAVING QUICKSTART v4.0.1
%%%% music/parts/instrument_library/other/chords_1.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.24.1"
\language "english"

\include "../../../../resources/notationrules_chords.ily"

% Note input 
  chordMusic = \chordmode {
    \set majorSevenSymbol = \markup { "maj7" }
    \set additionalPitchPrefix = "add"
    \set chordNameExceptions = #chExceptions
    
    <a, cs e b>2 b:m7.5- | %1
    a2/cs b:m7.5-/d | %2
    <a, cs e b>2 b4:m7 fs:m7/e | %3
    <a, cs e b>1
  }

% Part definitions
  part_chordMusic = \new ChordNames \with { midiMaximumVolume = 0 } { 
    \chordMusic
  }
  
  part_chordMusic_fretboards = \new FretBoards { 
    %\chordmode chordMusic
  }
