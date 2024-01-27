contract c13411{
    // What is the balance of a particular account?
    function balanceOf(address _address) constant returns (uint256) {
        return getBalance(_address);
    }
}