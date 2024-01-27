contract c3763{
    // What is the length of a particular GROWCHAIN?
    function balanceOf(address _address) constant returns (uint256) {
        return getBalance(_address);
    }
}