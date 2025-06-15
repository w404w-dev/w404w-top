#!/bin/bash

echo "🔧 神域の入口、ただいま構築中やで…"

TARGET=~/ダウンロード/altar_ui_fixed
mkdir -p "$TARGET"
cd "$TARGET" || exit 1

cat <<EOF > index.html
<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>w404w - 神域</title>
  <link rel="stylesheet" href="style.css" />
</head>
<body>
  <div class="logo">w404w</div>
  <div class="user-icon" title="アカウント"></div>
  <div class="lang-icon" title="言語">🌐</div>
  <main>
    <div class="search-container">
      <div class="search-box">
        <span class="search-icon">🔍</span>
        <input type="text" placeholder="神検索" class="search-input"/>
        <button class="enter-button" title="入口">🌀</button>
      </div>
    </div>
  </main>
  <footer>
    <div class="settings-icon" title="設定">⚙️</div>
    <button class="music-button" id="musicButton" title="神秘の音">🎵</button>
  </footer>
  <script src="script.js"></script>
</body>
</html>
EOF

cat <<EOF > style.css
body {
  background: black;
  color: white;
  font-family: sans-serif;
  margin: 0;
  padding: 0;
  text-align: center;
  overflow: hidden;
}
.logo {
  font-size: 3em;
  margin-top: 50px;
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
.search-icon {
  margin-right: 10px;
  font-size: 1.2em;
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
.music-button {
  position: fixed;
  bottom: 10px;
  left: 10px;
}
.settings-icon {
  position: fixed;
  bottom: 10px;
  right: 10px;
}
.user-icon, .lang-icon, .chat-icon {
  position: fixed;
  top: 10px;
}
.user-icon { right: 60px; width: 24px; height: 24px; background: gray; border-radius: 50%; }
.lang-icon { right: 30px; }
.chat-icon { right: 100px; }
EOF

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

cp ~/ダウンロード/altar_ui/bgm1.mp3 . 2>/dev/null
cp ~/ダウンロード/altar_ui/bgm3.mp3 . 2>/dev/null

echo "🚀 起動完了！ http://localhost:8080 を開いて確認してや！"
python3 -m http.server 8080
