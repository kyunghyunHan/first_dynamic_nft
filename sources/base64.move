module dynaminc_nft_addr::base64{




      use std::string::{Self,String};



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