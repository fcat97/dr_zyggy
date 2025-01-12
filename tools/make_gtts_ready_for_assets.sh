rm -r tts
mkdir tts
cd tts
python -m venv .venv
source .venv/bin/activate
pip install gTTS
deactivate
cd ..
cp tools/generate_bn_speech.sh tts/
zip -r tts.zip tts/
mkdir -p assets/gtts/
mv tts.zip assets/gtts/tts.zip
