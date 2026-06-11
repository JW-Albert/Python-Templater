# Python-Templater

這是一個 Python 模板 Repo，專為 **Windows 環境**設計，搭配 [uv](https://github.com/astral-sh/uv) 管理虛擬環境與套件，並預設整合 Claude Code 開發流程。

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
python.bat
```

執行後會自動完成以下步驟：

1. 刪除舊的 `venv/` 虛擬環境（若存在）
2. 以 Python 3.10.19 建立新的虛擬環境
3. 升級 pip
4. 安裝 `requirements.txt` 中的所有套件

## 目錄結構

```
Python-Templater/
├── src/
│   └── main.py          # 程式進入點
├── python.bat           # 一鍵建立虛擬環境並安裝套件
├── requirements.txt     # 套件清單
├── CLAUDE.md            # Claude Code 專案設定
├── .gitignore
└── README.md
```

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

在 `requirements.txt` 加入套件名稱後，重新執行 `python.bat`，或手動安裝：

```bat
uv pip install --python venv\Scripts\python.exe <package-name>
```

## 相關工具

- [uv 文件](https://docs.astral.sh/uv/)
- [Claude Code](https://claude.ai/code)
