# 채널·제품별 스타일과 지시문

스타일 이름은 영문 이름이나 폴더명으로 부릅니다. 데모 영상은 갤러리에서 먼저 확인합니다: https://lemomo-ai.github.io/lemo-opuscar/

모든 지시문 앞에 `/effort high`를 먼저 입력합니다.

---

## 1. 추천 스타일 표

| 용도 | 1순위 | 대안 |
|---|---|---|
| 칼리·에듀카트 제품 홍보 | Exploded Teardown (`teardown`) | Blueprint (`blueprint`), Glass Product Render (`glass-product`), Instruction Manual Art (`instruction-manual`) |
| 마실카 노선·서비스 설명 | Transit Map (`transit-map`) | Tilt-Shift Miniature (`tilt-shift`), 3D Map Explainer (`map-explainer`) |
| 정책·정부사업 해설 채널 | Whiteboard Explainer (`whiteboard`) | Data Storytelling (`dataviz`), Swiss Motion Graphics (`swiss-motion`), Isometric Infographic (`iso-infographic`) |
| B2G 제안·성과 보고 영상 | Engineering Briefing Board (`briefing-board`) | Data Storytelling (`dataviz`), Isometric Infographic (`iso-infographic`) |
| 호롱불 야담 (옛날이야기) | 나만의 스타일 (아래 6절) | Woodcut Print (`woodcut`), Paper-cut Lightbox (`paper-lantern`), Shadow Puppetry (`shadow-puppet`), Chinese Ink Wash (`ink-wash`) |
| 베타테스트공화국 (한국사·산업 해설, 영어권) | 1920s Newsreel (`newsreel`) | Archive Light Table (`archive-lighttable`), Visual Investigation (`visual-investigation`), 3D Map Explainer (`map-explainer`) |
| 모닝 레이더 (경제·테크) | Caption News (`caption-news`) | Dark Tech Keynote (`dark-keynote`), Broadcast News Package (`news-package`) |
| 90년대 추억 쇼츠 | Liminal Found Footage (`backrooms`) | CRT ASCII Terminal (`ascii-crt`), 16-bit Pixel RPG (`pixel-rpg`) |

주의할 점

- 전통공예 계열(Ink Wash, Shadow Puppetry, Ukiyo-e, Red Paper-cut)은 중국·일본 화풍이 기본입니다. 한국 시청자용이면 6절처럼 한국식으로 바꿔 쓰는 편이 안전합니다.
- Manga Panels, Text Flash Cuts, Comic History Cartoon은 이미지 생성 도구가 있어야 시작됩니다.
- 실제 자료를 편집하는 스타일(Caption News, Newsreel 등)은 사진·영상 자료의 저작권을 먼저 확인합니다.

---

## 2. 공통 문장 (필요한 것만 덧붙임)

**한국어 나레이션 (edge-tts)**
```
Korean narration with edge-tts voice ko-KR-SunHiNeural. Split the narration line by line at every sentence end (period). Split long sentences too. Leave a clear pause between sentences; never run one sentence straight into the next. Check every line with asr_check.py --lang ko. Korean subtitles.
```

**내 나레이션 파일 사용**
```
I will provide my own Korean narration recording. Time the picture and subtitles to it.
```

**세로 쇼츠**
```
Vertical 1080×1920 for YouTube Shorts and Instagram Reels. Keep text inside the safe area.
```

**스토리보드 먼저**
```
Show me a storyboard first and wait for my approval.
```

---

## 3. 제품 홍보

**칼리 분해도 홍보 (가로)**
```
Make a 40-second film in the Exploded Teardown style about newtroM Kalli, Korea's first road-legal retro electric cycle cart. Show the frame, motor, battery and controller coming apart and back together. 1920×1080. Korean subtitles. I will provide my own Korean narration recording. Show me a storyboard first.
```

**에듀카트 설명서형 소개**
```
Make a 45-second film in the Instruction Manual Art style about Educart, an Arduino-based coding education kart for schools: unbox, assemble, upload code, drive. Korean narration with edge-tts voice ko-KR-InJoonNeural, one sentence per line with a clear pause between sentences. Korean subtitles.
```

**마실카 노선 설명 (세로 쇼츠)**
```
Make a 40-second vertical (1080×1920) film in the Transit Map style about Masil-ka, a remote-controlled autonomous village bus for depopulated rural areas: one loop linking the village hall, clinic, market and bus terminal. Korean narration with edge-tts voice ko-KR-SunHiNeural, one sentence per line with a clear pause between sentences. Korean subtitles.
```

---

## 4. 해설 채널

**정책해설 쇼츠**
```
Make a 45-second vertical (1080×1920) film in the Whiteboard Explainer style explaining Korea's regulatory sandbox for low-speed e-mobility: what it is, who can apply, what changes for a small company. Korean narration with edge-tts voice ko-KR-InJoonNeural, one sentence per line with a clear pause between sentences. Korean subtitles. Show me a storyboard first.
```

**정책 데이터 해설 (가로)**
```
Make a 60-second film in the Data Storytelling style about population decline in Korean rural counties and what it means for village transport. Use only public data I provide or that you can cite; show every source on screen. Korean narration with edge-tts voice ko-KR-SunHiNeural, one sentence per line with a clear pause between sentences. Korean subtitles.
```

**베타테스트공화국 (영어권 시청자)**
```
Make a 60-second film in the 1920s Newsreel style about how Korea built its car industry from almost nothing after the war. English narration, warm male voice. English subtitles. Use only public-domain or properly licensed archive material and list it in CREDITS.
```

---

## 5. 뉴스·추억

**모닝 레이더 쇼츠**
```
Make a 30-second vertical (1080×1920) film in the Caption News style about today's top three Korean economy and tech headlines, which I will paste below. Korean captions only, no narration. Keep it fast and readable.
```

**90년대 추억 쇼츠**
```
Make a 25-second vertical (1080×1920) film in the Liminal Found Footage style: a quiet walk through a 1990s Korean neighborhood stationery shop after closing time. No narration. Korean on-screen captions. Ambient sound only.
```

---

## 6. 나만의 스타일

**야담 채널 전용 한국 민화 스타일**
```
I want to change the Woodcut Print style into my own version for a Korean folk-tale YouTube channel: Korean minhwa (folk painting) colors, hanji paper texture, warm and slow pace, gentle traditional Korean instruments in the score. Name it Horongbul Minhwa.
```

**클랜헌트 브랜드 홍보 스타일**
```
I want to change the Swiss Motion Graphics style into my own version for Clan Hunts product promos: our brand colors and logo (I will provide them), one signal color, clean grid, upbeat electronic score. Vertical 1080×1920 and horizontal 1920×1080 both. Name it ClanHunts Grid.
```

**저장한 스타일로 영상 만들기**
```
Make a 30-second film in my Horongbul Minhwa style about a tiger who wanted to taste persimmons. Korean narration with edge-tts voice ko-KR-SunHiNeural, one sentence per line with a clear pause between sentences. Korean subtitles.
```
