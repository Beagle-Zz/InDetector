contract c2358{
    /**
    * @dev return token balance this contract has
    * @return _address token balance this contract has.
    */
    function balanceOfContract(address _tokenAddress,address _address) public view returns (uint) {
        ERC20BasicInterface token = ERC20BasicInterface(_tokenAddress);
        return token.balanceOf(_address);
    }
}