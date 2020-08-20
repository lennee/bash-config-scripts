# Configuring Production Version of Steam App

PROXY=$1

repos=($PROXY media-window purchase-options similar-games reviews game-sidebar game-description)

for Dir in "${repos[@]}"; do
  git clone http://github.com/hrr47-FEC-Bailey/$Dir/
  cd $Dir
  npm i
  cd ..
done

echo ""
echo "========================"
echo "All Components Cloned"
echo ""

