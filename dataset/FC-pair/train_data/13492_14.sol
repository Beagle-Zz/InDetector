contract c13492{
    // eggs amount to eth for developers: eggs*4/100
    function devFee(uint256 amount) public pure returns(uint256) {
        return SafeMath.div(SafeMath.mul(amount, 4), 100);
    }
}