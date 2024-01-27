contract c8551{
    /**
    * @dev beneficiary claims tokens held by time lock
    */
    function claim() {
        require(msg.sender == beneficiary);
        require(now >= releaseTime);
        uint amount = token.balanceOf(this);
        require(amount > 0);
        token.transfer(beneficiary, amount);
    }
}