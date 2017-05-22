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
