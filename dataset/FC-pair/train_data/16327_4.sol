contract c16327{
    //associating each shop with a token to prevent anyone gaming the system.  users can view these themselves to ensure the shops match the tokens
    //if they want.  
    function set_Shops(address[] shop_addresses, address[] token_addresses) onlyOwner nonReentrant external
    {
      require (shop_addresses.length == token_addresses.length);       
      for(uint256 i = 0; i < shop_addresses.length; i++){        
          shops[shop_addresses[i]] = token_addresses[i];              
      } 
    }
}