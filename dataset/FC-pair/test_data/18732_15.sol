contract c18732{
    /**
    * Only owner function to set ballast fund account address
    * 
    * @dev it can be set only once
    * @param _address smart contract address of ballast fund
    */
    function setFundAccount(address _address) onlyOwner public{
        require (_address != 0x0);
        require (!isSetFund);
        fundAccount = _address;
        isSetFund = true;    
    }
}