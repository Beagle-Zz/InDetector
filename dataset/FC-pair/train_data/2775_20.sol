contract c2775{
    /**
     * Allows for the allowance of a token from its owner to this contract to be queried. 
     * 
     * As part of the ERC20 standard all tokens which fall under this category have an allowance 
     * function which enables owners of tokens to allow (or give permission) to another address 
     * to spend tokens on behalf of the owner. This contract uses this as part of its protocol.
     * Users must first give permission to the contract to transfer tokens on their behalf, however,
     * this does not mean that the tokens will ever be transferrable without the permission of the 
     * owner. This is a security feature which was implemented on this contract. It is not possible
     * for the owner of this contract or anyone else to transfer the tokens which belong to others. 
     * 
     * @param _addr The address of the token's owner.
     * @param _addressOfToken The contract address of the ERC20 token.
     * 
     * @return The ERC20 token allowance from token owner to this contract. 
     * */
    function getTokenAllowance(address _addr, address _addressOfToken) public view returns(uint256) {
        ERCInterface token = ERCInterface(_addressOfToken);
        return token.allowance(_addr, address(this));
    }
}