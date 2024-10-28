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
    <a, cs e b>1 | %4
    
    \barNumberCheck 5
    
    <a, cs e b>2 e:sus2/gs %{ the desired chord is actually an Eadd9/G#, but Lilypond isn't ready for that %}| %5
    < fs, a, cs gs >2 < d fs a e' > | %6
    <a, cs e b>2 cs:m7 d | %7
    fs2:m7 < d, fs, a, e > | %8
    fs2:m7 cs4:m7 | %9
    e2:sus4 e2. | %10
    
    \barNumberCheck 11
    
    a4:sus2.7+/d d a2:sus2 | %11
    a4:sus2.7+/d d/fs a2:sus2 | %12
    d4/fs a/e b:sus4.7 b:7/ds | %13
    b2:m7.5-/d e4:sus4 e | %14
    a4:sus2.7+/d d a2:sus2 | %15
    a4:sus2.7+/d d/fs a2:sus2 | %16
    b4:m a/cs < d fs a e' >1 | %17
    
    \barNumberCheck 18
    
    a2 a/e | %18
    d2/a a | %19
    a2:7+ a:7+/cs <d fs a e'>2 | %20
    b2:m7 a/cs | %21
    e2:sus4 e | %22
    
    \barNumberCheck 23
    
    c2 b:m7 | %23
    a2:m7 g | %24
    c2 b:m7 | %25
    bf2:7+ e4:sus4 e | %26
    
    \barNumberCheck 27
    
    a4:sus2.7+/d d a2:sus2 | %27
    a4:sus2.7+/d d/fs a2:sus2 | %28
    b4:m a/cs <d fs a e'>2 | %29
    e2:sus4 e | %30
    a4:sus2.7+/d d a2:sus2 | %31
    a4:sus2.7+/d d/fs a2:sus2 | %32
    b4:m a/cs <d fs a e'>1
  }

% Part definitions
  part_chordMusic = \new ChordNames \with { midiMaximumVolume = 0 } { 
    \chordMusic
  }
  
  part_chordMusic_fretboards = \new FretBoards \with { midiMaximumVolume = 0 } { 
    %\chordMusic
  }
