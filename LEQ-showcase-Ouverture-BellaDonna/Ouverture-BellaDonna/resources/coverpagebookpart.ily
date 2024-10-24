%%%% LILYPOND ENGRAVING QUICKSTART v4.0.1
%%%% music/coverpagebookpart.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.25.20"

\bookpart {
  \paper {
    % Prevent coverpage from taking up a page number
    bookpart-level-page-numbering = ##t

    % A modified set of the header definitions with non-scalable font sizes, so the coverpage will always look the same
    \include "headerderdefinitions_extension_coverpage.ily"
  }

  \header {
    % Headers are centralised (to make things easier when dealing with multiple parts).
    % If needed a header can be overwritten by restating below the include-file.
    \include "../music/headers.ily"

    bigsongnumber   = ""
    dedication      = ""
    subtitle        = ""
    subsubtitle     = ""
    composer        = "Jason Thomas Gabriel"
    arranger        = ""
    poet            = ""
    meter           = ""
    piece           = ""
    opus            = ""

    % Set the instrument and/or part name below
    instrument = "Vocal / Piano"
  }

  % Space for optional text and/or illustrations.
  % Empty bookparts are omitted, the empty space below is to force visibility.
  \markup { 
    \vspace #10
    \column {
      \line {
        \larger \larger \justify-string "This standard coverpage is automatically generated from information in the centralised headers. In this markup-block there is room to place a custom text and/or illustration."
      }
      \vspace #1
      \line {
        \larger \larger \justify-string "This coverpage also includes an option to leave a blank page directly after it, so facing pages would be correctly positioned for double-sided print. Since this document was intended for screen, the blank page code section was left commented."
      }
      \vspace #2
      \line {
        \larger \larger \italic \justify-string "Note: Not all possible headers are shown on this coverpage. In fact this might be a good illustration of how to hide the headers you may not need on this page, without removing them from the centralised headers."
      }
    }
  }

}

% If a blank spage is required for pageturn optimalisation, uncomment below.
% \bookpart {
%   \paper {
%     % Prevent coverpage from taking up a page number
%     bookpart-level-page-numbering = ##t
%   }
% 
%   \header {
%     tagline = "(Page left blank intentionally)"
%   }
%   
%   % Empty bookparts are omitted, the empty space below is to force visibility.
%   \markup {" "}
%   
% }