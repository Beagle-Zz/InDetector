contract c8482{
    // change salesaccount address
    function salesAddress(address sales) public returns (bool success){
        require(msg.sender == tokensWallet);
        salesaccount = sales;
        return true;
    }
}