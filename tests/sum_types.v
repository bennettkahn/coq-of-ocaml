Require Import OCaml.OCaml.

Local Open Scope Z_scope.
Local Open Scope type_scope.
Import ListNotations.

Inductive t1 : Type :=
| C1 : Z -> t1
| C2 : bool -> Z -> t1
| C3 : t1.

Definition n : t1 := C2 false 3.

Definition m : bool :=
  match n with
  | C2 b _ => b
  | _ => true
  end.

Inductive t2 : forall (a : Type), Type :=
| D1 : forall {a : Type}, t2 a
| D2 : forall {a : Type}, a -> (t2 a) -> t2 a.

Fixpoint of_list {A : Type} (l : list A) : t2 A :=
  match l with
  | [] => D1
  | cons x xs => D2 x (of_list xs)
  end.

Fixpoint sum (l : t2 Z) : Z :=
  match l with
  | D1 => 0
  | D2 x xs => Z.add x (sum xs)
  end.

Definition s {A : Type} (function_parameter : A) : Z :=
  match function_parameter with
  | _ => sum (of_list (cons 5 (cons 7 (cons 3 []))))
  end.

Parameter t3 : Type.

Parameter t4 : forall {a : Type}, Type.

Inductive t5 : Type :=
| C : t5.
