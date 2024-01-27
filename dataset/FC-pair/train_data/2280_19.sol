contract c2280{
    /**
    *@dev Returns the users total balance (sum of tokens in all swaps the user has tokens in)
    *@param _owner user address
    *@return user total balance
    */
    function balanceOf(address _owner) public constant returns (uint balance) {
       return drct.balanceOf(_owner);
     }
}