contract c13875{
    // Get tokens balance of the doge farm
    function getBalance() public view returns(uint256){
        return tokenContract.myTokens();
    }
}