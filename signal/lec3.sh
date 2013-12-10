#!env bash

# SIGNAL1 = SIGHUP

# SIGNAL1が実行されたらabcを実行
trap "abc " 1

function abc(){
# abcという関数は 以下の文字列を出力するだけ
# 注意: グローバル変数SELFPIDを呼び出しできる
  echo "SIGNAL RECIEVED[PID = $SELFPID]"
}

# $$が自分のPID
SELFPID=$$
echo "DO: kill -1 $SELFPID"

# test が trueの間 = ずっと ループ っていうのを「バックグラウンド」で回す
(while test true; do echo "SLEEP" ;sleep 5 ; done )&

# で「フォアグラウンド」ではwhile1 loop(なにもしない)
while test true; do
 true
done
