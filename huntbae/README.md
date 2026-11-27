# Lemo-Opuscar 운영 가이드 (Hunt Bae 포크)

이 폴더는 Hunt Bae가 Lemo-Opuscar를 다시 쓸 때 필요한 설치·사용·관리 절차를 모아 둔 곳입니다.
원본 파일은 건드리지 않았습니다. 그래서 원본 저장소의 업데이트를 받아도 충돌이 나지 않습니다.
포크 첫 화면의 한국어 안내는 `.github/README.md`입니다.

| 문서 | 내용 |
|---|---|
| [README.md](README.md) | 이 문서. 개요, 설치, 사용 절차, 한국어 나레이션, 라이선스, 문제 해결 |
| [PROMPTS.md](PROMPTS.md) | 채널·제품별 추천 스타일과 바로 붙여 넣는 지시문 |
| [MAINTENANCE.md](MAINTENANCE.md) | 포크 동기화, 업데이트, 나만의 스타일 백업 절차 |
| [CHANGELOG.md](CHANGELOG.md) | 이 폴더의 변경 기록 |
| [sync-upstream.sh](sync-upstream.sh) | 원본 저장소 변경을 포크로 가져오는 스크립트 |

- 원본 저장소: https://github.com/lemomo-ai/lemo-opuscar
- 포크: https://github.com/Huntbae/lemo-opuscar
- 갤러리 (스타일별 데모 영상): https://lemomo-ai.github.io/lemo-opuscar/

---

## 1. 무엇을 하는 도구인가

Claude Code 플러그인입니다. 영상 생성 AI를 쓰지 않고, 코드만으로 짧은 영상을 만듭니다.

- 99가지 스타일이 15개 분류로 들어 있습니다. 스타일마다 지시 문서(`styles/<폴더>/STYLE.md`)와 데모 영상이 있습니다.
- 한 문장으로 요청하면 Claude가 대본, 그림, 음악, 나레이션, 편집을 모두 처리해 MP4를 만듭니다.
  - 그림: HTML Canvas·WebGL·Blender로 프레임마다 그립니다.
  - 음악: 무료 샘플 라이브러리로 새로 작곡합니다.
  - 목소리: TTS로 만듭니다.
- 영상 생성 크레딧이 들지 않습니다. 대신 Claude 토큰을 꽤 씁니다.

Claude는 세 문서를 읽고 작업합니다.

| 문서 | 역할 |
|---|---|
| `DIRECTOR.md` | 연출: 이야기, 소리, 리듬, 카메라, 자체 점검 |
| `TECHNIQUE.md` | 제작: 프레임 렌더링, 음성, 음악, 믹싱 |
| `styles/<폴더>/STYLE.md` | 스타일의 모양과 소리. 이야기는 사용자 몫 |

---

## 2. 설치 (Mac, 처음 한 번)

### 2-1. 필수 도구

| 도구 | 최소 버전 | 확인 명령 |
|---|---|---|
| Node | 20 이상 | `node -v` |
| ffmpeg | 7 이상 (6.x는 오디오 길이 오류) | `ffmpeg -version` |
| Python | 3.11 이상 (또는 uv) | `python3 --version` |

```bash
brew install node ffmpeg python@3.12
```

3D·셰이더 계열 스타일은 GPU가 있으면 빠릅니다. Apple Silicon Mac이면 충분합니다.

### 2-2. 플러그인 설치 (권장)

```bash
claude plugin marketplace add lemomo-ai/lemo-opuscar
claude plugin install lemo-opuscar@lemolab
```

- 처음 쓸 때 스타일 문서와 도구가 `~/lemo-opuscar`에 내려받아집니다.
- 영상 프로젝트는 Claude Code를 실행한 폴더 안에 만들어집니다.
- 자동 업데이트: Claude Code에서 `/plugin` → Marketplaces → `lemolab` → Enable auto-update.

### 2-3. 대안: 이 포크를 직접 복제

스타일 문서를 직접 열어 보거나 고칠 때 편합니다. 영상은 `films/<이름>/`에 만들어집니다(git에는 올라가지 않음).

```bash
git clone https://github.com/Huntbae/lemo-opuscar.git ~/Projects/lemo-opuscar
cd ~/Projects/lemo-opuscar
claude
```

### 2-4. 대안: 플러그인이 이 포크를 쓰게 하기

플러그인은 기본적으로 원본 저장소에서 라이브러리를 받습니다. 이 포크를 쓰게 하려면 Claude Code를 실행하기 전에 환경 변수를 지정합니다.

```bash
export LEMO_OPUSCAR_REPO=https://github.com/Huntbae/lemo-opuscar.git
```

이 경우 포크를 원본과 동기화해 두어야 최신 수정이 반영됩니다([MAINTENANCE.md](MAINTENANCE.md)).

---

## 3. 사용 절차

### 3-1. 시작

```bash
mkdir -p ~/Films && cd ~/Films
claude
```

Claude Code에서 다음 순서로 입력합니다.

1. `/effort high` (제작자 권장 설정. 품질 차이가 큽니다.)
2. 한 문장으로 요청하거나, 처음이면 `/lemo-opuscar:lemo-opuscar`만 입력합니다.
   - 이때 언어를 먼저 묻습니다. Other를 고르고 "한국어"를 입력합니다.
   - 그다음 할 일을 묻습니다: 라이브러리 스타일로 영상 / 스타일 고쳐서 내 것으로 / 빈 페이지에서 새 스타일 / 저장해 둔 내 스타일로 영상.

### 3-2. 요청 문장의 구성

다음 요소를 한 문장에 넣으면 질문이 줄어듭니다.

| 요소 | 예 |
|---|---|
| 스타일 이름 (영문 이름 또는 폴더명) | `Exploded Teardown`, `teardown` |
| 길이 | `40-second` |
| 화면 크기 | 가로 기본 1920×1080. 쇼츠는 `vertical 1080×1920` |
| 주제 | 칼리, 마실카, 정책 해설 등 |
| 언어 | `Korean narration and subtitles` |
| 내 자료 | 나레이션 파일, 사진, 로고, 음악 |
| 스토리보드 확인 여부 | `Show me a storyboard first` |

바로 쓸 수 있는 지시문은 [PROMPTS.md](PROMPTS.md)에 있습니다.

### 3-3. Claude가 진행하는 순서

1. **브리프**: 주제에서 정할 수 없는 것, 내 자료 유무, 언어, 스토리보드 여부를 한 번에 묻습니다. 빠진 시스템 도구도 이때 알려 줍니다.
2. **트리트먼트**: 프로젝트 폴더에 `TREATMENT.md`를 씁니다(구성안 3개 중 1개 선택).
3. **룩 확인**: 실제 코드로 스타일 프레임을 그려 STYLE.md와 비교합니다.
4. **스토리보드**: 요청했을 때만 멈추고 승인을 기다립니다.
5. **제작**: 음성 → 음성 검수 → 음악 → 애니메이션 → 믹스 → 렌더.
6. **자체 점검 후 납품**: 프로젝트 폴더에 완성본과 자막(.srt)을 둡니다.

### 3-4. 시간과 비용

- 한 편에 약 30~60분이 걸립니다.
- 토큰을 많이 씁니다. 매일 대량 생산보다 대표 홍보영상, 채널 인트로, 핵심 해설 영상에 맞습니다.
- 첫 실행에는 패키지 설치가 더 걸립니다(코어 약 350MB, 음성 약 0.55GB, 악기 샘플 70~400MB씩).

---

## 4. 한국어 나레이션

원본 문서에는 한국어 음성 안내가 없습니다. 아래 내용은 코드를 읽고 정리한 것입니다.

| 방법 | 내용 | 상태 |
|---|---|---|
| 내 녹음 파일 (권장) | 직접 녹음했거나 다른 TTS로 만든 파일을 건넵니다. TTS는 기본값일 뿐이라 사용자 자료가 우선합니다 | 원본 문서에 명시됨 |
| edge-tts 한국어 음성 | `core/tts/tts_zh.py`는 edge-tts를 쓰며 다른 언어도 읽습니다. `ko-KR-SunHiNeural`(여), `ko-KR-InJoonNeural`(남) 같은 음성을 지정합니다 | 추론. 코드 주석 근거, 실제 실행 검증 필요 |
| Kokoro (기본 TTS) | 영어·중국어용입니다. 한국어에는 쓰지 않습니다 | 원본 문서 기준 |

- 음성 검수 도구(`core/tts/asr_check.py`)는 `--lang ko`를 지원합니다(`core/README.md`).
- edge-tts는 마이크로소프트 온라인 서비스입니다. 상업적으로 쓰기 전에 약관을 직접 확인해야 합니다.

요청에 다음 문장을 넣으면 됩니다.

```
Korean narration with edge-tts voice ko-KR-SunHiNeural. Split the narration line by line at every sentence end (period). Split long sentences too. Leave a clear pause between sentences; never run one sentence straight into the next. Check every line with asr_check.py --lang ko.
```

---

## 5. 나만의 스타일 만들기

라이브러리 스타일을 고치거나, 빈 페이지에서 새로 만들 수 있습니다. 브랜드 색, 로고, 캐릭터, 채널 톤을 넣습니다.

1. 질문에 하나씩 답하며 계획합니다(용도, 플랫폼, 바꿀 점, 이름). "알아서 해줘"도 됩니다.
2. 바뀌는 점의 전후 요약을 확인합니다. 동의 전에는 아무것도 저장되지 않습니다.
3. 실제 코드로 그린 스타일 프레임을 원본과 나란히 봅니다.
4. 15~30초 데모 영상을 받습니다.
5. 마음에 들면 "내 스타일로 저장"을 고릅니다.

- 저장 위치: `~/lemo-my-styles/<이름>/`
- 플러그인 업데이트나 삭제 때도 남습니다.
- 다음부터 "my <이름> style"로 부르면 됩니다.
- 백업 방법은 [MAINTENANCE.md](MAINTENANCE.md) 3절에 있습니다.

---

## 6. 라이선스 (상업적 이용 기준)

| 대상 | 라이선스 | Hunt Bae 사용 기준 |
|---|---|---|
| 내가 만든 영상 | 내 소유 | 유튜브 수익화, 홍보, 클라이언트 납품 모두 가능. 표기 의무 없음 |
| 코드 (`core/`, `tools/` 등) | MIT | 자유롭게 사용 가능 |
| 문서 (STYLE.md, 가이드 등 모든 .md) | CC BY-NC 4.0 + 추가 허가 | 내 영상 제작용으로 읽고, 고치고, 납품 프로젝트 파일에 넣는 것은 가능 |
| 데모 영상·스틸 | CC BY 4.0 | 출처 표기 후 상업적 사용 가능. 단 제3자 자료와 Clawd 캐릭터 제외 |
| 데모 나레이션 6개 | 제외 | 추출·재사용 금지 |

**상업 라이선스가 필요한 경우** (문의: lemomo.studio@gmail.com)

- STYLE.md나 가이드를 유료 상품·서비스에 넣는 경우. 예: 쇼츠 스튜디오 툴에 내장, Upwork 판매 상품에 포함, 스타일 프롬프트 판매.
- 무료라도 상업적 이익을 위해 운영하는 제품·서비스에 넣는 경우.

**주의**

- 영상에 넣는 제3자 자료(사진, 음악, 지도)는 각자의 라이선스를 따릅니다.
- 이 포크는 공개 저장소입니다. 비상업 목적의 공유는 CC BY-NC 4.0 범위 안입니다. 출처는 원본 README와 LICENSE가 그대로 있어 표기된 상태입니다.

---

## 7. 문제 해결

| 증상 | 원인 | 조치 |
|---|---|---|
| `mux.sh`가 파일이 잘렸다며 실패 | ffmpeg 6.x | `brew upgrade ffmpeg`로 7 이상 설치 |
| Manga Panels, Text Flash Cuts, Comic History Cartoon이 시작 안 됨 | 이미지 생성 도구 필요(✦) | 로그인한 Codex CLI 또는 다른 이미지 도구 준비. 없으면 다른 스타일 사용 |
| edge-tts 오류(exit 2) | 네트워크 차단 | 인터넷 연결 확인, 또는 녹음 파일 사용 |
| 업데이트 후 동작 이상 | 플러그인 캐시 | 업데이트 명령 실행 후 Claude Code 재시작 |
| 단계가 계속 멈춤 | 기타 | 원본 저장소에 이슈 등록 |

업데이트와 삭제 명령은 [MAINTENANCE.md](MAINTENANCE.md)에 있습니다.
