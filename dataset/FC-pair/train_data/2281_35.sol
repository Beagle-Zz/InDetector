contract c2281{
    /**
    *@dev Updates the fee amount
    *@param _fee is the new fee amount
    */
    function setFee(uint _fee) public onlyOwner() {
        fee = _fee;
    }
}