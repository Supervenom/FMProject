(asdf:operate 'asdf:load-op 'ae2sbvzot)
(use-package :trio-utils)

;Possible positions (as defined in the report, generated with python script)
(defvar pos1_1 1)
(defvar pos2_1 2)
(defvar pos3_1 3)
(defvar pos4_1 4)
(defvar pos5_1 5)
(defvar pos6_1 6)
(defvar pos7_1 7)
(defvar pos8_1 8)
(defvar pos9_1 9)
(defvar pos10_1 10)
(defvar pos11_1 11)
(defvar pos12_1 12)
(defvar pos13_1 13)
(defvar pos14_1 14)
(defvar pos15_1 15)
(defvar pos16_1 16)
(defvar pos17_1 17)
(defvar pos1_2 21)
(defvar pos2_2 22)
(defvar pos3_2 23)
(defvar pos4_2 24)
(defvar pos5_2 25)
(defvar pos6_2 26)
(defvar pos7_2 27)
(defvar pos8_2 28)
(defvar pos9_2 29)
(defvar pos10_2 30)
(defvar pos11_2 31)
(defvar pos12_2 32)
(defvar pos13_2 33)
(defvar pos14_2 34)
(defvar pos15_2 35)
(defvar pos16_2 36)
(defvar pos17_2 37)
(defvar pos1_3 41)
(defvar pos2_3 42)
(defvar pos3_3 43)
(defvar pos4_3 44)
(defvar pos5_3 45)
(defvar pos6_3 46)
(defvar pos7_3 47)
(defvar pos8_3 48)
(defvar pos9_3 49)
(defvar pos10_3 50)
(defvar pos11_3 51)
(defvar pos12_3 52)
(defvar pos13_3 53)
(defvar pos14_3 54)
(defvar pos15_3 55)
(defvar pos16_3 56)
(defvar pos17_3 57)
(defvar pos1_4 61)
(defvar pos2_4 62)
(defvar pos3_4 63)
(defvar pos4_4 64)
(defvar pos5_4 65)
(defvar pos6_4 66)
(defvar pos7_4 67)
(defvar pos8_4 68)
(defvar pos9_4 69)
(defvar pos10_4 70)
(defvar pos11_4 71)
(defvar pos12_4 72)
(defvar pos13_4 73)
(defvar pos14_4 74)
(defvar pos15_4 75)
(defvar pos16_4 76)
(defvar pos17_4 77)
(defvar pos1_5 81)
(defvar pos2_5 82)
(defvar pos3_5 83)
(defvar pos4_5 84)
(defvar pos5_5 85)
(defvar pos6_5 86)
(defvar pos7_5 87)
(defvar pos8_5 88)
(defvar pos9_5 89)
(defvar pos10_5 90)
(defvar pos11_5 91)
(defvar pos12_5 92)
(defvar pos13_5 93)
(defvar pos14_5 94)
(defvar pos15_5 95)
(defvar pos16_5 96)
(defvar pos17_5 97)
(defvar pos1_6 101)
(defvar pos2_6 102)
(defvar pos3_6 103)
(defvar pos4_6 104)
(defvar pos5_6 105)
(defvar pos6_6 106)
(defvar pos7_6 107)
(defvar pos8_6 108)
(defvar pos9_6 109)
(defvar pos10_6 110)
(defvar pos11_6 111)
(defvar pos12_6 112)
(defvar pos13_6 113)
(defvar pos14_6 114)
(defvar pos15_6 115)
(defvar pos16_6 116)
(defvar pos17_6 117)
(defvar pos1_7 121)
(defvar pos2_7 122)
(defvar pos3_7 123)
(defvar pos4_7 124)
(defvar pos5_7 125)
(defvar pos6_7 126)
(defvar pos7_7 127)
(defvar pos8_7 128)
(defvar pos9_7 129)
(defvar pos10_7 130)
(defvar pos11_7 131)
(defvar pos12_7 132)
(defvar pos13_7 133)
(defvar pos14_7 134)
(defvar pos15_7 135)
(defvar pos16_7 136)
(defvar pos17_7 137)

; Distance between two cells, should be working
(defun manhattan-dist (a b)
  (if ([>] a b)
      (if ([>] ([%] a 20) ([%] b 20))
          ([+] ([+] ([%] ([-] a b) 20) 1) ([-] ([%] a 20) ([%] b 20) ) )
          ([+] ([+] ([%] ([-] a b) 20) 1) ([-] ([%] b 20) ([%] a 20) ) )
          )
      (if ([>] ([%] a 20) ([%] b 20))
          ([+] ([+] ([%] ([-] b a) 20) 1) ([-] ([%] a 20) ([%] b 20) ) )
          ([+] ([+] ([%] ([-] b a) 20) 1) ([-] ([%] b 20) ([%] a 20) ) )
          )
      ;([+] ([floordiv] ([-] a b) 20) ([%] ([-] a b) X_MAX ) ([floordiv] ([-] a b) Y_MAX) ([%] ([-] a b) Y_MAX ) )

      ;([+] ([floordiv] ([-] b a) X_MAX) ([%] ([-] b a) X_MAX ) ([floordiv] ([-] b a) Y_MAX) ([%] ([-] b a) Y_MAX ) )
      ;  (+ (abs (- (mod a X_MAX) (mod b X_MAX)))  (abs (- (mod a Y_MAX) (mod b Y_MAX) )) )
      )
  )

; Signed diff of Y values of two positions
(defun delta-y (a b)
 ([-] ([+] ([%] a 20) 1)  ([+] ([%] b 20) 1) )
)

; Signed diff of X values of two positions
(defun delta-x (a b)
  ([-] ([%] a 20) ([%] b 20) )
)

(define-tvar isCartAt *int*)
(define-tvar isLeftArmAt *int*)
(define-tvar isRightArmAt *int*)
(define-tvar isOperatorAt *int*)

(define-tvar isJointAt *int*)
(define-tvar isEndEffectorAt *int*)
(define-tvar isCartAt *int*)

; As per report model
(defconstant X_MAX 17)
(defconstant Y_MAX 7)


(alw
 (&&
  ([<=] ([%] (-V- isCartAt) 20) X_MAX)
  ([>=] ([%] (-V- isCartAt) 20) 1)
  ([>=] (-V- isCartAt) 1)
  ([<=] (-V- isCartAt) pos17_7)
  )
 )
(alw
 (&&
  ([<=] ([%] (-V- isLeftArmAt) 20) X_MAX)
  ([>=] ([%] (-V- isLeftArmAt) 20) 1)
  ([>=] (-V- isLeftArmAt) 1)
  ([<=] (-V- isLeftArmAt) pos17_7)
  )
 )
(alw
 (&&
  ([<=] ([%] (-V- isRightArmAt) 20) X_MAX)
  ([>=] ([%] (-V- isRightArmAt) 20) 1)
  ([>=] (-V- isRightArmAt) 1)
  ([<=] (-V- isRightArmAt) pos17_7)
  )
 )
(alw
 (&&
  ([<=] ([%] (-V- isOperatorAt) 20) X_MAX)
  ([>=] ([%] (-V- isOperatorAt) 20) 1)
  ([>=] (-V- isOperatorAt) 1)
  ([<=] (-V- isOperatorAt) pos17_7)
  )
 )
(alw
 (&&
  ([<=] ([%] (-V- isJointAt) 20) X_MAX)
  ([>=] ([%] (-V- isJointAt) 20) 1)
  ([>=] (-V- isJointAt) 1)
  ([<=] (-V- isJointAt) pos17_7)
  )
 )
(alw
 (&&
  ([<=] ([%] (-V- isEndEffectorAt) 20) X_MAX)
  ([>=] ([%] (-V- isEndEffectorAt) 20) 1)
  ([>=] (-V- isEndEffectorAt) 1)
  ([<=] (-V- isEndEffectorAt) pos17_7)
  )
 )

(defvar init
  (&&
    ([>=] (-V- isLeftArmAt) 0)
    ([>=] (-V- isRightArmAt) 0)
    ([>=] (-V- isOperatorAt) 0)
    ([>=] (-V- isJointAt) 0)
    ([>=] (-V- isEndEffectorAt) 0)
  )
)

(defvar robot-spec
  (alw
   (&&
    (!! (&& (-P- isLocalBinEmpty) (-P- isLocalBinFull) )) ; It is impossible that the local bin is empty and full at the same time.

    ; arm

    ([<=] (manhattan-dist (-V- isCartAt) (-V- isJointAt)) 1)
    ([<=] (manhattan-dist (-V- isEndEffectorAt) (-V- isJointAt)) 1)
    (<-> (-P- isJointMoving) ([>=] (manhattan-dist (-V- isJointAt) (-V- (next isJointAt)) ) 1) )
    (<-> (-P- isJointMoving) ([=] (manhattan-dist (-V- isJointAt) (-V- (next isJointAt)) ) 1 ))
    (<-> (-P- isEndEffectorMoving) ([>=] (manhattan-dist (-V- isEndEffectorAt) (-V- (next isEndEffectorAt)) ) 1 ))
    (<-> (-P- isEndEffectorMoving) ([=] (manhattan-dist (-V- isEndEffectorAt) (-V-  (next isEndEffectorAt)) ) 1))

    )
   ))
(defvar op-pos-defin
  (alw
   (&&
    (<-> (-P- isOpOnTheLeft) (||
                              (&& ([<=] ([-] (-V- isCartAt) (-V- isOperatorAt) ) 3) ([>=] (-V- isCartAt) (-V- isOperatorAt)) )
                              (&& ([>]  ([-] (-V- isOperatorAt) (-V- isCartAt) ) 1) ([>] (-V- isOperatorAt) (-V- isCartAt)))
                              ;; Y
                              (&&([>=] ([-] ([+] ([%] (-V- isOperatorAt) 20) 1)  ([+] ([%] (-V- isCartAt) 20) 1)) 2) ([>=] ([+] ([%] (-V- isOperatorAt) 20) 1)  ([+] ([%] (-V- isCartAt) 20)) ))
                              (&&([>] ([-] ([+] ([%] (-V- isCartAt) 20) 1)  ([+] ([%] (-V- isOperatorAt) 20) 1)) 2) ([>] ([+] ([%] (-V- isCartAt ) 20) 1)  ([+] ([%] (-V- isOperatorAt ) 20)) ))
                              )
         )
    (<-> (-P- isOpOnTheRight) (||
                               (&& ([<=] ([-] (-V- isCartAt) (-V- isOperatorAt) ) 1) ([>=] (-V- isCartAt) (-V- isOperatorAt)) )
                               (&& ([>]  ([-] (-V- isOperatorAt) (-V- isCartAt) ) 3) ([>] (-V- isOperatorAt) (-V- isCartAt)))
                               ;; Y
                               (&&([>=] ([-] ([+] ([%] (-V- isOperatorAt) 20) 1)  ([+] ([%] (-V- isCartAt) 20) 1)) 2) ([>=] ([+] ([%] (-V- isOperatorAt) 20) 1)  ([+] ([%] (-V- isCartAt) 20)) ))
                               (&&([>] ([-] ([+] ([%] (-V- isCartAt) 20) 1)  ([+] ([%] (-V- isOperatorAt) 20) 1)) 2) ([>] ([+] ([%] (-V- isCartAt ) 20) 1)  ([+] ([%] (-V- isOperatorAt ) 20)) ))
                               )
         )
    )))

(defvar robot-movement-def
  ;; Picking
  (alw
   (&&
    (<-> (-P- isRobotPicking)
         (||
          (-> (&&
               ([<=] ([+] ([%] (-V- isOperatorAt) 20) 1) 3)
               (!! ([=] (-V- isRightArmAt)  pos12_4 ) )
               (!! ([=] (-V- isLeftArmAt)  pos12_4 ) )
               )
              (dist (&& ([=] (-V- isJointAt) pos13_5 ) ([=] (-V- isEndEffectorAt) pos12_4 ))1 )
              )
          (-> (&&
               ([>=] ([+] ([%] (-V- isOperatorAt) 20) 1) 5)
               (!! ([=] (-V- isRightArmAt)  pos12_4 ) )
               (!! ([=] (-V- isLeftArmAt)  pos12_4 ) )
               )
              (dist (&& ([=] (-V- isJointAt) pos13_3 ) ([=] (-V- isEndEffectorAt) pos12_4 ))1 )
              )
          (->
           ([=] (-V- isOperatorAt) pos14_4)
           (dist (&& ([=] (-V- isJointAt) pos13_4 ) ([=] (-V- isEndEffectorAt) pos12_4 )) 1 )
           )
          )
         )
      ; Holding
      (<-> (-P- isRobotHolding)
      (||
       (-> (&&
            ([<=] ([+] ([%] (-V- isOperatorAt) 20) 1) 3)
            (!! ([=] (-V- isRightArmAt)  pos15_4 ) )
            (!! ([=] (-V- isLeftArmAt)  pos15_4 ) )
            )
           (dist (&& ([=] (-V- isJointAt) pos14_5 ) ([=] (-V- isEndEffectorAt) pos15_4 )) 1 )
           )
       (-> (&&
            ([>=] ([+] ([%] (-V- isOperatorAt) 20) 1) 5)
            (!! ([=] (-V- isRightArmAt)  pos15_4 ) )
            (!! ([=] (-V- isLeftArmAt)  pos15_4 ) )
            )
           (dist (&& ([=] (-V- isJointAt) pos14_3 ) ([=] (-V- isEndEffectorAt) pos15_4 ))1 )
           )
       (->
        ([=] ([+] ([%] (-V- isOperatorAt) 20) 1) 4) ; Operator Y is 4
        (dist (&& ([=] (-V- isJointAt) pos14_4 ) ([=] (-V- isEndEffectorAt) pos15_4 )) 1 )
        )
       )
      )
      (-> (-P- isPieceLoaded) (&& (!! (-P- isEndEffectorClosed)) (!! (-P- isEndEffectorGrabbing) ) ) )
      (-> (-P- isEndEffectorGrabbing) (dist (!! (-P- isEndEffectorGrabbing)) 1))

    )
   )
)

(defvar cart-spec
  (alw
   (&&
    (<-> (-P- isCartMoving) (!!(-P- isCartStill)) ) ; It is impossible that the cart is moving and is still at the same time.
    (<-> (-P- isCartMoving) (|| (-P- isCartMovingSlow) (-P- isCartMovingFast) )) ; The cart is moving if and only if it is moving at some speed
    (!! (&& (-P- isCartMovingSlow) (-P- isCartMovingFast) )) ; It is impossible that the cart is moving at different speeds at the same time.
    (<-> (-P- isCartMoving) (|| (-P- isCartMovingToBin) (-P- isCartMovingToPallet) ) )  ; The cart is moving if and only if is moving to the bin or to the pallet.
    (!! (&& (-P- isCartMovingToBin) (-P- isCartMovingToPallet ) ) ) ; It is impossible that the cart is moving to the bin and to the pallet at the same time.
    (<-> (-P- isRobotResting)  (&& ([=] (-V- isCartAt) (-V- isEndEffectorAt))
                                   ([=] (-V- isCartAt) (-V- isJointAt)) ))
    (<-> (-P- isCartMovingLeft) (|| ([=] ([-] (-V- isCartAt) (-V- (next isCartAt) ) ) 1)
                                    ([=] ([-] (-V- isCartAt) (-V- (next isCartAt) ) ) 2)
                                    )
         )

    (<-> (-P- isCartMovingRight) (|| ([=] ([-] (-V- (next isCartAt) ) (-V- isCartAt)  ) 1)
                                     ([=] ([-] (-V- (next isCartAt) ) (-V- isCartAt)  ) 2)
                                     )
         )
    )
   )
  )




(defvar cart-slow-speed-definition ; Slow speed is one cell per time step
  (alw
   (<-> (-P- isCartMovingSlow)
        ([=] (manhattan-dist (-V- (next isCartAt)) (-V- isCartAt) ) 1) ; to fix manhattan distance
        )
   )
  )

(defvar cart-fast-speed-definition ; fast speed is 2 cells per time unit
  (alw
   (<-> (-P- isCartMovingFast)
        ([=] (manhattan-dist (-V- (next isCartAt)) (-V- isCartAt) ) 2)
        )
   )
  )

(defvar cart-no-multiple-speeds ; It is impossible that the cart is moving at different speeds at the same time.
  (alw
   (!! (&& (-P- isCartMovingFast) (-P- isCartMovingSlow) )
    )
   )
  )

(defvar operator-spec
  (alw
    (&&
      ; Arms close
       ([<=] (manhattan-dist (-V- isOperatorAt) (-V- isRightArmAt) ) 1 )
       ([<=] (manhattan-dist (-V- isOperatorAt) (-V- isLeftArmAt) ) 1 )

       (-> (-P- isOperatorTrapped) (-P- isOperatorClose) ) ; The operator is trapped only if it is close to the robot.
       (|| (-P- isOperatorClose ) (-P- isOperatorAway ) ) ; The operator is close to the robot or away.
       (!! (&& (-P- isOperatorClose ) (-P- isOperatorAway ) ) ) ; The operator can’t be close to the robot and away at the same time.
     )
  )
)

(defvar operator-movement
  (alw
    (&&
      ([<=] (manhattan-dist (-V- isOperatorAt) (-V- (next (isOperatorAt) ) )) 1)

    )
  )
)

(defvar cart-movement
  (alw
    (&&
      (-> (!! (&& (-P- isRobotResting) (dist (-P- isRobotResting) 1) ) )
          (!! (-P- isCartMoving)))
      (-> (&& (-P- isLocalBinEmpty) (!! (-P- isOpOnTheLeft) ) (-P- isRobotResting) (!! ([=] (-V- isCartAt) pos2_4)))
          (-P- isCartMovingLeft))
      (-> (&& ([=] (-V- isCartAt) pos2_4) (!! (-P- isLocalBinFull)))
          (-P- isCartStill) )
      (-> (&& (-P- isLocalBinFull) (!! (-P- isOpOnTheRight)) (-P- isRobotResting) (!! ([=] (-v- isCartAt) pos13_4)) )
          (-P- isCartMovingRight))
      (-> (&& ([=] (-V- isCartAt) pos13_4) (!! (-P- isLocalBinEmpty)))
          (-P- isCartStill) )
      (-> (&& (-P- isCartMoving)
            (||
              ([=] (-V- isCartAt) pos2_4)
              ([=] (-V- isCartAt) pos3_4)
              ([=] (-V- isCartAt) pos4_4)
              ([=] (-V- isCartAt) pos11_4)
              ([=] (-V- isCartAt) pos12_4)
              ([=] (-V- isCartAt) pos13_4)
            )
          )
          (-P- isCartMovingSlow)
      )
      (-> (&&
            (-P- isCartMovingLeft)
            (||
               (&& ([=] (delta-x (-V- isCartAt) (-V- isOperatorAt)) 4) ([=] (delta-y (-V- isOperatorAt) (-V- isCartAt)) 2)  )
               (&& ([=] (delta-x (-V- isCartAt) (-V- isOperatorAt)) 4) ([=] (delta-y (-V- isOperatorAt) (-V- isCartAt)) 1)  )
               (&& ([=] (delta-x (-V- isCartAt) (-V- isOperatorAt)) 4) ([=] (delta-y (-V- isOperatorAt) (-V- isCartAt)) 0)  )
               (&& ([=] (delta-x (-V- isCartAt) (-V- isOperatorAt)) 4) ([=] (delta-y (-V- isCartAt) (-V- isOperatorAt)) 1)  )
               (&& ([=] (delta-x (-V- isCartAt) (-V- isOperatorAt)) 4) ([=] (delta-y (-V- isCartAt) (-V- isOperatorAt)) 2)  )
            )
          )
          (-P- isCartMovingSlow)
      )
      (-> (&&
            (-P- isCartMovingRight)
            (||
               (&& ([=] (delta-x (-V- isOperatorAt) (-V- isCartAt)) 4) ([=] (delta-y (-V- isOperatorAt) (-V- isCartAt)) 2)  )
               (&& ([=] (delta-x (-V- isOperatorAt) (-V- isCartAt)) 4) ([=] (delta-y (-V- isOperatorAt) (-V- isCartAt)) 1)  )
               (&& ([=] (delta-x (-V- isOperatorAt) (-V- isCartAt)) 4) ([=] (delta-y (-V- isOperatorAt) (-V- isCartAt)) 0)  )
               (&& ([=] (delta-x (-V- isOperatorAt) (-V- isCartAt)) 4) ([=] (delta-y (-V- isCartAt) (-V- isOperatorAt)) 1)  )
               (&& ([=] (delta-x (-V- isOperatorAt) (-V- isCartAt)) 4) ([=] (delta-y (-V- isCartAt) (-V- isOperatorAt)) 2)  )
            )
          )
          (-P- isCartMovingSlow)
      )
      (-> (&&
            (-P- isCartMovingRight)
            (-P- isCartMovingSlow)
            ([>=] (delta-x (-V- isCartAt) pos1_1) 4)
            (||
              ([>=] (delta-x (-V- isOperatorAt) (-V- isCartAt) ) 5)
              (&&
                ([>=] (delta-x (-V- isCartAt) (-V- isOperatorAt) ) 2)
                (||
                  ([<] (delta-y (-V- isCartAt) (-V- isOperatorAt) ) 2)
                  ([<] (delta-y (-V- isOperatorAt) (-V- isCartAt) ) 2)
                )
              )
            )
          )
          (dist (-P- isCartMovingFast) 1)
      )
      (-> (&&
            (-P- isCartMovingLeft)
            (-P- isCartMovingSlow)
            ([<=] (delta-x (-V- isCartAt) pos1_1) 10)
            (||
              ([>=] (delta-x (-V- isOperatorAt) (-V- isCartAt) ) 1)
              (&&
                ([>=] (delta-x (-V- isCartAt) (-V- isOperatorAt) ) 5)
                (||
                  ([<] (delta-y (-V- isCartAt) (-V- isOperatorAt) ) 2)
                  ([<] (delta-y (-V- isOperatorAt) (-V- isCartAt) ) 2)
                )
              )
            )
          )
          (dist (-P- isCartMovingFast) 1)
      )


    )
  )
)

(defvar robot-arm-working
  (alw
    (&&
      (-> (&& (!! (-P- isLocalBinEmpty)) (-P- isEndEffectorClosed) ([=] (-V- isCartAt) pos13_4 )) (-P- isRoboyPicking) )
      (-> (&& ([=] (-V- isEndEffectorAt) pos12_4) (!! ([=] (-V- isRightArmAt) pos12_4) ) (!! ([=] (-V- isLeftArmAt) pos12_4) ) ) (-P- isEndEffectorGrabbing) )
      (-> (-P- isPieceLoaded) (dist (&& ([=] (-V- isEndEffectorAt) pos13_4) ([=] (-V- isJointAt) pos13_4)) 1))
      (-> (&& (-P- isPieceLoaded) ([=] (-V- isEndEffectorAt) pos13_4) ([=] (-V- isJointAt) pos13_4) (!! ([=] (-V- isOperatorAt) pos14_4))) (-P- isRobotHolding) )
      (-> (&& (-P- isPieceLoaded) ([=] (-V- isEndEffectorAt) pos15_4) ) (dist (&& ([=] (-V- isJointAt) (-V- (next isJointAt)) ) ([=] (-V- isEndEffectorAt) pos15_4) ) 1 ) )
      (-> (&& (!! (-P- isPieceLoaded)) ([=] (-V- isEndEffectorAt) pos15_4) (!! ([=] (-V- isOperatorAt) pos15_4) ))
          (dist (&& ([=] (-V- isJointAt) pos13_4) ([=] (-V- isEndEffectorAt) pos13_4) (-P- isEndEffectorClosed)) 1) )
    )
  )
)

(defvar safety-prop
  (alw
    (&&
      (!! ([=] (-V- isCartAt) pos15_4) )
      (!! ([=] (-V- isCartAt) pos1_4) )
      (&& (!! ([=] (-V- isCartAt) (-V- isOperatorAt) )) (!! ([=] (delta-x (-V- isCartAt) (-V- isOperatorAt)) 1)))
      (-> (!! (-P- isRobotResting)) (&& (!! ([=] (-V- isCartAt) (-V- isLeftArmAt) )) (!! ([=] (-V- isCartAt) (-V- isRightArmAt) ))))
      (->  (-P- isCartMoving) (&& (!! ([=] (-V- isCartAt) (-V- isLeftArmAt) )) (!! ([=] (-V- isCartAt) (-V- isRightArmAt) ))))
      (->  (|| (-P- isRobotPicking) (-P- isRobotHolding)) (&& (!! ([=] (-V- isJointAt) (-V- isLeftArmAt) )) (!! ([=] (-V- isJointAt) (-V- isRightArmAt) ))))
      (&& (!! ([=] (-V- isOperatorAt) (-V- isJointAt) )) (!! ([=] (-V- isOperatorAt) (-V- isEndEffectorAt) )) )
      (-> ([=] (-V- isOperatorAt) pos14_4) (|| (!! ([=] (-V- isJointAt) pos14_4 )) ([=] (-V- isEndEffectorAt) pos14_4 ) ))
    )
  )
)

(defvar do-smth
  (somf
    (&&
      (-P- isCartMoving)
      (-P- isPieceLoaded)
    )
  )
)
(ae2sbvzot:zot
 25
 ;(&& cart-no-multiple-speeds operator-spec  cart-fast-speed-definition init operator-movement cart-movement robot-arm-working safety-prop) ; (somf 'off))
 (&& robot-spec op-pos-defin robot-movement-def cart-spec cart-slow-speed-definition cart-fast-speed-definition cart-no-multiple-speeds operator-spec operator-movement cart-movement robot-arm-working safety-prop do-smth)

 )


; Esempio su dist misto con cose che sembrano renderlo dipendente da variabile: zot/examples/in1.lisp
