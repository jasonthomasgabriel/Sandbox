%%%% LILYPOND ENGRAVING QUICKSTART v4.0.1
%%%% music/parts/global.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.24.1"

% \layout {
%   \context {
%     \Staff
%     \remove Staff_highlight_engraver
%   }
%   \context {
%     \Score
%     \consists Staff_highlight_engraver
%   }
% }

global = {
  \key a \major
  \time 4/4
  \tempo "Slowly" 4=60
  
  %\override Staff.BreathingSign.text = \markup { \musicglyph "scripts.caesura.straight" } % We need caesura in bar 4
  
  \skip 1*4 | %1-4
  \bar "||"
  
  %\override Staff.BreathingSign.text = \markup { \musicglyph "rcomma" } % Back to default for later use
  
  \mark \default
  \skip 1 | %5
  \skip 1 | %6
  \time 6/4
  \skip 1. | %7
  \time 4/4
  \skip 1 | %8
  \time 3/4
  \skip 2. | %9
  \time 5/4 
  \skip 4*5 | %10
  \bar "||"
  
  %\break
  \mark \default
  \time 4/4
  \skip 1 | %11
  \skip 1 | %12
  \skip 1*4
  \time 2,2,2,2,2,2 6/4
  \skip 1. | %17
  \bar "||"
  
  \mark \default
  \time 4/4
  \skip 1*2 | %18-19
}