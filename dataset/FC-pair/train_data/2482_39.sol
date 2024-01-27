contract c2482{
    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() public view returns(bytes32[]) {
        bytes32[] memory availableTags = new bytes32[](3);
        availableTags[0] = "ETH";
        availableTags[1] = "Checkpoint";
        availableTags[2] = "Dividend";
        return availableTags;
    }
}