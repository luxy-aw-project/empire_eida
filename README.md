<h2>CocoaPodsについて</h2>
<p>今後使用していくライブラリが増えていくにつれて管理が難しくなってくるので、各開発環境にてCocoaPodsが導入されていることを前提に進めていく。</p>
<p>従って、簡易的ではあるがCocoaPodsの導入方法をまとめておく。</p>
<h3>1.MacOS内のRuby Gemを最新化する。</h3>
<p>ターミナル.appを起動し、下記のコマンドを実施する。</p>
<p>「sudo gem update --system」</p>
<p>参考：Ruby Gemについて "<a href="https://www.sejuku.net/blog/15339#gem">gem</a>"</p>
<h3>2.インストール</h3>
<p>上記ターミナル上で下記のコマンドを実施する。</p>
<p>「sudo gem install -n /usr/local/bin cocoapods」</p>
<p>下記のコマンドでバージョンが表示されるようになればOK。</p>
<p>「pod --version」</p>

```unix
XXXXXX-MBP:~ username$ pod --version
1.6.2
XXXXXX-MBP:~ username$ 
```

<h3>3.Xcode経由でCloneしたPJのディレクトリへ移動し、対象のライブラリをインストールする。</h3>

```unix
XXXXXX-MBP:~ username$ cd ./Luxy_work/awpj/empire_eida/
XXXXXX-MBP:empire_eida username$ pod install
```
<p>※cdコマンドで指定するディレクトリは各自の環境で異なるので確認すること。</p>
<p>本来は対象のPJ以下にあるpodfileというファイルを適宜修正しインストールするライブラリを設定するが、今回は設定済みファイルがあるため省略する。</p>
