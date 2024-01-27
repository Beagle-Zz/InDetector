contract c3114{
    /**
    * @dev Gets current grant balance for caller
    *
    */ 
    function getGrantBalance() 
                            external 
                            view 
                            returns(uint256) 
    {
       return getGrantBalanceOf(msg.sender);        
    }
}