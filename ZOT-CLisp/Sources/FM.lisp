(asdf:operate 'asdf:load-op 'ae2sbvzot)
(use-package :trio-utils)

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

(defvar cart-slow-speed-definition ; Slow speed is one cell per time step
  (alw
    (||

          ;(-> (&& (-P- isCartMovingSlow) (-P- isCartAt[x,y]) ) (|| (dist (-P- isCartAt[x+1, y] ) 1) (dist (-P- isCartAt[x, y+1] ) 1) (dist (-P- isCartAt[x-1, y] ) 1)(dist (-P- isCartAt[x, y-1] ) 1)
          ;  isCartMovingSlow ∧ isCartAt(x, y) →Dist(isCartAt(x + 1, y) ∨ isCartAt(x, y + 1)

    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_2_1) ) (|| (dist (-P- isCartAt_3_1) 1)(dist (-P- isCartAt_2_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_2_2) ) (|| (dist (-P- isCartAt_3_2) 1)(dist (-P- isCartAt_2_3 ) 1)(dist (-P- isCartAt_2_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_2_3) ) (|| (dist (-P- isCartAt_3_3) 1)(dist (-P- isCartAt_2_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_3_1) ) (|| (dist (-P- isCartAt_4_1) 1)(dist (-P- isCartAt_3_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_3_2) ) (|| (dist (-P- isCartAt_4_2) 1)(dist (-P- isCartAt_3_3 ) 1)(dist (-P- isCartAt_3_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_3_3) ) (|| (dist (-P- isCartAt_4_3) 1)(dist (-P- isCartAt_3_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_4_1) ) (|| (dist (-P- isCartAt_5_1) 1)(dist (-P- isCartAt_4_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_4_2) ) (|| (dist (-P- isCartAt_5_2) 1)(dist (-P- isCartAt_4_3 ) 1)(dist (-P- isCartAt_4_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_4_3) ) (|| (dist (-P- isCartAt_5_3) 1)(dist (-P- isCartAt_4_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_5_1) ) (|| (dist (-P- isCartAt_6_1) 1)(dist (-P- isCartAt_5_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_5_2) ) (|| (dist (-P- isCartAt_6_2) 1)(dist (-P- isCartAt_5_3 ) 1)(dist (-P- isCartAt_5_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_5_3) ) (|| (dist (-P- isCartAt_6_3) 1)(dist (-P- isCartAt_5_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_6_1) ) (|| (dist (-P- isCartAt_7_1) 1)(dist (-P- isCartAt_6_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_6_2) ) (|| (dist (-P- isCartAt_7_2) 1)(dist (-P- isCartAt_6_3 ) 1)(dist (-P- isCartAt_6_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_6_3) ) (|| (dist (-P- isCartAt_7_3) 1)(dist (-P- isCartAt_6_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_7_1) ) (|| (dist (-P- isCartAt_8_1) 1)(dist (-P- isCartAt_7_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_7_2) ) (|| (dist (-P- isCartAt_8_2) 1)(dist (-P- isCartAt_7_3 ) 1)(dist (-P- isCartAt_7_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_7_3) ) (|| (dist (-P- isCartAt_8_3) 1)(dist (-P- isCartAt_7_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_8_1) ) (|| (dist (-P- isCartAt_9_1) 1)(dist (-P- isCartAt_8_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_8_2) ) (|| (dist (-P- isCartAt_9_2) 1)(dist (-P- isCartAt_8_3 ) 1)(dist (-P- isCartAt_8_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_8_3) ) (|| (dist (-P- isCartAt_9_3) 1)(dist (-P- isCartAt_8_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_9_1) ) (|| (dist (-P- isCartAt_10_1) 1)(dist (-P- isCartAt_9_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_9_2) ) (|| (dist (-P- isCartAt_10_2) 1)(dist (-P- isCartAt_9_3 ) 1)(dist (-P- isCartAt_9_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_9_3) ) (|| (dist (-P- isCartAt_10_3) 1)(dist (-P- isCartAt_9_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_10_1) ) (|| (dist (-P- isCartAt_11_1) 1)(dist (-P- isCartAt_10_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_10_2) ) (|| (dist (-P- isCartAt_11_2) 1)(dist (-P- isCartAt_10_3 ) 1)(dist (-P- isCartAt_10_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_10_3) ) (|| (dist (-P- isCartAt_11_3) 1)(dist (-P- isCartAt_10_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_11_1) ) (|| (dist (-P- isCartAt_12_1) 1)(dist (-P- isCartAt_11_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_11_2) ) (|| (dist (-P- isCartAt_12_2) 1)(dist (-P- isCartAt_11_3 ) 1)(dist (-P- isCartAt_11_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_11_3) ) (|| (dist (-P- isCartAt_12_3) 1)(dist (-P- isCartAt_11_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_12_1) ) (|| (dist (-P- isCartAt_13_1) 1)(dist (-P- isCartAt_12_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_12_2) ) (|| (dist (-P- isCartAt_13_2) 1)(dist (-P- isCartAt_12_3 ) 1)(dist (-P- isCartAt_12_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_12_3) ) (|| (dist (-P- isCartAt_13_3) 1)(dist (-P- isCartAt_12_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_13_1) ) (|| (dist (-P- isCartAt_13_2 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_13_2) ) (|| (dist (-P- isCartAt_13_3 ) 1)(dist (-P- isCartAt_13_1 ) 1)))
    (-> (&& (-P- isCartMovingSlow) (-P- isCartAt_13_3) ) (|| (dist (-P- isCartAt_13_2 ) 1)))

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
 (&& cart-spec robot-spec cart-no-multiple-speeds operator-spec) ; (somf 'off))
 ;:transitions trans
 )


 ; Esempio su dist misto con cose che sembrano renderlo dipendente da variabile: zot/examples/in1.lisp
