contract c2281{
    /**
    *@dev Returns the users total balance (sum of tokens in all swaps the user has tokens in)
    *@param _owner user address
    *@return user total balance
    */
    function balanceOf(TokenStorage storage self,address _owner) public constant returns (uint balance) {
       return self.user_total_balances[_owner]; 
     }
}