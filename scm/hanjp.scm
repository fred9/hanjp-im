(require-custom "japanese-hj.scm")

;;Define some functions
(define (hj-choseong? jamo)
	(assoc jamo hj-choseong-alist))

(define (hj-jungseong? jamo)
	(assoc jamo hj-jungseong-alist))

(define (hj-jongseong? jamo)
	(assoc jamo hj-jongseong-alist))

(define (hj-kana-phoneme? jamo)
	(assoc jamo hj-kana-phoneme-alist))

(define (hj-jungseong-alone? jamo)) ;;currently no idea

(define (hj-compound-jungseong? jamo)
	(assoc jamo hj-compound-jungseong))

(define (hj-foreign-char? jamo)
	(assoc jamo ja-hj-foriegn-alist))

;;define conversion rules

