# robosys2025
授業課題用

# チューナーコマンド
![test]()

## 概要
周波数を入力することで適正な周波数までどのくらい音を上下すればいいか分かります。

## 詳細な説明下書き
標準入力された周波数に対して、音階名と適正な周波数までの差を標準出力するコマンド  
基準音はA4=442Hzを採用している。(作者が吹奏楽出身なので自分にとって便利な442)  
音階はA, B, H, C, Ds, D, Es, E, F, Gs, G, Asで表している。  
0以下の周波数は対応していません。ピアノの鍵盤の外側にも対応していますが音名がUndefinedとなります。

## 使い方
### コマンドの導入
```
$ git clone https://github.com/RyoGH741/robosys2025.git
$ cd robosys2025
```

### 実行方法
```
echo <周波数>　| ./tuner
```
<周波数>に計算したい周波数を入力してください。

### 実行例
```
$ echo 440 | ./tuner

A4  2.0
```
周波数を2上げれば適正になります。
```
$ echo 444 | ./tuner

A4  -2.0
```
周波数を2下げれば適正になります。

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.7〜3.13
## テスト環境
- Ubuntu 22.04 LTS
## 参考謝辞
[音階の周波数](https://tomari.org/main/java/oto.htmlhttps://tomari.org/main/java/oto.html)
## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- このパッケージは，Ryuichi Ueda由来のコード（© 2025 Ryuichi Ueda）を利用しています．
- このパッケージのコードは，下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを，本人の許可を得て自身の著作としたものです．
    - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/my_slides/tree/master/robosys_2025)
- © 2025 Ryoichi Sakamaki
