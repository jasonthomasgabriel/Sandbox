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
    < e a b cs >8. \p\< <d' b'>16 ~ \stemDown 16 <>\! <>\> < f d' >8. < e cs' > 4. \! \stemNeutral \caesura r8 | %4
    
    \barNumberCheck 5
    
    <>\p < a, b cs e >4  << { gs''8 e } \\ { b4 } >> <b, e fs>4 <>\< \tuplet 3/2 { e'8 fs gs } <>\! | %5
    < a, cs gs' >4 \mf\> ~ \tuplet 3/2 { 8 a, e' } <>\p << { < e gs >4 < fs d > } \\ { a,2 } >> | %6
    < a b cs e >4 ~ \tuplet 3/2 { 8 a e' } <gs, b e>4 \tuplet 3/2 { gs8 e' b } < a d fs >8. a16 \once \override Hairpin.to-barline = ##f < a d fs >8\tenuto\mf\< < a e' gs >\tenuto | %7
    < cs e fs a >4\f ~ \tuplet 3/2 { 8 cs a' } < a, d e fs >4 <a d fs>8 <a d gs> | %8
    < cs e fs a >8. 16 ~ 4 < gs b e >4\mf | %9 
    < a b e >4\p < a b e > < gs b e >2 \once \override Hairpin.to-barline = ##f 8\tenuto\mf\< < b e a >\tenuto | %10
    
    \barNumberCheck 11
    
    < a e' gs >4\f \tuplet 3/2 { < a d fs >4 a8 } < a b e >4 ~ \tuplet 3/2 { 8 a b } | %11
    \staffHighlight "lightblue" % Editorial - appogiatura is missing from piano
    << { gs'8 a16 gs fs8 gs } \\ { < a, e' >4 < a d > } >> < a b e >4 \tuplet 3/2 { < cs e >8 < b e > < a e' > } | %12
    \stopStaffHighlight
    < a d a' >4\p < cs e a > < a e fs' > < a ds fs > | %13
    < d f a > 4  \tuplet 3/2 { b8 f' a } < e, a b >4 < e gs b >\mf | %14
    < a e' gs >4\f \tuplet 3/2 { < a d fs >4 a8 } < a b e >4 ~ \tuplet 3/2 { 8 a b } | %15
    << { gs'8 a16 gs fs8 gs } \\ { < a, e' >4 < a d > } >> < a b e >2 | %16
    <>\p << { d'8 e16 fs e8 a } \\ { < fs, d >4 < a cs > } >> < d e fs a >1 | %17
  }
  
  notes_piano_lower = \relative c {
    a4 e' b, b' | %1
    cs,4 cs' d,8. a'16 d4 | %2
    a4 e' b, e8 e' | %3
    a,2 a'4. r8 | %4
    
    \barNumberCheck 5
    
    a,8. e'16 a4 gs, gs' | %5
    fs,4 fs' d,8 a' d4 | %6
    a4 e' cs, cs' <d, d'> <d d'>8\tenuto <e e'>\tenuto | %7
    <fs fs'>4 fs' <d, d'> d'8 <e, e'>8 | %8
    <fs fs'>8. <fs fs'>16 ~ 4 <cs cs'> | %9
    e2 e'2. | %10
  }

% Part definitions
  % Full Score Part Definition 
  part_piano_score = \new PianoStaff \with {
    %instrumentName = "Piano"
    %shortInstrumentName = "Pno."
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