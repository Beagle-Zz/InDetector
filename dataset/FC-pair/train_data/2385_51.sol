contract c2385{
    /**
     * @notice Ownership management
     */
    function transferTokenOwnership(address _newOwner) external onlyOwner {
        require(_newOwner != address(0));
        // I assume the crowdsale contract holds a reference to the token contract.
        LittlePhilCoin(token).transferOwnership(_newOwner);
    }
}