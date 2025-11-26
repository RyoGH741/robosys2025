# robosys2025
授業課題用

# チューナーコマンド
![test]()

## 概要
`tuner`は、入力した周波数に対応する音階名と、適正な周波数からどのくらいずれているかを計算・表示するコマンドです。

## 詳細な説明下書き
- 標準入力で周波数（Hz）を受け取り、音名と誤差（Hz）を標準出力します。 
- ピアノの鍵盤範囲（A0〜C8）をカバーしています。
- 鍵盤外（極端に高い/低い周波数）は`Undefined`として出力します。
- 入力が数値以外、または0以下のときはエラー終了します（終了コード：1）。
基準音はA4=442Hzを採用している。(作者が吹奏楽出身なので自分にとって便利な442)  
音階はA, B, H, C, Ds, D, Es, E, F, Gs, G, Asで表している。  
小数点以下第3で四捨五入してるよ

## 使い方
### コマンドの導入
```
$ git clone https://github.com/RyoGH741/robosys2025.git
$ cd robosys2025
```

### 実行方法
```
$ echo <周波数>　| ./tuner
```
  <周波数>の部分に、調べたい音の周波数(Hz)を入力してください。

### 実行例
1. 基準音に対して低い場合
```
$ echo 440 | ./tuner
A4  2.0
```
    基準より2Hz低いので、音を2Hz上げると正しい音になります。

2. 基準音に対して高い場合
```
$ echo 444 | ./tuner
A4  -2.0
```
    基準より2Hz高いので、音を2Hz下げると正しい音になります。

3. 範囲外の周波数の場合
```
$ echo -10 | ./tuner
Out of tuner measurement range
```

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.7〜3.13
## テスト環境
- Ubuntu 22.04 LTS
## 参考謝辞
[音階の周波数(Tomari.org)](https://tomari.org/main/java/oto.htmlhttps://tomari.org/main/java/oto.html)

## ライセンス
- このソフトウェアパッケージは，3条項BSDライセンスの下，再頒布および使用が許可されます．
- このパッケージは，Ryuichi Ueda由来のコード（© 2025 Ryuichi Ueda）を利用しています．
- このパッケージのコードは，下記のスライド（CC-BY-SA 4.0 by Ryuichi Ueda）のものを，本人の許可を得て自身の著作としたものです．
    - [ryuichiueda/my_slides robosys_2025](https://github.com/ryuichiueda/my_slides/tree/master/robosys_2025)
- © 2025 Ryoichi Sakamaki
