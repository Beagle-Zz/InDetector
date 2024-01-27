contract c13335{
    //How many tokens are left without payment
    function balanceOfThis() public view returns (uint256){
        return token.balanceOf(this);
    }
}