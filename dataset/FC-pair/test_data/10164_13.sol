contract c10164{
    // ERC20 functions -------------------
    /* Transfer out any accidentally sent ERC20 tokens */
    function transferAnyERC20Token(address _token_address, uint _amount) public onlyOwner returns (bool success) {
        return ERC20Interface(_token_address).transfer(owner, _amount);
    }
}