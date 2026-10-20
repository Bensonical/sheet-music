\version "2.22.1"

\header {
  title = "好心好報（男女合唱與小提琴重奏總譜）"
  composer = "雷頌德 曲"
  arranger = "G Major / d = 72"
}

% --- 1. 男聲聲部 (Male Voice) ---
maleVoice = \relative c' {
  \clef "treble_8"  % 男聲採用降八度高音譜號
  \key g \major
  \time 4/4
  \tempo 4 = 72

  % Intro
  R1*7 |
  
  % Verse A (男主唱)
  b4 b8 c d4. g,8 | e'4 e8 d d2 | c4 c8 b b4. g8 | a1 |
  b4 b8 c d4. g,8 | e'4 e8 d d2 | c4 c8 b a4. g8 | g1 \bar "||"
  
  % Chorus (男女交錯與合唱)
  d'2 b | e c | d4 c8 b~ b4 g | a1 |
  c2 b | a4 g8 e~ e2 | a4 b8 c~ c b4 a8 | g1 \bar "|."
}

% --- 2. 女聲聲部 (Female Voice) ---
femaleVoice = \relative c'' {
  \clef treble
  \key g \major
  \time 4/4

  % Intro
  R1*7 |
  
  % Verse A (女聲休止/進場)
  R1*4 |
  b4 b8 c d4. g,8 | e'4 e8 d d2 | c4 c8 b a4. g8 | g1 \bar "||"
  
  % Chorus (副歌對唱)
  R1*2 | d'4 c8 b~ b4 g | a1 |
  e'2 d | c4 b8 a~ a2 | c4 d8 e~ e d4 c8 | b1 \bar "|."
}

% --- 3. 小提琴聲部 (Violin Solo & Counter-melody) ---
violinPart = \relative c'' {
  \clef treble
  \key g \major
  \time 4/4

  % Intro (Solo)
  b4.( c8 d2) | a4.( b8 c2) | g4( a8 b g4 a) | a1 |
  e8( fis g a b c d4) | g4.( fis8 fis4 e) | e1 \bar "||"
  
  % Verse (Fill-in)
  R1*3 | r2 g8( d' c4) |
  \pizzicato b4\p r d r | g, r b r | e, r g r | fis1 \bar "||"
  
  % Chorus (High Counter-melody)
  \arco d'1\f | c1 | b4( c8 d~ d b4 a8) | a1 |
  e8( fis g a b c32 d e16) | e4( g8 fis~ fis4. e8) | e4( d8 d~ d2) | R1 \bar "|."
}

% --- 總譜結構整合 ---
\score {
  <<
    \new Staff \with {
      instrumentName = #"Male"
      shortInstrumentName = #"M."
    } \maleVoice

    \new Staff \with {
      instrumentName = #"Female"
      shortInstrumentName = #"F."
    } \femaleVoice

    \new Staff \with {
      instrumentName = #"Violin"
      shortInstrumentName = #"Vn."
    } \violinPart
  >>
  
  \layout {
    \context {
      \Staff \consists "Ambitus_engraver"
    }
  }
}