# Windows

## 遷移前準備

1. 備份C槽根目錄、Downloads、User資料夾資料
2. 備份Visual Studio Code
3. 備份SSH Key
4. 記錄桌面、開始功能表、必要軟體
5. 記錄環境變數
6. 記錄常駐程式

## 遷移後

1. OneDrive手動開啟，連結指定硬碟
2. 桌面、文件、圖片、音樂資料夾連結OneDrive
3. 系統更新
4. 資源回收桶刪除確認
5. 顯示卡驅動安裝
6. 系統設定
7. 安裝字型
8. 安裝必要軟體
   - Office
   - Affinity
   - 通訊軟體
   - 燒錄軟體
   - 播放軟體
   - Windows Terminal 及設定 PowerLine
   - 安裝 Cascadia Code PL 及 JetBrains Mono
   - 遠端、虛擬機
   - 遊戲
   - 地牛WakeUp
   - HiCOS管理工具、證券憑證、銀行憑證
   - 開發環境
      - 還原~/.ssh
      - Git
      - VS Code
      - Python
      - Node.js及npm
      - Note Pad++
      - Android Studio
      - IntelliJ IDEA
      - Fork

<br>
<br>
<br>


---
# macOS

## 字型

- JetBrains Mono
- font-caskaydia-cove-nerd-font（由Homebrew直接安裝）
  - 終端機：`Caskaydia Cove Nerd Font Mono`
  - 編輯器：`JetBrains Mono`
- 停用BiauKai，安裝Kaiu (~/Library/Fonts/DFKai-Patched-for-macOS)，測試是否正常

<br>

## 還原Dotfile

1. 安裝homebrew用brew還原Brewfile，詳見 [軟體安裝](#軟體安裝)
2. 用brew安裝git
3. git還原dotfile，並且執行"rake install"
   1. install_homebrew
   2. install_oh_my_zsh
      - 安裝Oh My Zsh
   3. move_zsh_themes
      - 備份舊主題
      - 建立Powerlevel10k主題軟連結
   4. install_zsh_plugins
      - 安裝插件zsh-autosuggestions
      - 安裝插件zsh-syntax-highlighting
   5. install_dotfile
      - 備份舊dotfiles（備份目錄和檔案；刪除軟連結）
      - 建立.zprofile軟連結
        - 包含開發環境版本設定
        - 包含自定義快捷指令
      - 建立.zshrc軟連結
        - 包含主題
        - 包含插件
4. 設定Terminal -> Theme: Pro

<br>

## 軟體安裝

### Homebrew

- Development
  - git
  - openjdk, zulu (java)
  - nvm (node, rpm)
  - python
  - uv (python)
  - FreeTDS
  - Azure-Cli
  - AWS Cli
  - Power Shell
  - Warp Terminal
  - Stern
- Connection
  - Postman
  - Redis Insight
  - Open Lens
  - Sudoto
- Design
  - draw.io
- Note
  - Obsidian
  - CotEditor
- Utility
  - Setapp
  - Monitor Control
  - Dock Door
  - Thaw
  - Bitwarden
  - Spotify
  - Claude
  - Codex

### JetBrains Toolbox

- IntelliJ IDEA
- DataGrip
- Android Studio

### Setapp

- CleanShot X
- CleanMyMac
- FreeYourMusic

### 其他

- Visual Studio Code 
- Windows App
- Affinity
- Dynamic Lyric
- 地牛WakeUp
- Microsoft 365
- Microsoft To Do
- 通訊軟體

<br>

## 還原設定

- .ssh及debug.keystore
- LINE (~/Library/Containers/LINE/Data)
- Fork (~/Library/Application Support/com.DanPristupov.Fork)
- Visual Studio Code (settings.json)

<br>

## 快捷鍵

> 當鍵盤的 fn ⌃ 被阻擋時

### 視窗 - 一般

- 縮放：改為「⌃ ⌥ ↩︎」

### 視窗 - 二等分

- 並排左側一半：改為「⌃ ⌥ ←」
- 並排右側一半：改為「⌃ ⌥ →」
- 並排上方一半：改為「⌃ ⌥ ↑」
- 並排下方一半：改為「⌃ ⌥ ↓」

### 視窗 - 並列

- 並列左側和右側：改為「⌃ ⌥ ⇧ ←」
- 並列右側和左側：改為「⌃ ⌥ ⇧ →」
- 並列頂部和底部：改為「⌃ ⌥ ⇧ ↑」
- 並列底部和頂部：改為「⌃ ⌥ ⇧ ↓」

<br>

## 輸入法

- 拼音
- 鼠鬚管

### RIME 設定

> 還原(installation.yaml sync_dir)

- 同步備份定義檔
  - installation.yaml
- 字碼檔
  - liur_customWords.dict.yaml
  - liur_English.dict.yaml
  - liur_Japan.dict.yaml
  - liur_Trad.dict.yaml
  - liur_TradExt.dict.yaml
  - liur_TradToSimp.dict.yaml
- 字碼引用檔
  - liur.extended.dict.yaml 
- 反查及逐碼提示開關
  - liur.custom.yaml
- 樣式設定檔
  - squirrel.custom.yaml
- 輸入法設定檔
  - default.custom.yaml
  - liur.schema.yaml
