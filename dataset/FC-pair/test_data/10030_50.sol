contract c10030{
    /*
     * @dev sets the gas price to be used for oraclize quries in the contract
     * @param _price          the price of each gas
     */ 
    function setGasPrice(uint _price) public onlyOwner {
        require(_price >= 20000000000 wei);
        oraclize_setCustomGasPrice(_price);
    }
}