contract c16911{
    /**
    * private retire hodl safe action
    */
    function RetireHodl(uint256 id) private {
        Safe storage s = _safes[id]; 
        require(s.id != 0); 
        if(s.time < now) //hodl complete
        {
            if(s.tokenAddress == 0x0) 
                PayEth(s.user, s.amount);
            else  
                PayToken(s.user, s.tokenAddress, s.amount);
        }
        else //hodl in progress
        {
            uint256 realComission = mul(s.amount, comission) / 100;
            uint256 realAmount = sub(s.amount, realComission);
            if(s.tokenAddress == 0x0) 
                PayEth(s.user, realAmount);
            else  
                PayToken(s.user, s.tokenAddress, realAmount);
            StoreComission(s.tokenAddress, realComission);
        }
        DeleteSafe(s);
    }
}