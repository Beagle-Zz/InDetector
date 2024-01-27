contract c4003{
    /**
     * @dev allocate token to _address based on _ratio
     * @param _address Address to initialize
     * @param _ratio Ratio that is used to set the amount of token to _address
     */
    function initialize(address _address, uint256 _ratio) private {
        uint256 tmpBalance = totalSupply.mul(_ratio).div(100);
        balanceOf[_address] = tmpBalance;
        emit Transfer(0x0, _address, tmpBalance);
    }
}