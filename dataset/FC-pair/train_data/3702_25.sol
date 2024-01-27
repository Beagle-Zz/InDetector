contract c3702{
    /**
    * @dev Remove authorities of the address used in Exchange
    * @param _CEx Remove authorities of the address used in Exchange   
    */
    function delCEx(address _CEx) external onlySuperOwner {   
        CEx[_CEx] = false;
        emit TMTG_DeleteCEx(_CEx);
    }
}