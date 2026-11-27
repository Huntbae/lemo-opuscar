# Lemo-Opuscar (Hunt Bae 포크)

Claude Code가 영상 생성 AI 없이 코드만으로 짧은 영상을 만드는 스타일 툴킷입니다.
99가지 스타일 중 하나를 고르고 주제를 한 문장으로 말하면, Claude가 대본·그림·음악·나레이션·편집까지 처리해 MP4를 만듭니다.

- 원본 저장소: [lemomo-ai/lemo-opuscar](https://github.com/lemomo-ai/lemo-opuscar) (원본 영문 설명: [README.md](../README.md))
- 스타일 갤러리 (데모 영상): https://lemomo-ai.github.io/lemo-opuscar/

## 문서

| 문서 | 내용 |
|---|---|
| [운영 가이드](../huntbae/README.md) | 설치, 사용 절차, 한국어 나레이션, 라이선스, 문제 해결 |
| [지시문 모음](../huntbae/PROMPTS.md) | 채널·제품별 추천 스타일과 바로 붙여 넣는 지시문 |
| [관리 절차](../huntbae/MAINTENANCE.md) | 포크 동기화, 업데이트, 내 스타일 백업 |
| [변경 기록](../huntbae/CHANGELOG.md) | 이 포크의 변경 내역과 확인할 항목 |

## 빠른 시작 (Mac)

```bash
# 1) 필수 도구: Node 20+, ffmpeg 7+, Python 3.11+
brew install node ffmpeg python@3.12

# 2) 플러그인 설치
claude plugin marketplace add lemomo-ai/lemo-opuscar
claude plugin install lemo-opuscar@lemolab

# 3) 작업 폴더에서 Claude Code 실행
mkdir -p ~/Films && cd ~/Films && claude
```

Claude Code에서 다음 순서로 입력합니다.

1. `/effort high`
2. 요청 한 문장. 예:

```
Make a 40-second film in the Exploded Teardown style about newtroM Kalli, Korea's first road-legal retro electric cycle cart. Korean subtitles. Show me a storyboard first.
```

처음이면 `/lemo-opuscar:lemo-opuscar`만 입력해도 됩니다. 언어를 물으면 Other를 고르고 "한국어"를 입력합니다.

## 알아 둘 점

- 한 편에 30~60분이 걸리고 토큰을 많이 씁니다.
- 만든 영상은 상업적으로 써도 됩니다. 스타일 문서(STYLE.md 등)를 유료 상품이나 서비스에 넣으려면 상업 라이선스가 필요합니다([운영 가이드 6절](../huntbae/README.md#6-라이선스-상업적-이용-기준)).
- 이 포크에서 추가한 파일은 `huntbae/` 폴더와 이 파일(`.github/README.md`)뿐입니다. 원본 파일은 고치지 않아서 Sync fork로 업데이트를 받아도 충돌이 나지 않습니다.
