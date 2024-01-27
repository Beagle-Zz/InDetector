contract c2485{
    /**
     * @notice Get the tags related to the module factory
     */
    function getTags() public view returns(bytes32[]) {
         bytes32[] memory availableTags = new bytes32[](2);
        availableTags[0] = "Percentage";
        availableTags[1] = "Transfer Restriction";
        return availableTags;
    }
}