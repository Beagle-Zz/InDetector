contract c8482{
    // change units address
    function coinsUnit(uint256 amount) public returns (bool success){
        require(msg.sender == tokensWallet);
        coinunits = amount;
        return true;
    }
}