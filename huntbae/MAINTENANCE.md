# 관리 절차

## 1. 포크를 원본과 동기화

원본 저장소는 자주 업데이트됩니다(새 스타일, 버그 수정). 내 파일은 `huntbae/` 폴더에만 있어서 동기화해도 충돌이 나지 않습니다.

방법은 세 가지입니다.

| 방법 | 절차 | 언제 |
|---|---|---|
| GitHub 웹 | 포크 페이지 → **Sync fork** → **Update branch** | 가장 간단함 |
| gh CLI | `gh repo sync Huntbae/lemo-opuscar --source lemomo-ai/lemo-opuscar` | 터미널에서 한 줄로 |
| 스크립트 | 복제한 폴더에서 `sh huntbae/sync-upstream.sh` | 로컬 복제본까지 함께 갱신 |

권장 주기: 월 1회, 또는 원본에 새 버전이 나왔을 때. 원본 페이지에서 Watch → Custom → Releases를 켜 두면 알림을 받습니다.

## 2. 플러그인 업데이트와 삭제

**업데이트** (끝나면 Claude Code 재시작)
```bash
claude plugin marketplace update lemolab && claude plugin update lemo-opuscar@lemolab
```
`~/lemo-opuscar` 라이브러리는 다음 영상을 만들 때 스스로 갱신됩니다.

**복제본을 쓰는 경우**
```bash
git pull
sh plugin/skills/lemo-opuscar/scripts/setup.sh deps
# 음성·음악 패키지를 설치했다면: sh plugin/skills/lemo-opuscar/scripts/setup.sh deps voice music
```

**삭제**
```bash
claude plugin uninstall lemo-opuscar@lemolab
rm -rf ~/lemo-opuscar
```
`~/lemo-my-styles/`(내 스타일)는 삭제해도 남습니다. 지우려면 직접 지웁니다.

## 3. 나만의 스타일 백업

내 스타일은 `~/lemo-my-styles/`에만 있습니다. Mac을 바꾸거나 폴더를 실수로 지우면 사라집니다.

방법은 세 가지입니다.

1. **비공개 저장소에 백업 (권장)**: 내 스타일에는 브랜드 자료가 들어갈 수 있으니 비공개로 둡니다.
   ```bash
   cd ~/lemo-my-styles
   git init && git add . && git commit -m "my styles backup"
   gh repo create Huntbae/lemo-my-styles --private --source . --push
   ```
2. **Google Drive 동기화 폴더에 복사**: `cp -R ~/lemo-my-styles "<Google Drive 폴더>/lemo-my-styles-backup"`
3. **이 공개 포크에 넣기 (비권장)**: STYLE.md를 고친 문서는 CC BY-NC 4.0이라 비상업 공유는 가능합니다. 하지만 브랜드 자료가 공개되고, 원본 동기화 때 관리가 복잡해집니다.

## 4. 이 폴더를 고칠 때

- 원본 파일(README.md, STYLE.md 등)은 고치지 않습니다. 고치면 동기화 때 충돌이 납니다.
- 새 지시문이나 경험은 `huntbae/PROMPTS.md`에 추가합니다.
- 고친 내용은 `huntbae/CHANGELOG.md`에 한 줄로 남깁니다.
- 실제로 써 보고 확인한 사항(예: 한국어 음성 품질)은 README.md 4절의 "상태" 칸을 갱신합니다.
