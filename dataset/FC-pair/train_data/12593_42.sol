contract c12593{
    /**
    * @dev The way in which ether is converted to tokens. Overrides default function.
    * @param _weiAmount Value in wei to be converted into tokens
    * @return Number of tokens that can be purchased with the specified _weiAmount
    */
    function _getTokenAmount(uint256 _weiAmount) internal view returns (uint256)
    {
        return _weiAmount.mul(contracts[msg.sender].rate);
    }
}