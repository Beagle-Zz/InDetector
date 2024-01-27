contract c16854{
   ///@notice Provides balance of the account requested 
   ///@param  add Address of the account for which balance is being enquired
    function balanceOf(address add) constant returns (uint balance){
       return balances[add];
    }
}