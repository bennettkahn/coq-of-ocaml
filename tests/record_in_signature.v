Require Import CoqOfOCaml.CoqOfOCaml.
Require Import CoqOfOCaml.Settings.

Module Sig.
  Record signature {t : Set -> Set} : Set := {
    t := t;
    v : t string;
  }.
End Sig.
Definition Sig {t} := @Sig.signature t.

Module M.
  Module t.
    Record record {a : Set} : Set := Build {
      x : int;
      y : int;
      label : a }.
    Arguments record : clear implicits.
    Definition with_x {t_a} x (r : record t_a) :=
      Build t_a x r.(y) r.(label).
    Definition with_y {t_a} y (r : record t_a) :=
      Build t_a r.(x) y r.(label).
    Definition with_label {t_a} label (r : record t_a) :=
      Build t_a r.(x) r.(y) label.
  End t.
  Definition t := t.record.
  
  Definition v : t string := {| t.x := 0; t.y := 1; t.label := "hi" |}.
  
  Definition module :=
    {|
      Sig.v := v
    |}.
End M.
Definition M : Sig (t := _) := M.module.

Definition v : M.(Sig.t) string := M.(Sig.v).

Definition s : string := M.(Sig.v).(M.t.label).
