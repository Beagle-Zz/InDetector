contract c16376{
    /*
     * @dev Update contract's controller
     * @param _id Contract id (keccak256 hash of contract name)
     * @param _controller Controller address
     */
    function updateController(bytes32 _id, address _controller) external onlyOwner {
        return IManager(registry[_id].contractAddress).setController(_controller);
    }
}