%%%% LILYPOND ENGRAVING QUICKSTART v4.0.1
%%%% music/parts/unsorted/piano.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.24.1"
\language "english"

% Note input
  notes_piano_upper = \relative c' {
    < a b cs e >4 \p ~ \tuplet 3/2 { 8 a e' } < a, d f >4. < a e' >16 d | %1
    % an <> empty chord is used to have the hairpin span in-line parallel music and have DynamicLineSpanner do its natural actions without having to tweak many alignments
    <>\< << { cs8 e a b } \\ { a,4 < cs e > } >> < d f a b >4 \f << { a'8 f } \\ { < b, d f >4 } >> | %2
    < a b cs e >4 ~ \tuplet 3/2 { 8 a e' } <>\> < fs, a b d >4 << { cs'8 b } \\ { < fs a >4 } >> | %3 
    < e a b cs >8. \p <>\< <d' b'>16 ~ \stemDown 16 <>\! <>\> < f d' >8. < e cs' > 4. \! \stemNeutral \caesura r8 | %4
  }
  
  notes_piano_lower = \relative c {
    a4 e' b, b' | %1
    cs,4 cs' d,8. a'16 d4 | %2
    a4 e' b, e8 e' | %3
    a,2 a'4. r8 | %4
  }

% Part definitions
  % Full Score Part Definition 
  part_piano_score = \new PianoStaff \with {
    instrumentName = "Piano"
    shortInstrumentName = "Pno."
  } {
      <<
        \new Staff = "staff_piano_upper" \with {
          midiInstrument = "acoustic grand"
        } { \clef treble << \removeWithTag #'part \global \removeWithTag #'part \notes_piano_upper >> } 
        \new Staff = "staff_piano_lower" \with {
          midiInstrument = "acoustic grand"
        } { \clef bass << \removeWithTag #'part \global \removeWithTag #'part \notes_piano_lower >> }
      >>
  }

  % Part Only Part Definition
  part_piano_part = \new PianoStaff {
    <<
      \new Staff = "staff_piano_upper" \with {
        \magnifyStaff #15/17
        midiInstrument = "acoustic grand"
      } { \clef treble << \removeWithTag #'score \global \removeWithTag #'score \compressMMRests { \notes_piano_upper } >> } 
      \new Staff = "staff_piano_lower" \with {
        \magnifyStaff #15/17
        midiInstrument = "acoustic grand"
      } { \clef bass << \removeWithTag #'part \global \removeWithTag #'part \compressMMRests { \notes_piano_lower } >> }
    >>
  }
  
% Scoring (for part only purposes)
  scoring_piano_part = {
    <<
      \part_piano_part
    >>
  }