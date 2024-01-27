contract c2280{
    /**
    *@dev Updates the swap fee amount
    *@param _swapFee is the new swap fee amount
    */
    function setSwapFee(uint _swapFee) public onlyOwner() {
        swapFee = _swapFee;
    }   
}