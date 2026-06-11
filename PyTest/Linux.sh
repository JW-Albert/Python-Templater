#! /bin/bash

set -e

safe_clear() {
    if [ -t 1 ] && [ -n "$TERM" ] && command -v clear >/dev/null 2>&1; then
        clear 2>/dev/null || true
    fi
}

# 確保離開時（含 pytest 失敗）都能清理環境
cleanup() {
    deactivate 2>/dev/null || true
    rm -f pytest.ini
}
trap cleanup EXIT

safe_clear

source venv/bin/activate

cat > pytest.ini << 'EOF'
[pytest]
pythonpath = src
addopts = -v --tb=short
EOF

safe_clear

pytest tests