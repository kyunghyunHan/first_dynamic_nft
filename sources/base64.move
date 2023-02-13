module dynaminc_nft_addr::base64{
 use std::string::{Self,String};
 use std::vector;
 const B64_CHARS:vector<u8> = b"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

 public fun b64_encoded_size(l:u64):u64{
    let ret= l;
    if(l%3!=0){
        ret= ret+(3-(l%3));
    };

    ret= ret/3;
    ret= ret*4;
    ret
 }

public fun b64_decoded_size(str:String):u64{
    let legnth= string::length(&str);
    let bytes= string::bytes(&str);
    let ret= legnth /4 *3;

    let i = legnth-1;

    while (i>0){
        if (*vector::borrow<u8>(bytes,i)==61){
            ret= ret-1;
        }else{
            break
        };
        i =i-1;
    };
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
      let length= string::length(&str);
      let bytes= string::bytes(&str);
      assert!(length >0,0);

      let i:u64= 0;
      let  j:u64= 0;
      let out:vector<u8> = vector::empty<u8>();
      let elen:u64= b64_encoded_size(length);


      let t= 0;
      while (t < elen){
        vector::push_back<u8>(&mut out,0);
        t= t + 1;
      };



      while (i < length){
        let v= (*vector::borrow<u8>(bytes,i)as u64);


        if (i+1 < length){
            v= (((v as u64) <<8) | (*vector::borrow<u8>(bytes,i+1) as u64));
        }else{
            v =v<<8;
        };


        if (i +2 < length){
            v= (((v as u64) << 8) | (*vector::borrow<u8>(bytes,i + 2 )as u64));
        }else{
            v= v << 8;
        };

        *vector::borrow_mut<u8>(&mut out,j)= *vector::borrow<u8>(&B64_CHARS,((v >> 18) & 0x3f));
         *vector::borrow_mut<u8>(&mut out,j+1 )= *vector::borrow<u8>(&B64_CHARS,(((v as u64    )>> 12) & 0x3f));




         if(i +1 < length){
            *vector::borrow_mut<u8>(&mut out , j+2)= *vector::borrow<u8>(&B64_CHARS,(((v >> 6 )& 0x3f) as u64));
         }else{
            *vector::borrow_mut<u8>(&mut out ,j +2)= 61;
         };

         if(i + 2 < length){
            std::debug::print(&(v & 0x3f));
            *vector::borrow_mut<u8>(&mut out , j+3)= *vector::borrow<u8>(&B64_CHARS,((v & 0x3f)));

         }else{
            *vector::borrow_mut<u8>(&mut out, j +3)= 61;
         };
         i = i+3;
         j = j+4;
      };
     string::utf8(out)
     }
}