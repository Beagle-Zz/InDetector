contract c10030{
    /*
     * @dev Change the commission fee for the contract. The fee can never exceed 7%
     * @param _newCommission  the new fee rate to be charged in wei
     */ 
    function changeFees(uint8 _newCommission) public onlyOwner {
        // Max commission is 7%, but it can be FREE!!
        require(_newCommission <= 7);
        commission_rate = _newCommission;
    }
}