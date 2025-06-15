#!/bin/bash

echo "🔧 神域 Altar を構築中..."

TARGET=~/ダウンロード/altar_ui_fixed
mkdir -p "$TARGET"
cd "$TARGET" || exit 1

# index.html
cat <<EOF > index.html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Altar - 神域</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="logo">Altar</div>

  <div class="user-icon" title="アカウント">👤</div>
  <div class="lang-icon" title="言語">🌐</div>
  <div class="chat-icon" title="語部GPT">💬</div>
  <div class="settings-icon" title="設定">⚙️</div>

  <main>
    <div class="search-container">
      <div class="search-box">
        <input type="text" placeholder="神検索" class="search-input"/>
        <button class="enter-button" title="入口">🌀</button>
      </div>
    </div>
  </main>

  <div class="music-button" id="musicButton" title="神秘の音">🎵</div>

  <script src="script.js"></script>
</body>
</html>
EOF

# style.css
cat <<EOF > style.css
body {
  background: black;
  color: #00ff66;
  font-family: "Courier New", monospace;
  margin: 0;
  padding: 0;
  overflow: hidden;
}
.logo {
  font-size: 3.5em;
  margin-top: 30px;
  text-align: center;
  color: #00ff66;
  text-shadow: 0 0 10px #00ff66;
}
.search-container {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.search-box {
  display: flex;
  align-items: center;
  background: white;
  border-radius: 25px;
  padding: 8px 12px;
  width: 400px;
}
.search-input {
  flex: 1;
  border: none;
  outline: none;
  font-size: 1.2em;
  padding: 10px;
  border-radius: 25px;
}
.enter-button {
  background: #444;
  color: white;
  border: none;
  border-radius: 50%;
  width: 36px;
  height: 36px;
  font-size: 1.2em;
  margin-left: 10px;
  cursor: pointer;
}
.user-icon, .lang-icon, .chat-icon, .settings-icon {
  position: fixed;
  top: 10px;
  width: 36px;
  height: 36px;
  font-size: 1.2em;
  text-align: center;
  line-height: 36px;
  background-color: #222;
  color: white;
  border-radius: 50%;
}
.user-icon { right: 120px; }
.lang-icon { right: 80px; }
.settings-icon { right: 40px; }
.chat-icon {
  left: 20px;
  top: calc(50% - 18px);
}
.music-button {
  position: absolute;
  bottom: 10px;
  left: 50%;
  transform: translateX(-50%);
  font-size: 1.5em;
  opacity: 0;
  animation: floatNote 10s infinite;
}
@keyframes floatNote {
  0%, 90%, 100% { opacity: 0; transform: translate(-50%, 20px); }
  95% { opacity: 1; transform: translate(-50%, -10px); }
}
EOF

# script.js
cat <<EOF > script.js
const musicButton = document.getElementById('musicButton');
const bgms = ['bgm1.mp3', 'bgm3.mp3'];
let audio = new Audio();
let playing = false;
musicButton.addEventListener('click', () => {
  if (!playing) {
    const randomIndex = Math.floor(Math.random() * bgms.length);
    audio.src = bgms[randomIndex];
    audio.play();
    playing = true;
  } else {
    audio.pause();
    playing = false;
  }
});
EOF

# BGMコピー
cp ~/ダウンロード/altar_ui/bgm1.mp3 . 2>/dev/null
cp ~/ダウンロード/altar_ui/bgm3.mp3 . 2>/dev/null

# サーバー起動
echo "🚀 Altar 完成！ブラウザで http://localhost:8080 を開いてくれ！"
python3 -m http.server 8080

