# Python-Templater

這是一個 Python 模板 Repo，專為 **Windows 環境**設計，搭配 [uv](https://github.com/astral-sh/uv) 管理虛擬環境與套件，並預設整合 Claude Code 開發流程與 GitHub Actions CI。

## 環境需求

| 工具 | 說明 |
|------|------|
| [uv](https://docs.astral.sh/uv/getting-started/installation/) | Python 套件與虛擬環境管理器 |
| Python 3.10.19 | 由 uv 自動下載，不需手動安裝 |
| Windows 10 / 11 | 主要執行平台 |

安裝 uv（PowerShell）：

```powershell
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

## 快速開始

```bat
python\Windows.bat
```

執行後會自動完成以下步驟：

1. 刪除舊的 `venv/` 虛擬環境（若存在）
2. 以 Python 3.10.19 建立新的虛擬環境
3. 升級 pip
4. 安裝 `requirements.txt` 中的所有套件

## 目錄結構

```
Python-Templater/
├── .github/
│   └── workflows/
│       └── pytest.yaml      # GitHub Actions CI（push / PR 自動跑測試）
├── src/
│   └── main.py              # 程式進入點
├── tests/
│   └── test_main.py         # PyTest 測試範本
├── python/
│   ├── Windows.bat          # 一鍵建立虛擬環境並安裝套件（Windows）
│   └── Linux.sh             # 一鍵建立虛擬環境並安裝套件（Linux / CI）
├── PyTest/
│   ├── Windows.bat          # 執行 PyTest（Windows）
│   └── Linux.sh             # 執行 PyTest（Linux / CI）
├── requirements.txt         # 套件清單
├── CLAUDE.md                # Claude Code 專案設定
├── .gitignore
└── README.md
```

## 執行測試

```bat
PyTest\Windows.bat
```

執行後會自動：

1. 產生 `pytest.ini`（設定 `pythonpath = src`）
2. 以 venv 內的 Python 執行 `pytest tests`
3. 清理 `pytest.ini`

## 執行程式

建立環境後，啟動虛擬環境並執行：

```bat
venv\Scripts\activate
python src\main.py
```

或不啟動直接用 uv 執行：

```bat
uv run --python venv\Scripts\python.exe src\main.py
```

## 新增套件

在 `requirements.txt` 加入套件名稱後，重新執行 `python\Windows.bat`，或手動安裝：

```bat
uv pip install --python venv\Scripts\python.exe <package-name>
```

## GitHub Actions CI

每次 push 到 `main` 或開啟 / 更新 Pull Request 時，CI 會自動：

1. 建立 Python 3.10 虛擬環境並安裝套件
2. 執行 `pytest tests`

設定檔位於 [.github/workflows/pytest.yaml](.github/workflows/pytest.yaml)。

## 相關工具

- [uv 文件](https://docs.astral.sh/uv/)
- [Claude Code](https://claude.ai/code)
