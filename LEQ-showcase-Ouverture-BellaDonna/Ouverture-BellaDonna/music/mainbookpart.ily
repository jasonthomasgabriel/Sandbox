%%%% LILYPOND ENGRAVING QUICKSTART v4.0.1
%%%% music/mainbookpart.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.25.20"

\bookpart {
  \paper {
   % Depending on if your first page has to be a spread or a singular facing page, you could try some options here.
   % bookpart-level-page-numbering = ##t
   % first-page-number = #2
  }
  \header {
    % Headers are centralised (to make things easier when dealing with multiple parts).
    % If needed a header can be overwritten by restating below the include-file.
    \include "headers.ily"

    % Set the instrument and/or part name below
    instrument = "Vocal / Piano"
  }

  % Score 
    % Optionally set staff size in \layout{}, depending on needs when dealing with multiple scores.
    \score { \scoring \layout { %{ #(layout-set-staff-size 20) %} } \midi { \set Score.midiChannelMapping = #'instrument } }

  % Articulated MIDI score block %
    % (Purposely creates no visual output) %
    \score { \unfoldRepeats \articulate << \scoring >> \midi { \set Score.midiChannelMapping = #'instrument } }
}