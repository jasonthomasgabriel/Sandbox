%%%% LILYPOND ENGRAVING QUICKSTART v4.0.2
%%%% resources/headers.ily
%%%% -----------------------------------------------------------
%%%% github.com/jasonthomasgabriel/LilyPond-Engraving-Quickstart

\version "2.25.9"

% LilyPond Engraving Quickstart version number. 
LEQ_version = "LEQ v4.0.2"
 
currentDate = #(strftime "%H:%M:%S - %d-%m-%Y" (localtime (current-time)))
lilypondVersion = #(lilypond-version)

% Create a background color for a piece of text - found on LilyPond Snippet Library
  % http://lsr.di.unimi.it/LSR/Item?u=1&id=969 - contributed by Klaus Blum
  #(define-markup-command (on-color layout props color arg) (color? markup?)
    (let* ((stencil (interpret-markup layout props arg))
            (X-ext (ly:stencil-extent stencil X))
            (Y-ext (ly:stencil-extent stencil Y)))

      (ly:stencil-add 
        (stencil-with-color
          (ly:round-filled-box X-ext Y-ext 0)
          color)
        stencil)))

% To keep the actual header clean, the markup for the draftline (which I guess is now two lines) is done here.
draftversion = \markup {
  \column {
    \fill-line{
      {\null}
      \with-color #white \on-color #red \pad-markup #0.5 \concat { "DRAFT VERSION" }
    }
    \fill-line{
      {\null}
      \concat \caps { \fileversionreferencetracker " / " \currentDate " / " \lilypondVersion " / "  \LEQ_version }
    }
  }
}

publishedversion = \markup {
  \column {
    \fill-line{
      {\null}
      \with-color #white \on-color #darkgreen \pad-markup #0.5 \concat { "PUBLISHED VERSION" }
    }
    \fill-line{
      {\null}
      \concat \caps { \fileversionreferencetracker " / " \currentDate " / " \lilypondVersion " / "  \LEQ_version }
    }
  }
}

bigsongnumbermarkup = #(define-markup-command (bigsongnumbermarkup layout props arg)
                         (markup?)
                         (interpret-markup layout props
                         #{ \markup { 
                              \box \pad-markup #1 
                              {\larger \larger \larger \larger \larger \larger \larger \larger \larger \bold #arg }
                            } 
                         #}))

cueheadermarkup = #(define-markup-command (cueheadermarkup layout props arg)
                     (markup?)
                     (interpret-markup layout props
                       #{ \markup {
                            \concat \italic { \bold {"cue: "} #arg }
                          }
                       #}))

% Partial take-over from "titling-init.ly"
% Headers upside of page %
\paper {  
  % Scheme to make \caps available when using \fromproperty
  % [13-10-23] In 2.25.9 it's no longer needed to make caps available in headers like this, however this workaround is still required to get dashes around capitalised text.
  % Adaptation on the following source: https://sourceforge.net/p/testlilyissues/issues/1482/ %
  #(define-markup-command (fromproperty layout props symbol)
     (symbol?)
     (let ((m (chain-assoc-get symbol props))
           (caps? (chain-assoc-get 'caps props))
           (dash? (chain-assoc-get 'dash props)))
       (if (markup? m)
           (interpret-markup layout props
             (if dash?
                 (if caps?
                     #{ \markup \concat \caps { "- " #m " -" } #}
                     #{ \markup \concat { "- " #m " -" } #})
                 (if caps?
                     #{ \markup \caps { #m } #}
                     #{ \markup { #m } #})))
           empty-stencil)))

  #(define-markup-command (caps layout props arg) (markup?)
     (interpret-markup layout (prepend-alist-chain 'caps #t props)
       (make-smallCaps-markup arg)))

  #(define-markup-command (dash layout props dashthisup)
     (markup?)
     (interpret-markup layout (prepend-alist-chain 'dash #t props)
       #{ \markup { #dashthisup } #}))
  
  bookTitleMarkup = \markup {    
    \column {
      \fill-line {
        {\null}
        {\null}
        \smaller \smaller \smaller \smaller \typewriter \bold \fromproperty #'header:statusline
      }
      \vspace #0.25
      \fill-line{
        {\null}
        {\null}
        { \concat { \italic { \fromproperty #'header:productiontitle \hspace #1 } \fromproperty #'header:bigsongnumber }}
      }
      
      % Foreword section (experimental) %
      \vspace #0.25
      \line {
        \override #'(line-width . 110)
        \smaller
        \italic \justify-field #'header:foreword
      }
      \vspace #0.75
      % End of foreword section %
      
      \fill-line { \italic \fromproperty #'header:dedication }
      \vspace #0.1 % That's a little close, but I quite like the dedication to rest on the title very snugly.
      \column {
        \fill-line{
          \huge \larger \larger \larger \larger \larger \bold \caps \fromproperty #'header:title
        }
        \fill-line {
          \bold \caps
          \fromproperty #'header:subtitle
        }
        \vspace #-0.30
        \fill-line {
          \smaller \smaller \italic
          \fromproperty #'header:subsubtitle
        }
        \fill-line {
          \smaller \smaller \sans \italic
          \fromproperty #'header:revision
        }
        \vspace #0.75
        \fill-line {
          { \smaller \fromproperty #'header:poet }
          { \dash \caps \fromproperty #'header:instrument }
          { \smaller \fromproperty #'header:composer }
        }
        \fill-line {
          { \smaller \fromproperty #'header:meter }
          { \smaller \fromproperty #'header:arranger }
        }
      }
    }
  }

  scoreTitleMarkup = \markup {
    \column {
      \if \should-print-all-headers { \bookTitleMarkup \hspace #1 }
      \fill-line {
        { \smaller \fromproperty #'header:piece }
        { \smaller \fromproperty #'header:opus }
      }
      \vspace #0.3
      \fill-line {
        { \smaller \fromproperty #'header:cue }
        {\null}
        {\null}
      }
      \vspace #0.8
    }
  }
}

% Partial take-over from "titling-init.ly"
% Not-first-page headers and all footers %
\paper {
  oddHeaderMarkup = \markup {
    \column {
      \fill-line {
        { \italic \unless \on-first-page-of-part \smaller \smaller \sans \fromproperty #'header:revision }
        { \null }
        \line {
          \concat{ \unless \on-first-page-of-part \smaller \caps \fromproperty #'header:instrument \hspace #1 \smaller \bold \caps \unless \on-first-page-of-part \fromproperty #'header:title \hspace #1 }
          \if \should-print-page-number \unless \on-first-page-of-part \fromproperty #'page:page-number-string
        }
      }
      %\vspace #1
    }
  }

  evenHeaderMarkup = \markup {
    \column {
      \fill-line {
        \line {
          \if \should-print-page-number \unless \on-first-page-of-part \fromproperty #'page:page-number-string \hspace #1
          \unless \on-first-page-of-part \concat{ \smaller \bold \caps \fromproperty #'header:title \hspace #1 \smaller \caps \unless \on-first-page-of-part \fromproperty #'header:instrument }
        }
        {\null}
        \line { \unless \on-first-page-of-part \italic \smaller \smaller \sans \fromproperty #'header:revision }
      }
      %\vspace #1
    }
  }

  oddFooterMarkup = \markup {
    \column {
      \vspace #0.5
      \fill-line {
        %% Tagline header field only on first page in each bookpart.
        \if \on-first-page-of-part \smaller \smaller \italic \fromproperty #'header:tagline
      }
      \if \on-last-page \null
      \fill-line {
        %% Copyright header field only on last page in the book.
        \if \on-last-page \smaller \smaller \fromproperty #'header:copyright
      }
    }
  }
}