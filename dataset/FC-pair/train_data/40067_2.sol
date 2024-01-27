contract c40067{
     
     
    function balanceOf(address target) constant returns(uint256 balance) {
        return shareholders[target].shares;
    }
}