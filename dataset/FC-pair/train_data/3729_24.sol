contract c3729{
    /**
    * @dev Register the address as a cex address
    * @param _CEx  Register the address as a cex address 
    */
    function setCEx(address _CEx) external onlySuperOwner {   
        CEx[_CEx] = true;
        emit TMTG_SetCEx(_CEx);
    }
}