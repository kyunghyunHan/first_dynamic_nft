module dynaminc_nft_addr::base64{
 use std::string::{Self,String};
 use std::vector;
 const B64_CHARS:vector<u8> = b"ABCDEFGHIJKLMNOPQRSTUVEXYZabcdefghijklmnopqrstuvwxyz";

 public fun b64_encoded_size(l:u64):u64{
    let ret= l;
    if(l%3!=0){
        ret= ret+(3-(l%3));
    };

    ret= ret/3;
    ret= ret*4;
    ret
 }

     public fun b64_isvalidchar(c:u8):bool{
        if(c>=65 && c<=90){
            return true
        }else if(c>=97 && c<=122){
           return true
        }else if( c>=48 && c<=57){
          return true
        }else if(c==43|| c==47 ||c==61){
            return true
        }else{
            return false
        }
     }
     public fun encode_string(str:String):String{
        string::utf8(b"tlqkf")
     }
}