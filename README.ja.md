[English](README.md) | [日本語](README.ja.md)
----
# jerm-wx : JERMinal Wait for device eXtended version

## Overview
- シリアル通信のバックエンドとして jerm をずっと使っていたが、
  USB時代になり、USB-Serial が接触不良など起こすと通信切れしてしまうのが問題になるケースが現る。
    - ==> Android ADB のように wait for device の改造を入れよう。
- jerm の配布元があぼ～んして Source が取れなくなっている・・・
    - 幸い二条項BSD License なので、改変版を GitHUB 等に置いても大丈夫っぽい。
    - ・・・ということで改変版を Souce code management site に置いてしまおう。
- あと、Win11+Teraterm でしかできない作業を Ubuntu or NetBSD でできるようにしていきたい・・・

### 改造元について
[Rename したオリジナルの README を見てね](./README.origin-8096.txt)

## Wait for device extend patche
### Summary
- "-w" option の追加
    - 起動時に指定 device file が存在しない場合、定期Pollingして待つ
    - 動作中に device file が消滅した場合、再接続待ちする
- 接続待ち処理
    - 最初60秒程度は 250msec で Polling
    - その後、1000msec で Polling
    - この処理中は Ctrl+C で jerm-wx を終了可能

## 動作確認
- Ubuntu22.04 x64
- Ubuntu24.04 x64

## ToDo
- [x] 日本語入った File を UTF-8 へ
- [x] Originalと共存のため、jerm ==> jerm-wx へ改名
- [x] GitHUB 向けに README 系の整理
- [ ] Wait for device extend patch の Merge
- [ ] Binary file transmit patch の 設計 & Merge
    - 某SoC のリカバリをできるようにしたい
    - Win11+Teraterm でしかできない作業を無くしたい
- [ ] Y-Modem/Z-Modem 処理も入れたい・・・ 
    - Win11+Teraterm でしかできない作業を無くしたい
    - Sub-process の lrzsz を Pipe でつなげばできそう
- [ ] jerm.1 の改訂
    - 困っていないので優先度低
