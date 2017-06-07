(asdf:operate 'asdf:load-op 'ae2sbvzot)
(use-package :trio-utils)


(defconstant MAX_INDEX 91) ; 7*13 aka X_MAX * Y_MAX
(defconstant X_MAX 13)
(defconstant Y_MAX 7)

(define-tvar cart_pos *int*)
(define-tvar oper_body_pos *int*)
(defvar space_domain (loop for i from 1 to MAX_INDEX collect i))
(defconstant *positions_list*
  (alw
   (&&
    ([<=] (-V- cart_pos) MAX_INDEX)
    ([>=] (-V- cart_pos) 1)
    ([<=] (-V- oper_body_pos) MAX_INDEX)
    ([>=] (-V- oper_body_pos) 1)
    )
   )
)

(defvar robot-spec
  (alw
   (&&
    (!! (&& (-P- isLocalBinEmpty) (-P- isLocalBinFull) )) ; It is impossible that the local bin is empty and full at the same time.

    )
   )
  )


(defvar cart-spec
  (alw
   (&&
    (!! (&& (-P- isCartMoving) (-P- isCartStill) ) ) ; It is impossible that the cart is moving and is still at the same time.
    (|| (-P- isCartMoving) (-P- isCartStill) ) ; The cart is moving or is still.
    (<-> (-P- isCartMoving) (|| (-P- isCartMovingSlow) (-P- isCartMovingMedium) (-P- isCartMovingFast) )) ; The cart is moving if and only if it is moving at some speed
    (<-> (-P- isCartMoving) (|| (-P- isCartMovingToBin) (-P- isCartMovingToPallet) ) )  ; The cart is moving if and only if is moving to the bin or to the pallet.
    (!! (&& (-P- isCartMovingToBin) (-P- isCartMovingToPallet ) ) ) ; It is impossible that the cart is moving to the bin and to the pallet at the same time.
    )
   )
  )


(defun euclidean-distance (a b) ; SCHEME (define (euclidean-distance a b) (+ (truncate (/ (abs (- a b)) X_MAX)) (remainder (abs (- a b)) X_MAX ) ))
  (+ (truncate (abs (- a b)) X_MAX) (remainder (abs (- a b)) X_MAX ) )
  ;  (+ (abs (- (mod a X_MAX) (mod b X_MAX)))  (abs (- (mod a Y_MAX) (mod b Y_MAX) )) )
  )


(defvar cart-slow-speed-definition ; Slow speed is one cell per time step
  (alw
   (<-> (-P- isCartMovingSlow)
        (-E- pos space_domain (&& ([=] (-V- cart_pos) pos)
                                  ([=] (euclidean-distance (next (-V- cart_pos)) (-V- cart_pos) ) 1)



                                  ;(-> (&& (-P- isCartMovingSlow) (-P- isCartAt[x,y]) ) (|| (dist (-P- isCartAt[x+1, y] ) 1) (dist (-P- isCartAt[x, y+1] ) 1) (dist (-P- isCartAt[x-1, y] ) 1)(dist (-P- isCartAt[x, y-1] ) 1)
                                  ;  isCartMovingSlow ∧ isCartAt(x, y) →Dist(isCartAt(x + 1, y) ∨ isCartAt(x, y + 1)


                                  )
             )
        )
   )
  )




(defvar cart-no-multiple-speeds ; It is impossible that the cart is moving at different speeds at the same time.
  (alw
   (&&
    (-> (-P- isCartMovingSlow) (&& (!! (-P- isCartMovingMedium)) (!! (-P- isCartMovingFast)) ))
    (-> (-P- isCartMovingMedium) (&& (!! (-P- isCartMovingSlow)) (!! (-P- isCartMovingFast)) ))
    (-> (-P- isCartMovingFast) (&& (!! (-P- isCartMovingMedium)) (!! (-P- isCartMovingSlow)) ))
    )
   )
  )

(defvar operator-spec
  (&&
   (-> (-P- isOperatorTrapped) (-P- isOperatorClose) ) ; The operator is trapped only if it is close to the robot.
   (|| (-P- isOperatorClose ) (-P- isOperatorAway ) ) ; The operator is close to the robot or away.
   (!! (&& (-P- isOperatorClose ) (-P- isOperatorAway ) ) ) ; The operator can’t be close to the robot and away at the same time.
   )
  )

(ae2sbvzot:zot
 10
 (&& cart-spec robot-spec cart-no-multiple-speeds operator-spec cart-slow-speed-definition) ; (somf 'off))
 ;:transitions trans
 )


; Esempio su dist misto con cose che sembrano renderlo dipendente da variabile: zot/examples/in1.lisp
