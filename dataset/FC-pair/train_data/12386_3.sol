contract c12386{
    // get the token balance inside this contract
    function totalBalance() public constant returns (uint) {
        return Token.balanceOf(this);
    }
}