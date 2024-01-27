contract c10958{
    // @return user balance
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return token.balanceOf(_owner);
    }
}