contract c12118{
    /**
     * @dev Function to mint tokens
     * @param _to The address that will receive the minted tokens.
     * @param _unitAmount The amount of tokens to mint.
     */
    function mint(address _to, uint256 _unitAmount) onlyOwner canMint public returns (bool) {
        require(_unitAmount > 0);
        totalSupply = totalSupply.add(_unitAmount);
        balanceOf[_to] = balanceOf[_to].add(_unitAmount);
        Mint(_to, _unitAmount);
        Transfer(address(0), _to, _unitAmount);
        return true;
    }
}