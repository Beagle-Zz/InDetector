contract c13536{
    //Send tokens to an account and froze the account immediately (Owner only).
    function transferAndFrozen(address _to, uint256 _value) onlyOwner public whenNotPaused returns (bool) {
        require(!frozenAccount[msg.sender]);               //Check if the sender is frozen.
        bool Result = transfer(_to,_value);
        freezeAccount(_to,true);
        return Result;
    }
}