\version "2.18.2"

\header {
  title = "Grande Fantasia Triunfal Sobre o Hino Nacional Brasileiro"
  composer = "Louis Moreau Gottschalk"
  opus = 69
}

asAuthor = \markup { "Comme l'auteur le joue." }

#(define-public (my-system-start-text::print grob)
   (grob-interpret-markup grob (ly:grob-property grob 'long-text #f)))

rhOssia = \with {
  \override InstrumentName.stencil = #my-system-start-text::print 
  \remove "Time_signature_engraver"
  alignAboveContext = "RH"
  fontSize = #-3
  \override StaffSymbol.staff-space = #(magstep -3)
  \override StaffSymbol.thickness = #(magstep -3)
}

\new PianoStaff \with {
  instrumentName = "Piano"
  \accidentalStyle "piano"
  beamExceptions = #'()
  baseMoment = #(ly:make-moment 1/4)
  beatStructure = #'(1 1 1 1)
  \override Beam.auto-knee-gap = #4
} <<
  \new Staff = "RH" {
    \key des \major
    \clef "violin"
    \tempo "Maestoso" 4 = 88
    \relative as {
      \partial 4
      <as as'>4 |
      <des f as des>~ q8. <c c'>16 <des f as des>8. <es es'>16 <f des' f>8. <ges ges'>16 |
      <as des as'>2. <des, g des'>4^\markup { \italic "Grandioso." } |
      <f des' f>2 <es as des es>4 <as c es as> |
      <des, f des'> r r as' |
      des~ des8.^\markup { \italic "ben cantato." } c16 des8. es16 f8. ges16 |
      g4 as2 as,4 |
      des~ des8. c16 es8. des16 ges8. f16 |
      <f des as>4^\markup { \italic "con espress." } <es des g,>2 <bes g>4 |
      <es des g,>4~ q8. d16 q8. f16 <g es des>8. as16 |
      <a g des>8 bes <es g, des>4 a,,8 bes <es des>16[ \appoggiatura { <bes' g> c } <bes g> <a fis> <bes g>] |
      \ottava #1
      \grace { <des' bes> es q } des,8 <c as' c> q <bes ges' bes> \grace { <ges' bes>16 c q } bes,8 <as c ges' as> q <es c' es> |
      \slashedGrace { <g des' e>8~ } <g des' e bes'>2 \slashedGrace { <f des'>8~ } <f des' as'>4 \ottava #0 f |
      \repeat unfold 2 {
        <ges es a,>8. f16 <e a,>8. f16 q8. f16 <des' a es>8. c16 |
        <<
          { <c as d,>4 <bes as d,> r q | }
          \new Staff = "RH-ossia" \with {
            \rhOssia
            instrumentName = \asAuthor
          } {
            \key des \major
            <c as d,>8 \ottava #1 d'32 c ces bes a as f d \ottava #0 \tuplet 7/4 { c ces b a as f d } bes''4 <bes, as d,> |
          }
        >>
        <c as d,>8. bes16 <a d,>8. bes16 q8. bes16 <as' d, as>8. g16 |
        <<
          { <f des g,>4 <es des g,> r q | }
          \new Staff = "RH-ossia" \with { \rhOssia } {
            \key des \major
            <f des g,>8 \ottava #1 g'32 f fes es d des bes g \ottava #0 \tuplet 7/4 { f fes es d des bes g } \ottava #1 es''4 \ottava #0 <es, des g,> |
          }
        >>
        \ottava #1
        <f des g,>8. es16 <d g,>8. es16 q8. es16 <des' g,>8. c16 |
        <c ges c,>8. <bes ges bes,>16 q8. <beses ges beses,>16 q8. <as ges as,>16 q8. \ottava #0 <as, ges c, as>16 |
        q8. <ges' bes, ges>16 q8. <f as, f>16 q8. <e g, e>16 <es ges, es>8. <as, ges>16 |
      }
      \alternative {
        { <as f>8. <es' as, f>16 q8. <d as f>16 <des as f>8. <f, des>16 <f c>8. <f bes,>16 | }
        { <as f>8. <des as f>16 q8. \ottava #1 <as' f>16 q8. <des as f>16 q8. \ottava #0 des,,16 | }
      }
    }
  }
  \new Dynamics {
    \partial 4
    s4\ff |
    s1*3 |
    s1\p |
    s1*4 |
    s1\< |
    s4 s4\! s2 |
    s1*2 |
    s2.\< s4\! |
    s1 |
    s1\< |
    s1\! |
    s1 |
    s1\f |
    s1\dim |
    s2. s4\p |
    s1\< |
    s1\! |
    s1\< |
    s1\! |
    s1 |
    s1\f |
    s2 s2\dim |
    s1 |
  }
  \new Staff = "LH" {
    \key des \major
    \clef "bass"
    \relative as,, {
      \partial 4
      <as as'>4 |
      <des, des'>2 <des'' as'>4 <des as' des>8. es'16 |
      <des, as' f'>2.\arpeggio <bes es bes'>4 |
      <as f' des'>2\arpeggio <as ges' des'>4\arpeggio <as ges' c>\arpeggio |
      <des,, des'>8 \repeat unfold 7 <as''' des f>  |
      <<
        \mergeDifferentlyHeadedOn
        {
          des,, \repeat unfold 7 <as'' des f> |
          des,, \repeat unfold 7 <as'' des f> |
          bes,, \repeat unfold 7 <bes'' des f> |
          es,, \repeat unfold 7 <bes'' des es> |
          es,, \repeat unfold 7 <bes'' des es> |
          es,, \repeat unfold 7 <bes'' des es g> |
          as,, \repeat unfold 7 <as'' c ges'> |
          des,, \clef "violin" \repeat unfold 3 <e'' g bes des> \repeat unfold 4 <f as des> |
          \repeat unfold 2 {
            \clef "bass" f,,, \clef "violin" \repeat unfold 5 <es''' f> \repeat unfold 2 <es f a> |
            \clef "bass" bes,, \clef "violin" \repeat unfold 7 <bes'' d as'> |
            \clef "bass" bes,, \clef "violin" \repeat unfold 7 <bes'' d as'> |
            \clef "bass" es,,, \repeat unfold 7 <des''' es g> |
            es,,, \repeat unfold 7 <des''' es g> |
            as,, \clef "violin" \repeat unfold 7 <as'' c ges'> |
            \clef "bass" as,, \clef "violin" \repeat unfold 7 <as'' c ges'> |
            \clef "bass" des,, \repeat unfold 7 <as'' des f> |
          }
        } \new Voice {
          \stemDown
          des,,2 s |
          des s
          bes s
          es s
          es s
          es4 s2. |
          as,2 s |
          des s |
          \repeat unfold 2 {
            f, s |
            bes s |
            bes s |
            es, s |
            es s |
            as s |
            as s |
            des s |
          }
        }
      >>
    }
  }
>>
