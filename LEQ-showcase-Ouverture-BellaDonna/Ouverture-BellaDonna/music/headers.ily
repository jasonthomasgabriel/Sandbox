%%%% LILYPOND ENGRAVING QUICKSTART v4.0.2
%%%% music/headers.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

statusline      = \draftversion % OR \publishedversion (or neither). This could help you keep track of many PDFs created before the final one.
productiontitle = "Bella/Donna"
bigsongnumber   = \markup \bigsongnumbermarkup "1B"
revision        = "REV#1 DD-MM-YY - description of changes"
%This foreword feature needs some figuring out to allow user markup AND justified text, so it won't make it into LEQ just yet.
foreword        = 
"To showcase LEQ, all possible headers are on display.

This - as yet - experimental foreword section is currently not part of LEQ yet, because allowing markup in here is a strong desire, but it would seem I would have to give up it's justified styling to do so. I'm sure I will eventually figure out a way around this.
This section could also be used as a short scene (state) summary, as sometimes found in musical scores.
"

cue             = \markup \cueheadermarkup "Bella wears venetian mask at the end of the prologue"
dedication      = "dedication"
title           = "Ouverture"
subtitle        = "(Bella)"
subsubtitle     = "subsubtitle"
composer        = "Jason Thomas Gabriel"
arranger        = "arranger"
poet            = "poet"
meter           = "meter"
piece           = "piece"
opus            = "opus"

tagline         = \markup {
                      \center-column {
                        \line {\upright "- MMDCCLXVI -"} %Ab urbe condita
                        \with-url "<link>"
                        \line {\italic \smaller \right-align \sans \with-color #(rgb-color 0.251 0.251 0.251) "click here to listen to this composition" \with-color #(rgb-color 0.749 0.749 0.749) \italic \sans "(opens link to <website>)"}
                      }
                    }

copyright 	   = \markup { 
                      \with-url #"https://creativecommons.org/licenses/by-nc-sa/4.0/"
                      \line {
                        "© 2013 CC BY-NC-SA 4.0 To view a copy of this license, click here." 
                      }
                    }

qrcode         = \markup { % will only show on (optional) cover page
                    \qr-code #20 "<url>" 
                }

maintainer      = "jasonthomasgabriel"
maintainerEmail = "noreply@noemail.nothnx"