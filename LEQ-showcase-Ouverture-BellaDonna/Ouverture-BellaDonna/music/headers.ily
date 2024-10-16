%%%% LILYPOND ENGRAVING QUICKSTART v4.0.2
%%%% music/headers.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

statusline      = \draftversion % OR \publishedversion (or neither). This could help you keep track of many PDFs created before the final one.
productiontitle = "Bella/Donna"
bigsongnumber   = \markup \bigsongnumbermarkup "2"
revision        = "REV#0 16-10-24 - file started"
cue             = \markup \cueheadermarkup "Bella wears venetian mask at the end of the prologue"
dedication      = "dedication"
title           = "Ouverture"
subtitle        = "To showcase LEQ (subtitle)"
subsubtitle     = "All possible headers are displayed (subsubtitle)"
composer        = "comp: Jason Thomas Gabriel"
arranger        = "arr: Jason Thomas Gabriel"
poet            = "lyrics: Jason Thomas Gabriel"
meter           = "meter"
piece           = "piece"
opus            = "opus"

tagline         = \markup {
                      \center-column {
                        \line {\upright "MMDCCLXVI"} %Ab urbe condita
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