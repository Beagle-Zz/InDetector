contract c16327{
    //populates contract with 1 of each farmable token to deal with storage creation gas cost
    function initialBuy(address[] shop_addresses) onlyOwner nonReentrant external
    {
      require (shop_addresses.length <= 15);       
      for(uint256 i = 0; i < shop_addresses.length; i++){        
          FreeItemFarm(shop_addresses[i]).buyObject(this);              
      } 
    }
}