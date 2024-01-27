contract c2429{
    /**
    *@dev Sets token ratio, swap duration, and multiplier variables for a swap.
    *@param _token_ratio the ratio of the tokens
    *@param _duration the duration of the swap, in days
    *@param _multiplier the multiplier used for the swap
    *@param _swapFee the swap fee
    */
    function setVariables(uint _token_ratio, uint _duration, uint _multiplier, uint _swapFee) public onlyOwner() {
        require(_swapFee < 10000);
        token_ratio = _token_ratio;
        duration = _duration;
        multiplier = _multiplier;
        swapFee = _swapFee;
    }
}