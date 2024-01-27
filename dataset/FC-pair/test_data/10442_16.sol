contract c10442{
    // This function tells the balance of tokens at a particular address
    function balanceOf(address _owner) public view returns (uint256 balance) {
        if (rewardGenerationComplete) {
            return accounts[_owner].balance;
        } else {
            return (accounts[_owner].balance).add(tokensOwed(_owner));
        }
    }
}