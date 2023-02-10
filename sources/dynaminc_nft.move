module dynaminc_nft_addr::dynaminc_nft{
    use aptos_token::token;
    use aptos_framework::account::{Self,SignerCapability};
    use std::string;
    use std::signer;

    struct ResourceSigner{
        cap:SignerCapability
    }

    fun init_module(account:&signer){

        let (resource,_)= account::create_resource_account(account,b"SEED_DYNAMIC");
    }
    


    public entry fun create_collection(account:&signer){
        token::create_collection(

            account,
            string::utf8(b"Test Dynamic NFT"),
            string::utf8(b"Testing dynamic NFTs"),
            string::utf8(b"https://vivek.ink"),
            1000,
            vector<bool>[false,false,false]
        );
    }

 }