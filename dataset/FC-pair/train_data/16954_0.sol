contract c16954{
    // ERC20 function
    function balanceOf(address account) public constant returns (uint) {
        return balances[account];
    }
}