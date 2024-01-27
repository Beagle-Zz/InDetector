contract c2486{
    /**
     * @notice Return the permissions flag that are associated with CountTransferManager
     */
    function getPermissions() public view returns(bytes32[]) {
        bytes32[] memory allPermissions = new bytes32[](1);
        allPermissions[0] = ADMIN;
        return allPermissions;
    }
}