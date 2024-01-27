contract c13426{
    // returns the number of tokens for an user
    function balanceOf(address _user) public view returns(uint256) {
        return tokenBalance[_user];
    }
}