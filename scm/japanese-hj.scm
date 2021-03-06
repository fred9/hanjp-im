(require-custom "kana-phoneme.scm")

;;basic conversion rules
(define ja-hj-rule-basic '(
	((("1"). ())("1" "1" "1"))
	((("2"). ())("2" "2" "2"))
	((("3"). ())("3" "3" "3"))
	((("4"). ())("4" "4" "4"))
	((("5"). ())("5" "5" "5"))
	((("6"). ())("6" "6" "6"))
	((("7"). ())("7" "7" "7"))
	((("8"). ())("8" "8" "8"))
	((("9"). ())("9" "9" "9"))
	((("0"). ())("0" "0" "0"))

	((("yen"). ())("￥" "￥" "\\"))

	(((hj-choseong-void hj-jungseong-a). ())("あ" "ア" "ｱ"))
	(((hj-choseong-void hj-jungseong-i). ())("い" "イ" "ｲ"))
	(((hj-choseong-void hj-jungseong-u). ())("う" "ウ" "ｳ"))
	(((hj-choseong-void hj-jungseong-e). ())("え" "エ" "ｴ"))
	(((hj-choseong-void hj-jungseong-o). ())("お" "オ" "ｵ"))

	(((hj-choseong-k hj-jungseong-a). ())("か" "カ" "ｶ"))
	(((hj-choseong-k hj-jungseong-i). ())("き" "キ" "ｷ"))
	(((hj-choseong-k hj-jungseong-u). ())("く" "ク" "ｸ"))
	(((hj-choseong-k hj-jungseong-e). ())("け" "ケ" "ｹ"))
	(((hj-choseong-k hj-jungseong-o). ())("こ" "コ" "ｺ"))
	(((hj-choseong-k hj-jungseong-ya). ())(("き" "キ" "ｷ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-k hj-jungseong-yu). ())(("き" "キ" "ｷ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-k hj-jungseong-yo). ())(("き" "キ" "ｷ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-g hj-jungseong-a). ())("が" "ガ" "ｶﾞ"))
	(((hj-choseong-g hj-jungseong-i). ())("ぎ" "ギ" "ｷﾞ"))
	(((hj-choseong-g hj-jungseong-u). ())("ぐ" "グ" "ｸﾞ"))
	(((hj-choseong-g hj-jungseong-e). ())("げ" "ゲ" "ｹﾞ"))
	(((hj-choseong-g hj-jungseong-o). ())("ご" "ゴ" "ｺﾞ"))

	(((hj-choseong-g hj-jungseong-ya). ())(("ぎ" "ギ" "ｷﾞ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-g hj-jungseong-yu). ())(("ぎ" "ギ" "ｷﾞ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-g hj-jungseong-yo). ())(("ぎ" "ギ" "ｷﾞ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-s hj-jungseong-a). ())("さ" "サ" "ｻ"))
	(((hj-choseong-s hj-jungseong-i). ())("し" "シ" "ｼ"))
	(((hj-choseong-s hj-jungseong-u). ())("す" "ス" "ｽ"))
	(((hj-choseong-s hj-jungseong-e). ())("せ" "セ" "ｾ"))
	(((hj-choseong-s hj-jungseong-o). ())("そ" "ソ" "ｿ"))

	(((hj-choseong-s hj-jungseong-ya). ())(("し" "シ" "ｼ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-s hj-jungseong-yu). ())(("し" "シ" "ｼ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-s hj-jungseong-yo). ())(("し" "シ" "ｼ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-z hj-jungseong-a). ())("ざ" "ザ" "ｻﾞ"))
	(((hj-choseong-z hj-jungseong-i). ())("じ" "ジ" "ｼﾞ"))
	(((hj-choseong-z hj-jungseong-u). ())("ず" "ズ" "ｽﾞ"))
	(((hj-choseong-z hj-jungseong-e). ())("ぜ" "ゼ" "ｾﾞ"))
	(((hj-choseong-z hj-jungseong-o). ())("ぞ" "ゾ" "ｿﾞ"))
	(((hj-choseong-z hj-jungseong-ya). ())(("じ" "ジ" "ｼﾞ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-z hj-jungseong-yu). ())(("じ" "ジ" "ｼﾞ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-z hj-jungseong-yo). ())(("じ" "ジ" "ｼﾞ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-t hj-jungseong-a). ())("た" "タ" "ﾀ"))
	(((hj-choseong-ch hj-jungseong-i). ())("ち" "チ" "ﾁ"))
	(((hj-choseong-ch hj-jungseong-u). ())("つ" "ツ" "ﾂ"))
	(((hj-choseong-t hj-jungseong-e). ())("て" "テ" "ﾃ"))
	(((hj-choseong-t hj-jungseong-o). ())("と" "ト" "ﾄ"))

	(((hj-choseong-ch hj-jungseong-ya). ())(("ち" "チ" "ﾁ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-ch hj-jungseong-yu). ())(("ち" "チ" "ﾁ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-ch hj-jungseong-yo). ())(("ち" "チ" "ﾁ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-d hj-jungseong-a). ())("だ" "ダ" "ﾀﾞ"))
	(((hj-choseong-dz hj-jungseong-i). ())("ぢ" "ヂ" "ﾁﾞ"))
	(((hj-choseong-dz hj-jungseong-u). ())("づ" "ヅ" "ﾂﾞ"))
	(((hj-choseong-d hj-jungseong-e). ())("で" "デ" "ﾃﾞ"))
	(((hj-choseong-d hj-jungseong-o). ())("ど" "ド" "ﾄﾞ"))

	(((hj-choseong-dz hj-jungseong-ya). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-dz hj-jungseong-yu). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-dz hj-jungseong-yo). ())(("ぢ" "ヂ" "ﾁﾞ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-n hj-jungseong-a). ())("な" "ナ" "ﾅ"))
	(((hj-choseong-n hj-jungseong-i). ())("に" "ニ" "ﾆ"))
	(((hj-choseong-n hj-jungseong-u). ())("ぬ" "ヌ" "ﾇ"))
	(((hj-choseong-n hj-jungseong-e). ())("ね" "ネ" "ﾈ"))
	(((hj-choseong-n hj-jungseong-o). ())("の" "ノ" "ﾉ"))

	(((hj-choseong-n hj-jungseong-ya). ())(("に" "ニ" "ﾆ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-n hj-jungseong-yu). ())(("に" "ニ" "ﾆ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-n hj-jungseong-yo). ())(("に" "ニ" "ﾆ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-h hj-jungseong-a). ())("は" "ハ" "ﾊ"))
	(((hj-choseong-h hj-jungseong-i). ())("ひ" "ヒ" "ﾋ"))
	(((hj-choseong-h hj-jungseong-u). ())("ふ" "フ" "ﾌ"))
	(((hj-choseong-h hj-jungseong-e). ())("へ" "ヘ" "ﾍ"))
	(((hj-choseong-h hj-jungseong-o). ())("ほ" "ホ" "ﾎ"))

	(((hj-choseong-h hj-jungseong-ya). ())(("ひ" "ヒ" "ﾋ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-h hj-jungseong-yu). ())(("ひ" "ヒ" "ﾋ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-h hj-jungseong-yo). ())(("ひ" "ヒ" "ﾋ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-b hj-jungseong-a). ())("ば" "バ" "ﾊﾞ"))
	(((hj-choseong-b hj-jungseong-i). ())("び" "ビ" "ﾋﾞ"))
	(((hj-choseong-b hj-jungseong-u). ())("ぶ" "ブ" "ﾌﾞ"))
	(((hj-choseong-b hj-jungseong-e). ())("べ" "ベ" "ﾍﾞ"))
	(((hj-choseong-b hj-jungseong-o). ())("ぼ" "ボ" "ﾎﾞ"))

	(((hj-choseong-b hj-jungseong-ya). ())(("び" "ビ" "ﾋﾞ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-b hj-jungseong-yu). ())(("び" "ビ" "ﾋﾞ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-b hj-jungseong-yo). ())(("び" "ビ" "ﾋﾞ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-p hj-jungseong-a). ())("ぱ" "パ" "ﾊﾟ"))
	(((hj-choseong-p hj-jungseong-i). ())("ぴ" "ピ" "ﾋﾟ"))
	(((hj-choseong-p hj-jungseong-u). ())("ぷ" "プ" "ﾌﾟ"))
	(((hj-choseong-p hj-jungseong-e). ())("ぺ" "ペ" "ﾍﾟ"))
	(((hj-choseong-p hj-jungseong-o). ())("ぽ" "ポ" "ﾎﾟ"))

	(((hj-choseong-p hj-jungseong-ya). ())(("ぴ" "ピ" "ﾋﾟ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-p hj-jungseong-yu). ())(("ぴ" "ピ" "ﾋﾟ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-p hj-jungseong-yo). ())(("ぴ" "ピ" "ﾋﾟ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-m hj-jungseong-a). ())("ま" "マ" "ﾏ"))
	(((hj-choseong-m hj-jungseong-i). ())("み" "ミ" "ﾐ"))
	(((hj-choseong-m hj-jungseong-u). ())("む" "ム" "ﾑ"))
	(((hj-choseong-m hj-jungseong-e). ())("め" "メ" "ﾒ"))
	(((hj-choseong-m hj-jungseong-o). ())("も" "モ" "ﾓ"))

	(((hj-choseong-m hj-jungseong-ya). ())(("み" "ミ" "ﾐ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-m hj-jungseong-yu). ())(("み" "ミ" "ﾐ") ("ぇ" "ェ" "ｪ")))
	(((hj-choseong-m hj-jungseong-yo). ())(("み" "ミ" "ﾐ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-void hj-jungseong-ya). ())("や" "ヤ" "ﾔ"))
	(((hj-choseong-void hj-jungseong-yu). ())("ゆ" "ユ" "ﾕ"))
	(((hj-choseong-void hj-jungseong-yo). ())("よ" "ヨ" "ﾖ"))

	(((hj-choseong-r hj-jungseong-a). ())("ら" "ラ" "ﾗ"))
	(((hj-choseong-r hj-jungseong-i). ())("り" "リ" "ﾘ"))
	(((hj-choseong-r hj-jungseong-u). ())("る" "ル" "ﾙ"))
	(((hj-choseong-r hj-jungseong-e). ())("れ" "レ" "ﾚ"))
	(((hj-choseong-r hj-jungseong-o). ())("ろ" "ロ" "ﾛ"))

	(((hj-choseong-r hj-jungseong-ya). ())(("り" "リ" "ﾘ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-r hj-jungseong-yu). ())(("り" "リ" "ﾘ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-r hj-jungseong-yo). ())(("り" "リ" "ﾘ") ("ょ" "ョ" "ｮ")))

	(((hj-choseong-void hj-jungseong-wa). ())("わ" "ワ" "ﾜ"))
	(((hj-choseong-ng hj-jungseong-o). ())("を" "ヲ" "ｦ"))

	(((hj-batchim-nn). ())("ん" "ン" "ﾝ"))
	(((hj-batchim-ss). ())("っ" "ッ" "ｯ"))

	((("<" "-"). ())("←" "←" ""))
	((("-" ">"). ())("→" "→" ""))
	((("." "." "."). ())("…" "…" ""))
))

;;foriegn prononciation rules
(define ja-hj-rule-foriegn-single-vowel '(
	(((hj-jungseong-a). ())("ぁ" "ァ" "ｧ"))
	(((hj-jungseong-i). ())("ぃ" "ィ" "ｨ"))
	(((hj-jungseong-u). ())("ぅ" "ゥ" "ｩ"))
	(((hj-jungseong-e). ())("ぇ" "ェ" "ｪ"))
	(((hj-jungseong-o). ())("ぉ" "ォ" "ｫ"))

	(((hj-jungseong-ya). ())("ゃ" "ャ" "ｬ"))
	(((hj-jungseong-yu). ())("ゅ" "ュ" "ｭ"))
	(((hj-jungseong-yo). ())("ょ" "ョ" "ｮ"))
))

(define ja-hj-rule-foriegn-special-char '(
	(((hj-chosung-t hj-jungseong-i). ())(("て" "テ" "ﾃ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-t hj-jungseong-u). ())(("と" "ト" "ﾄ") ("ぅ" "ゥ" "ｩ")))

	(((hj-choseong-t hj-jungseong-ya). ())(("ち" "チ" "ﾁ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-t hj-jungseong-yu). ())(("ち" "チ" "ﾁ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-t hj-jungseong-yo). ())(("ち" "チ" "ﾁ") ("ょ" "ョ" "ｮ")))

	(((hj-chosung-d hj-jungseong-i). ())(("で" "デ" "ﾃﾞ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-d hj-jungseong-u). ())(("ど" "ド" "ﾄﾞ") ("ぅ" "ゥ" "ｩ")))

	(((hj-choseong-d hj-jungseong-ya). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゃ" "ャ" "ｬ")))
	(((hj-choseong-d hj-jungseong-yu). ())(("ぢ" "ヂ" "ﾁﾞ") ("ゅ" "ュ" "ｭ")))
	(((hj-choseong-d hj-jungseong-yo). ())(("ぢ" "ヂ" "ﾁﾞ") ("ょ" "ョ" "ｮ")))


	(((hj-chosung-ch hj-jungseong-a). ())(("ち" "チ" "ﾁ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-ch hj-jungseong-e). ())(("ち" "チ" "ﾁ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-ch hj-jungseong-o). ())(("ち" "チ" "ﾁ") ("ぉ" "ォ" "ｫ")))

	(((hj-choseong-dz hj-jungseong-a). ())("ざ" "ザ" "ｻﾞ"))
	(((hj-choseong-dz hj-jungseong-e). ())("ぜ" "ゼ" "ｾﾞ"))
	(((hj-choseong-dz hj-jungseong-o). ())("ぞ" "ゾ" "ｿﾞ"))
))


(define ja-hj-rule-foriegn-with-compound '(
	(((hj-chosung-void hj-jungseong-wae). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-void hj-jungseong-oe). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-void hj-jungseong-ua). ())(("う" "ウ" "ｳ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-void hj-jungseong-wo). ())(("う" "ウ" "ｳ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-void hj-jungseong-we). ())(("う" "ウ" "ｳ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-void hj-jungseong-wi). ())(("う" "ウ" "ｳ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-k hj-jungseong-wae). ())(("く" "ク" "ｸ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-k hj-jungseong-oe). ())(("く" "ク" "ｸ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-k hj-jungseong-ua). ())(("く" "ク" "ｸ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-k hj-jungseong-wo). ())(("く" "ク" "ｸ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-k hj-jungseong-we). ())(("く" "ク" "ｸ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-k hj-jungseong-wi). ())(("く" "ク" "ｸ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-g hj-jungseong-wae). ())(("ぐ" "グ" "ｸﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-g hj-jungseong-oe). ())(("ぐ" "グ" "ｸﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-g hj-jungseong-ua). ())(("ぐ" "グ" "ｸﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-g hj-jungseong-wo). ())(("ぐ" "グ" "ｸﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-g hj-jungseong-we). ())(("ぐ" "グ" "ｸﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-g hj-jungseong-wi). ())(("ぐ" "グ" "ｸﾞ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-s hj-jungseong-wae). ())(("す" "ス" "ｽ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-s hj-jungseong-oe). ())(("す" "ス" "ｽ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-s hj-jungseong-ua). ())(("す" "ス" "ｽ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-s hj-jungseong-wo). ())(("す" "ス" "ｽ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-s hj-jungseong-we). ())(("す" "ス" "ｽ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-s hj-jungseong-wi). ())(("す" "ス" "ｽ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-z hj-jungseong-wae). ())(("ず" "ズ" "ｽﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-z hj-jungseong-oe). ())(("ず" "ズ" "ｽﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-z hj-jungseong-ua). ())(("ず" "ズ" "ｽﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-z hj-jungseong-wo). ())(("ず" "ズ" "ｽﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-z hj-jungseong-we). ())(("ず" "ズ" "ｽﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-z hj-jungseong-wi). ())(("ず" "ズ" "ｽﾞ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-t hj-jungseong-wae). ())(("と" "ト" "ﾄ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-t hj-jungseong-oe). ())(("と" "ト" "ﾄ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-t hj-jungseong-ua). ())(("と" "ト" "ﾄ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-t hj-jungseong-wo). ())(("と" "ト" "ﾄ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-t hj-jungseong-we). ())(("と" "ト" "ﾄ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-t hj-jungseong-wi). ())(("と" "ト" "ﾄ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-d hj-jungseong-wae). ())(("ど" "ド" "ﾄﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-d hj-jungseong-ua). ())(("ど" "ド" "ﾄﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-d hj-jungseong-oe). ())(("ど" "ド" "ﾄﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-d hj-jungseong-wo). ())(("ど" "ド" "ﾄﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-d hj-jungseong-we). ())(("ど" "ド" "ﾄﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-d hj-jungseong-wi). ())(("ど" "ド" "ﾄﾞ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-ch hj-jungseong-wae). ())(("つ" "ツ" "ﾂ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-ch hj-jungseong-oe). ())(("つ" "ツ" "ﾂ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-ch hj-jungseong-ua). ())(("つ" "ツ" "ﾂ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-ch hj-jungseong-wo). ())(("つ" "ツ" "ﾂ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-ch hj-jungseong-we). ())(("つ" "ツ" "ﾂ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-ch hj-jungseong-wi). ())(("つ" "ツ" "ﾂ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-dz hj-jungseong-wae). ())(("づ" "ヅ" "ﾂﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-dz hj-jungseong-oe). ())(("づ" "ヅ" "ﾂﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-dz hj-jungseong-ua). ())(("づ" "ヅ" "ﾂﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-dz hj-jungseong-wo). ())(("づ" "ヅ" "ﾂﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-dz hj-jungseong-we). ())(("づ" "ヅ" "ﾂﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-dz hj-jungseong-wi). ())(("づ" "ヅ" "ﾂﾞ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-n hj-jungseong-wae). ())(("ぬ" "ヌ" "ﾇ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-n hj-jungseong-oe). ())(("ぬ" "ヌ" "ﾇ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-n hj-jungseong-ua). ())(("ぬ" "ヌ" "ﾇ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-n hj-jungseong-wo). ())(("ぬ" "ヌ" "ﾇ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-n hj-jungseong-we). ())(("ぬ" "ヌ" "ﾇ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-n hj-jungseong-wi). ())(("ぬ" "ヌ" "ﾇ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-h hj-jungseong-wae). ())(("ふ" "フ" "ﾌ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-h hj-jungseong-oe). ())(("ふ" "フ" "ﾌ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-h hj-jungseong-ua). ())(("ふ" "フ" "ﾌ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-h hj-jungseong-wo). ())(("ふ" "フ" "ﾌ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-h hj-jungseong-we). ())(("ふ" "フ" "ﾌ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-h hj-jungseong-wi). ())(("ふ" "フ" "ﾌ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-b hj-jungseong-wae). ())(("ぶ" "ブ" "ﾌﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-b hj-jungseong-oe). ())(("ぶ" "ブ" "ﾌﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-b hj-jungseong-ua). ())(("ぶ" "ブ" "ﾌﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-b hj-jungseong-wo). ())(("ぶ" "ブ" "ﾌﾞ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-b hj-jungseong-we). ())(("ぶ" "ブ" "ﾌﾞ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-p hj-jungseong-wae). ())(("ぷ" "プ" "ﾌﾟ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-b hj-jungseong-wi). ())(("ぶ" "ブ" "ﾌﾞ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-p hj-jungseong-oe). ())(("ぷ" "プ" "ﾌﾟ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-p hj-jungseong-ua). ())(("ぷ" "プ" "ﾌﾟ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-p hj-jungseong-wo). ())(("ぷ" "プ" "ﾌﾟ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-p hj-jungseong-we). ())(("ぷ" "プ" "ﾌﾟ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-p hj-jungseong-wi). ())(("ぷ" "プ" "ﾌﾟ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-m hj-jungseong-wae). ())(("む" "ム" "ﾑ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-m hj-jungseong-oe). ())(("む" "ム" "ﾑ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-m hj-jungseong-ua). ())(("む" "ム" "ﾑ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-m hj-jungseong-wo). ())(("む" "ム" "ﾑ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-m hj-jungseong-we). ())(("む" "ム" "ﾑ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-m hj-jungseong-wi). ())(("む" "ム" "ﾑ") ("ぃ" "ィ" "ｨ")))
	(((hj-chosung-r hj-jungseong-wae). ())(("る" "ル" "ﾙ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-r hj-jungseong-oe). ())(("る" "ル" "ﾙ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-r hj-jungseong-ua). ())(("る" "ル" "ﾙ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-r hj-jungseong-wo). ())(("る" "ル" "ﾙ") ("ぁ" "ァ" "ｧ")))
	(((hj-chosung-r hj-jungseong-we). ())(("る" "ル" "ﾙ") ("ぇ" "ェ" "ｪ")))
	(((hj-chosung-r hj-jungseong-wi). ())(("る" "ル" "ﾙ") ("ぃ" "ィ" "ｨ")))
))


(define ja-hj-foriegn-alist '(
	ja-hj-rule-foriegn-single-vowel
	ja-hj-rule-foriegn-special-char
	ja-hj-rule-foriegn-with-compound))
