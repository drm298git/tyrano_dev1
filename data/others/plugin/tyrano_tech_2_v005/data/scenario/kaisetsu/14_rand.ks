
; == 14_rand.ks ============================================

; 乱数の解説を行います。

; ==========================================================



; [set_default_view]
; これは独自マクロです(→macro.ks)。
; 解説画面を作成します。
[set_default_view]



;-----------------------------------------------------------
*Part1
;-----------------------------------------------------------

#akane
あなたは「ランダムなシナリオを実装したい！」と思ったことはある？[p]
たとえば、50種類の会話パターンからランダムに会話を抽出したり……。[p]
じゃんけんゲームを導入したり……。[p]
あるいは、一定の確率で成功失敗が決まるようなイベントを入れたりね。[p]
そんなランダムなシナリオを実装するためには、[<y]乱数[>]と呼ばれるものを利用するといいわ。[p]
#akane:doki
[font size=20]
乱数というのは、何が出るのかまったく予想ができないランダムな数のこと。
JavaScriptというプログラミング言語――ティラノスクリプトはこれで動いてるよ――が提供する機能のひとつで、[cm][font size=20]
0以上1未満の浮動小数点数をゲットするというものがあるの。具体的にはMath.random()という関数でね。
これを［iscript］タグや［eval］タグの中で使えばランダムなシナリオが実装できるよ。[cm]
#akane:default
……という難しい話はさておいて……。[p]
その乱数を手軽に扱えるようにした[<y]マクロ[>]がこのサンプル集に入ってるから、見てみてね。[p]
さて。[p]
実際にそのマクロで、[<y]サイコロ[>]を振ってみるよ。[l]



;-----------------------------------------------------------
*Part1.1
;-----------------------------------------------------------

[glink target="*Part1.2" text="10面ダイスを2個振る" y="240" color="black" size="24" x="220" width="440"]
[s]



;-----------------------------------------------------------
*Part1.2
;-----------------------------------------------------------

#akane:default

; [getrand]
; これは乱数を簡単に扱うための独自マクロです（→macro.ks）。
; 0以上9以下のランダムな整数をf.aとf.bにそれぞれセットします。
[getrand var="f.a" min="0" max="9"]
[getrand var="f.b" min="0" max="9"]

#akane
; [emb]
; 変数をテキストとして出力するタグです。
; f.aとf.bの中身（0以上9以下のランダムな整数）をメッセージとして出力します。
出た目は……[<y][emb exp="f.a"][emb exp="f.b"][>]!!

; [if]～[endif]
; ぞろ目なら（すなわち、f.a と f.b が同じなら）専用メッセージを出します。
[if    exp="f.a == f.b"]
  #akane:doki
  _ ワオッ! ぞろ目だ!!

; [elsif]
; ぞろ目ではなく、1の位が0なら専用メッセージを出します。
[elsif exp="f.b == 0"]
  _ キリがよろしい!

; [elsif]
; ぞろ目ではなく、1の位が0でもなく、もし80以上なら専用メッセージを出します。
[elsif exp="10 * f.a + f.b > 80"]
  _ お～、おっきい……。

; [elsif]
; ぞろ目ではなく、1の位が0でもなく、80以上でもなく、
; もし20以下なら専用メッセージを出します。
[elsif exp="10 * f.a + f.b < 20"]
  _ わあ、ちっさいね。

; [else]
; それ以外。
[else]
  _ ふつうだ……。

[endif]

[glink target="*Part1.2" text="もっと振る" y="240" color="black" size="24" x="220" width="440"]
[glink target="*Part2"   text="もういい"     y="320" color="black" size="24" x="220" width="440"]
[s]



;-----------------------------------------------------------
*Part2
;-----------------------------------------------------------

もういい？[p]
次に[<y]ランダムトーク[>]の一例として、私が四字熟語を教えてあげるわ！　全部で10パターンあるよ。[p]

[glink target="*Part2.2" text="教えて！" y="240" color="black" size="24" x="220" width="440"]
[s]



;-----------------------------------------------------------
*Part2.1
;-----------------------------------------------------------

[glink target="*Part2.2" text="もっと教えて！" y="240" color="black" size="24" x="220" width="440"]
[glink target="*Part3"   text="もういい"       y="320" color="black" size="24" x="220" width="440"]
[s]



;-----------------------------------------------------------
*Part2.2
;-----------------------------------------------------------

; [getrandname]
; これは乱数を簡単に扱うための独自マクロです（→macro.ks）。
; name属性内の{R}を「min属性～max属性のランダムな整数」で置換した文字列を、
; 一時変数tf.randnameに格納します。
; たとえば、name="*label_{R}" min="1" max="3"と指定した場合、
;
;     *label_1    *label_2    *label_3
;
; のうちからランダムでひとつ決定されるということです。
; var属性に変数名を指定すると（var="f.a"のように）、
; その変数に格納するようにできます。
[getrandname name="*Yojijukugo{R}" min="1" max="10"]

; [jump]
; 一時変数tf.randnameを使ってジャンプします。
; 変数の中身を属性値に指定したい場合、先頭に & をつけます。
[jump target="& tf.randname"]

;-----------------------------------------------------------
*Yojijukugo1
;-----------------------------------------------------------

#akane:default
臥薪嘗胆（がしんしょうたん）って知ってる？[p]
復讐をするために苦心や苦労を重ねること……。[p]
ひいては目的を達成するために辛抱すること全般を言うよ。[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo2
;-----------------------------------------------------------

#akane:default
不撓不屈（ふとうふくつ）って聞いたことある？[p]
どんな困難にも決してくじけないことだよ。[p]
#akane:happy
不撓不屈の戦士!!――かっこいいよね。[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo3
;-----------------------------------------------------------

#akane:default
天真爛漫（てんしんらんまん）って聞いたことある？[p]
飾り気がなく、ありのままである様子のことだね。[p]
#akane:happy
私のことかな！[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo4
;-----------------------------------------------------------

#akane:default
博覧強記（はくらんきょうき）って知ってる？[p]
見ればなんとなくわかると思うけど、非常に物事をよく知っている人のこと。[p]
#akane:happy
私のことかな？[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo5
;-----------------------------------------------------------

#akane:default
電光石火（でんこうせっか）って知ってる？[p]
#akane:happy
先制攻撃できるノーマルタイプのわざ……[wait time="1000"]
#akane:default
ではなくて、極めて素早い様子のこと。[p]
電光石火の早業!!――とか言うよね。[p]
電光石火のご対応、ありがとうございました……とは言わないか。[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo6
;-----------------------------------------------------------

#akane:default
疾風迅雷（しっぷうじんらい）って聞いたことある？[p]
激しい風や雷に例えて、人の行動や事態の変化が非常に急であることを言うよ。[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo7
;-----------------------------------------------------------

#akane:default
色即是空（しきそくぜくう）って聞いたことある？[p]
この世の万物は空（くう）であるというありがた～い仏教の教えなの。[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo8
;-----------------------------------------------------------

#akane:default
有象無象（うぞうむぞう）って聞いたことある？[p]
そのへんに群がっているようなくだらない連中[r]……というちょっと良くない意味だね。[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo9
;-----------------------------------------------------------

#akane:default
満身創痍（まんしんそうい）って知ってる？[p]
体中が傷だらけな様子のこと。[p]
「満身」が体中っていう意味なんだね。[l]
[jump target="*Part2.1"]

;-----------------------------------------------------------
*Yojijukugo10
;-----------------------------------------------------------

#akane:default
粉骨砕身（ふんこつさいしん）って知ってる？[p]
身を粉にして、力の限りを尽くすことだよ。[p]
粉骨砕身、取り組んで参る所存でございます!!……なんてね。[l]
[jump target="*Part2.1"]



;-----------------------------------------------------------
*Part3
;-----------------------------------------------------------

#akane:doki
どうだった？[p]
4、5回も見ればかぶりだすんじゃないかな～。[p]
#akane:sad
ランダムトークってけっこうかぶっちゃうから、やろうとすると大変なんだよね。[p]
#akane:doki
……やるなら、頑張って!! 応援してるよ!![p]
#akane:default
以上、ランダム分岐の解説と実例でした。[p]
#akane:happy
あなたもいろいろやってみてね～。[p]

[jump storage="select.ks"]