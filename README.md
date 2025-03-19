# 🎧 hackspotify

Welcome to **hackspotify** – my first open-source project on GitHub!  
Why the name? Because it sounds super cool 😎

> ⚠️ **Works ONLY on Ubuntu** (for now...)

Built in just a few days, this tool is a fun and useful way to search, download, and play music via **YouTube** using the amazing power of `yt-dlp`.

---

## 🧰 Requirements

Make sure you have the following installed:

- `figlet`
- `toilet`
- `catimg`
- `mpv`
- `yt-dlp` → [Installation guide](https://github.com/yt-dlp/yt-dlp/wiki/Installation)

---

## 🚀 Installation

First, update your packages and run:

```bash
sudo apt update
sudo curl -s https://raw.githubusercontent.com/frenki1004/hackspotify/main/install.sh | bash
```

> 💡 **Tip:** Add your own YouTube API key for better results!

```bash
nano $HOME/Music/hackspotify/.secrets
# Paste your API key (no spaces, no backspaces!)
```

---

## 🎵 Usage

Run it from anywhere like this:

```bash
hackspotify "your song/album/artist here"
```

**Preferred format:**

```bash
hackspotify [-flags] [ARTIST NAME] [ALBUM NAME] album
```

### 🔊 Example

```bash
hackspotify -iS kanye west graduation album
```

---

## 🏴‍☠️ Available Flags

| Flag | Description |
|------|-------------|
| `-t` | Temporary (store files in `/tmp`, deleted regularly) |
| `-i` | Immediately play (don’t wait for full download) |
| `-d` | Download then play (default behavior) |
| `-u` | Update / reinstall the album|
| `-S` | Shuffle playlist |
| `-o` | Play in original order |

> 📝 **Autofill** only works when you’re in the project folder. Run:
>
> ```bash
> cd ~/Music/hackspotify
> ```

To quickly see usage info:

```bash
cat /usr/bin/hackspotify | head -n 25
```

---

## ⏭ Controls

- **Next song:** `CTRL+C`
- **Exit everything:** Double tap `CTRL+C`

---

## 📸 Screenshots

<p align="center">
  <img src="https://your-image-url-1.png" width="600" alt="Terminal Output Screenshot"/>
  <br/>
  <img src="https://your-image-url-2.png" width="600" alt="Another Screenshot"/>
</p>

> Replace the links above with actual screenshots. Upload your images to GitHub, Imgur, or somewhere public and paste the URLs.

---

## 🛠 Updating

If something isn’t working or you haven’t used it in a while:

```bash
hackspotify update
```

---

## 🤘 Enjoy the Music

This is a personal project, but feel free to **fork**, **star ⭐**, and play around with it.  
Pull requests and suggestions are welcome!

---

## 📜 License

MIT License – do whatever you want, just don’t sue me 😄
