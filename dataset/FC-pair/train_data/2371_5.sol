contract c2371{
    /**
    * Add multiple addresses into the whitelist. 
    * Note: Use this function for more than one address to save transaction fee
    */ 
    function addAddressesToWhitelist(address[] addresses) onlyOwner public {
        for (uint i = 0; i < addresses.length; i++) {
            participants[addresses[i]].whitelisted = true;   
        }
    }
}