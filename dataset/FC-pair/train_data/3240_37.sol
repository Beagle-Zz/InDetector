contract c3240{
    /**
    * @dev Get the fee to be paid for the transfer of NOKU tokens.
    * @param _value The amount of NOKU tokens to be transferred.
    */
    function transferFee(uint256 _value) public view returns(uint256 usageFee) {
        return _value.mul(transferFeePercentage).div(100);
    }
}