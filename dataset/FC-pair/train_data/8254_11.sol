contract c8254{
    // Allow the owner to withdraw STAKE tokens
    function withdrawStakeTokens(uint256 _amount) external
    {
        require(msg.sender == owner);
        stakeTokenContract.transfer(owner, _amount);
    }
}