(** Generated by coq-of-ocaml *)
Require Import OCaml.OCaml.

Local Set Primitive Projections.
Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Open Scope type_scope.
Import ListNotations.

Unset Positivity Checking.
Unset Guard Checking.

Definition n : Z :=
  match ([ 1; 2 ], false) with
  | (cons x (cons _ []), true) => x
  | (cons _ (cons y []), false) => y
  | _ => 0
  end.

Inductive t : Set :=
| Bar : Z -> t
| Foo : bool -> string -> t.

Definition m (x : t) : Z :=
  match
    (x,
      match x with
      | Bar n => OCaml.Stdlib.gt n 12
      | _ => false
      end,
      match x with
      | Bar k => equiv_decb k 0
      | _ => false
      end) with
  | (Bar n, true, _) => n
  | (Bar k, _, true) => k
  | (Bar n, _, _) => Z.opp n
  | (Foo _ _, _, _) => 0
  end.