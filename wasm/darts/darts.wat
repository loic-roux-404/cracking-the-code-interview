(module
  ;;
  ;; Score a dart throw based on its coordinates.
  ;;
  ;; @param {f32} x - The x coordinate of the dart.
  ;; @param {f32} y - The y coordinate of the dart.
  ;;
  ;; @returns {i32} - The score of the dart throw (10, 5, 1, or 0).
  ;;
  (func (export "score") (param $x f32) (param $y f32) (result i32)
    (local $new_x i32)
    (local $new_y i32)
    (local.set $new_x (f32.convert_i32_u (local.get $x)))
    (local.set $new_y (f32.convert_i32_u (local.get $y)))
    (if (result i32)
      (i32.or
        (i32.gt_u (local.get $new_x) (i32.const 5)) ;; Check if $x > 5
        (i32.gt_u (local.get $new_y) (i32.const 5)) ;; Check if $y > 5
      )
      (then
        (return (i32.const 0))
      )
    (else 
      (return (i32.const 42))
    ))
  )
)
