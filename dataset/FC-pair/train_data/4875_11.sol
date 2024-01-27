contract c4875{
    /**
    * @dev Allow the owner to set the bank address.
    * @param _bank Address of the bank.
    */
    function setBank(address _bank) external onlyOwner {
        bank = _bank;
    }
}