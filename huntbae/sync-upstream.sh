#!/bin/sh
# 원본 저장소(lemomo-ai/lemo-opuscar)의 변경을 이 포크로 가져옵니다.
# 사용법: 포크를 복제한 폴더에서  sh huntbae/sync-upstream.sh
# huntbae/ 폴더만 우리 파일이라 보통 충돌이 나지 않습니다.
set -e

UPSTREAM=https://github.com/lemomo-ai/lemo-opuscar.git
BRANCH=main

cd "$(git rev-parse --show-toplevel)"

if [ -n "$(git status --porcelain)" ]; then
  echo "커밋하지 않은 변경이 있습니다. 먼저 커밋하거나 stash 하세요."
  exit 1
fi

git remote get-url upstream >/dev/null 2>&1 || git remote add upstream "$UPSTREAM"

echo "원본 가져오는 중..."
git fetch upstream "$BRANCH"
git checkout "$BRANCH"

BEFORE=$(git rev-parse HEAD)
if ! git merge --no-edit "upstream/$BRANCH"; then
  echo "충돌이 났습니다. 'git status'로 확인한 뒤 해결하세요. 취소하려면: git merge --abort"
  exit 1
fi
AFTER=$(git rev-parse HEAD)

if [ "$BEFORE" = "$AFTER" ]; then
  echo "이미 최신입니다."
  exit 0
fi

echo "변경 요약:"
git log --oneline "$BEFORE..$AFTER" | head -20

echo "포크에 올리는 중..."
git push origin "$BRANCH"
echo "완료. huntbae/CHANGELOG.md에 기준 원본 커밋을 갱신해 두세요: $(git rev-parse --short "upstream/$BRANCH")"
