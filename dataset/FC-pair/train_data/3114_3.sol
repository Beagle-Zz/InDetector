contract c3114{
    /**
    * @dev Gets current grant balance for an account
    *
    * The return value subtracts Jiffys that have previously
    * been released.
    *
    * @param account Account whose grant balance is returned
    *
    */ 
    function getGrantBalanceOf
                            (
                                address account
                            ) 
                            public 
                            view 
                            returns(uint256) 
    {
        require(account != address(0));
        require(vestingGrants[account].isGranted);
        return(vestingGrants[account].grantJiffys.sub(vestingGrants[account].releasedJiffys));
    }
}