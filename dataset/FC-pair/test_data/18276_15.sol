contract c18276{
    /**
        @dev owner can transfer out any accidentally sent ERC20 tokens
    */
    function transferERC20Token(address tokenAddress, address to, uint256 tokens)
        public
        onlyOwner
        returns (bool)
    {
        return ERC20(tokenAddress).transfer(to, tokens);
    }
}