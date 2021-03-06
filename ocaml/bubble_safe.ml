open Bigarray

let print_all arr = 
   for i=0 to Array1.dim arr-1 do
      print_int arr.{i};
      print_string "\n"
   done

let () = 
   let n = 40000 in
   let arr = Array1.create int c_layout n in

   for i=0 to n-1 do
      arr.{i} <- n-i
   done;

   print_all arr;

   print_string "---\n";

   for i=0 to n-1 do
      for j=0 to n-2-i do
         let tmp = arr.{j} in
         if arr.{j} > arr.{j+1} then (
           arr.{j}   <- arr.{j+1};
           arr.{j+1} <- tmp
         )
      done;
   done;

   print_all arr;
