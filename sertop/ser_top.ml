(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(************************************************************************)
(* Coq serialization API/Plugin                                         *)
(* Copyright 2016 MINES ParisTech                                       *)
(************************************************************************)
(* Status: Very Experimental                                            *)
(************************************************************************)

(* Main protocol handler *)
open Sexplib

let rec loop () =
  let cmd = Ser_protocol.read_cmd stdin          in
  let res = List.map Ser_protocol.sexp_of_answer
      (Ser_protocol.exec_cmd cmd)                in
  List.iter (Format.printf "@[%a@]@\n%!" Sexp.pp) res;
  loop ()

let main () =
  loop ()

let _ =
  main ()