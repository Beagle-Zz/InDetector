contract c2371{
    /**
    * Remove multiple addresses from the whitelist
    * Note: Use this function for more than one address to save transaction fee
    */ 
    function removeAddressesFromWhitelist(address[] addresses) onlyOwner public {
        for (uint i = 0; i < addresses.length; i++) {
            participants[addresses[i]].whitelisted = false;   
        }
    }
}