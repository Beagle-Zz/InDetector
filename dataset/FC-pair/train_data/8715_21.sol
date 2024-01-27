contract c8715{
	/**
    * Transfer ERC20 tokens from contract
    *
    * Tranfer _amount of ERC20 from contract _tokenAddress to Owner addres.
    *
    * @param _amount amount of ERC20 tokens to be transferred 
	* @param _tokenAddress address of ERC20 token contract
    */
	function transferAnyERC20Token(address _tokenAddress, uint256 _amount)
    onlyOwner external
    returns(bool success) {
        return ERC20Interface(_tokenAddress).transfer(owner, _amount);
    }
}