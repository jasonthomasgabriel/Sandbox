%%%% LILYPOND ENGRAVING QUICKSTART v4.0.1
%%%% resources/papersize_margins.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.24.1"

 \paper {
  #(set-paper-size "a4") % Standard, but I like to be explicit on this.
  
  top-margin = 15\mm
  bottom-margin = 7\mm
  left-margin = 15\mm
  right-margin = 12\mm
  annotate-spacing = ##t
  markup-system-spacing.basic-distance = #5
  top-system-spacing.basic-distance = #12
  last-bottom-spacing.minimum-distance = #12
  
  ragged-bottom = ##t
  ragged-last-bottom = ##f
  system-system-spacing.basic-distance = #25
}