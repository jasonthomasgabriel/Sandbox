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
    < a b cs e >4 ~ \tuplet 3/2 { 8 a e' } <gs, b e>4 \tuplet 3/2 { gs8 e' b } < a d fs >8. a16 < a d fs >8\tenuto\mf\< < a e' gs >\tenuto | %7
    < cs e fs a >4\f ~ \tuplet 3/2 { 8 cs a' } < a, d e fs >4 <a d fs>8 <a d gs> | %8
    < cs e fs a >8. 16 ~ 4 < gs b e >4\mf | %9 
    < a b e >4\p < a b e > < gs b e >2 \once \override Hairpin.to-barline = ##f 8\tenuto\mf\< < b e a >\tenuto | %10
    
    \barNumberCheck 11
    
    < a e' gs >4\f \tuplet 3/2 { < a d fs >4 a8 } < a b e >4 ~ \tuplet 3/2 { 8 a b } | %11
    << { gs'8 a16 gs fs8 gs } \\ { < a, e' >4 < a d > } >> < a b e >4 \acciaccatura b8 \tuplet 3/2 { < cs e >8 < b e > < a e' > } | %12
    < a d a' >4\p < cs e a > < a e fs' > < a ds fs > | %13
    < d f a > 4  \tuplet 3/2 { b8 f' a } < e, a b >4 < e gs b >\mf | %14
    < a e' gs >4\f \tuplet 3/2 { < a d fs >4 a8 } < a b e >4 ~ \tuplet 3/2 { 8 a b } | %15
    << { gs'8 a16 gs fs8 gs } \\ { < a, e' >4 < a d > } >> < a b e >2 | %16
    <>\p << { d'8 e16 fs e8 a } \\ { < fs, b >4 < a cs > } >> < d e fs a >1 | %17
    
    \barNumberCheck 18
    
    <e, a cs>4\mf << { \tuplet 3/2 { cs'8 d e } } \\ { <e, a>4 } >> <e gs b e>4. << { d'16 cs } \\ { e,8 } >> | %18
    << { d'8. d,16 d'8 cs16 b cs2 } \\ { <d, fs a>4 4 <e a>4 <cs a'> } >> | %19
    \staffHighlight "yellow" % Editorial - arrows to shared bass note
    << { <e gs>4 <d fs> <e gs> <fs a> } \\ { a,2 a } >> <d e fs a>4 r16 <cs e a>8.\tenuto | %20
    \stopStaffHighlight
    <a b d fs>4\f <a b d fs> <b cs e a> <b cs e a> | %21
    <b e a>4\mf <b e a> \once \override Hairpin.to-barline = ##f <b e gs>\< <b e gs> | %22
    
    \barNumberCheck 23
    
    <g c e>8.\f <d' fs a>16 ~ 16 <a d fs>8 a16 <a d fs>4 <b d g>8. g16 | %23
    <g c e>8 g16 <g c> ~ 16 <g e'>8 g16 <b d>2 | %24
    <g c e>8. <d' fs a>16 ~ 16 <a d fs>8 a16 <a d fs>8 <b d g> <b d a'> <d b'> | %25
    <bf f' a>8. <bf d f a>16 ~ 16 <bf f'>8 a16 <b e>4 <e, gs b e> | %26
    
    \barNumberCheck 27
    
    < a e' gs >4\reminderDynamic\f \tuplet 3/2 { < a d fs >4 a8 } < a b e >4 ~ \tuplet 3/2 { 8 a b } | %27
    << { gs'8 a16 gs fs8 gs } \\ { < a, e' >4 < a d > } >> < a b e >4 \acciaccatura b8 \tuplet 3/2 { < cs e >8 < b e > < a e' > } | %28
    << { d'8 e16 fs e8 a } \\ { < fs, b >4 < a cs > } >> < d e fs a >4 <d, e fs a> | %29
    <b e a>4\mf <b e a> <b e gs> <gs b e>8\tenuto\< <b e a>\tenuto | %30
    < a e' gs >4\f \tuplet 3/2 { < a d fs >4 a8 } < a b e >4 ~ \tuplet 3/2 { 8 a b } | %31
    << { gs'8 a16 gs fs8 gs } \\ { < a, e' >4 < a d > } >> < a b e >2 | %32
    <>\p << { d'8 e16 fs e8 a } \\ { < fs, b >4 < a cs > } >> < d e fs a >1 | %33
    
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
    
    \barNumberCheck 11
    
    d,8 a' \tuplet 3/2 { d8 e4 } a,4 e' | %11
    d,4 fs a2 | %12
    <fs d'>4 e b' ds, | %13
    d2 e | %14
    d8 a' \tuplet 3/2 { d8 e4 } a,4 e' | %15
    d,4 fs a2 | %16
    b4 cs d1 | %17
    
    \barNumberCheck 18
    
    a8 e' a e a, e' a4 | %18
    a,8 e' a e a, e' a4 | %19
    a,8 e' a e cs4 a' d,, r16 <cs cs'>8.\tenuto | %20
    b2 cs | %21
    e2. <d d'>4 | %22
    
    \barNumberCheck 23
    
    c16 g' c8 c c b, b' ~ 8 b8 | %23
    a,16 a'8. a8 a g,4 g'8 g' | %24
    c,,16 g' c8 c c b, b' ~ 8 b8 | %25
    bf,8 bf' bf bf e,16 b' e a b,4 | %26
    
    \barNumberCheck 27
    
    d,8 a' \tuplet 3/2 { d8 e4 } a,4 e' | %27
    d,4 fs a2 | %28
    b,4 cs d2 | %29
    e2. <e e'>4 | %30
    d8 a' \tuplet 3/2 { d8 e4 } a,4 e' | %31
    d,4 fs a2 | %32
    b4 cs d1 | %33
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
      } { \clef bass << \removeWithTag #'score \global \removeWithTag #'score \compressMMRests { \notes_piano_lower } >> }
    >>
  }
  
% Scoring (for part only purposes)
  scoring_piano_part = {
    <<
      \part_piano_part
    >>
  }