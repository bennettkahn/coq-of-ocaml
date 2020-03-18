(** Generated by coq-of-ocaml *)
Require Import OCaml.OCaml.

Local Set Primitive Projections.
Local Open Scope string_scope.
Local Open Scope Z_scope.
Local Open Scope type_scope.
Import ListNotations.

Unset Positivity Checking.
Unset Guard Checking.

Definition b_eq : bool := equiv_decb 1 2.

Definition b_neq1 : bool := nequiv_decb true false.

Definition b_neq2 : bool := nequiv_decb tt tt.

Definition b_lt : bool := OCaml.Stdlib.lt 1 2.

Definition b_gt : bool := OCaml.Stdlib.gt 1 2.

Definition b_le : bool := OCaml.Stdlib.le true false.

Definition b_ge : bool := OCaml.Stdlib.ge tt tt.

Definition comp : Z := OCaml.Stdlib.compare 1 2.

Definition n_min : Z := OCaml.Stdlib.min 1 2.

Definition n_max : Z := OCaml.Stdlib.max 1 2.

Definition b_not : bool := negb false.

Definition b_and : bool := andb true false.

Definition b_and_old : bool := andb true false.

Definition b_or : bool := orb true false.

Definition b_or_old : bool := orb true false.

Definition app1 : Z := (fun x => x) 12.

Definition app2 : Z := (fun x => x) 12.

Definition n_neg1 : Z := Z.opp 12.

Definition n_neg2 : Z := (-12).

Definition n_pos1 : Z := 12.

Definition n_pos2 : Z := 12.

Definition n_succ : Z := Z.succ 1.

Definition n_pred : Z := Z.pred 1.

Definition n_plus : Z := Z.add 1 2.

Definition n_minus : Z := Z.sub 1 2.

Definition n_times : Z := Z.mul 1 2.

Definition n_div : Z := Z.div 1 2.

Definition n_mod : Z := Z.modulo 1 2.

Definition n_abs : Z := Z.abs 1.

Definition n_land : Z := Z.land 12 13.

Definition n_lor : Z := Z.lor 12 13.

Definition n_lxor : Z := Z.lxor 12 13.

Definition n_lsl : Z := Z.shiftl 12 13.

Definition n_lsr : Z := Z.shiftr 12 13.

Definition ss : string := String.append "begin" "end".

Definition n_char : Z := OCaml.Stdlib.int_of_char "c" % char.

Definition i : unit := OCaml.Stdlib.ignore 12.

Definition s_bool : string := OCaml.Stdlib.string_of_bool false.

Definition bool_s : bool := OCaml.Stdlib.bool_of_string "false".

Definition s_n : string := OCaml.Stdlib.string_of_int 12.

Definition n_s : Z := OCaml.Stdlib.int_of_string "12".

Definition n1 : Z := fst (12, 13).

Definition n2 : Z := snd (12, 13).

Definition ll : list Z := OCaml.Stdlib.app [ 1; 2 ] [ 3; 4 ].