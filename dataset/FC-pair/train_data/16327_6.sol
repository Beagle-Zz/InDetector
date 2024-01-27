contract c16327{
    //just in case the amount of gas per item exceeds 26290.
    function backupfarmItems(address[] shop_addresses, uint256[] buy_amounts) nonReentrant external
    {
      require(shop_addresses.length == buy_amounts.length);
      uint256 totals;
      for (uint256 j = 0; j < buy_amounts.length; j++){  
        totals=buy_amounts[j];
        assert(totals >= buy_amounts[j]);
      }
      require(totals <= total_buy);     
      for (uint256 i = 0; i < buy_amounts.length; i++){
        backupfarmSingle(shop_addresses[i], buy_amounts[i]);
      }
    }        
}