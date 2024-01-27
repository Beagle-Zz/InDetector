contract c14608{
    // untistupids function
    function transferAnyTokens(address _erc20, address _receiver, uint _amount) public onlyOwner {
        BaseERC20(_erc20).transfer(_receiver, _amount);
    }
}