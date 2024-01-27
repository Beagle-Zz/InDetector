contract c8311{
    /// @notice valid reward and user has enough funds
    modifier validReward(uint256 _reward) {
        require(_reward > 0 && _depositEscrow(_reward));
        _;
    }
}