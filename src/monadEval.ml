module Result = struct
  type 'a t = {
    errors: Error.t list;
    value: 'a;
  }
end

module Interpret = struct
  type 'a t = Env.t -> Loc.t -> 'a Result.t
end

module Command = struct
  open Monad.Command

  let eval (type a) (file_name : string) (command : a t) : a Interpret.t =
    fun env loc ->
      match command with
      | GetEnv -> { Result.errors = []; value = env }
      | GetLoc -> { errors = []; value = loc }
      | Raise (value, category, message) -> { errors = [{ category; loc; message }]; value }
      | Warn message -> { errors = []; value = Error.warn file_name loc message }
end

module Wrapper = struct
  let eval (wrapper : Monad.Wrapper.t) (interpret : 'a Interpret.t) : 'a Interpret.t =
    fun env loc ->
      match wrapper with
      | Env env ->
        interpret env loc
      | Loc loc -> interpret env loc
end

let rec eval : type a. string -> a Monad.t -> a Interpret.t =
  fun file_name x env loc ->
    match x with
    | Monad.Bind (x, f) ->
      let { Result.errors = errors_x; value = value_x } = eval file_name x env loc in
      let { Result.errors = errors_y; value = value_y } = eval file_name (f value_x) env loc in
      { errors = errors_y @ errors_x; value = value_y }
    | Monad.Command command -> Command.eval file_name command env loc
    | Monad.Return value -> { errors = []; value }
    | Monad.Wrapper (wrapper, x) -> Wrapper.eval wrapper (eval file_name x) env loc
