contract c16426{
    // What is the balance of a particular account?
    function balanceOf(address _owner)public constant returns (uint256 balance) {
        return accounts[_owner].balance;
    }
}