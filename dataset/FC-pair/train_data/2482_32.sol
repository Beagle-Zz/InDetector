contract c2482{
    /**
     * @notice Return the permissions flag that are associated with STO
     * @return bytes32 array
     */
    function getPermissions() public view returns(bytes32[]) {
        bytes32[] memory allPermissions = new bytes32[](1);
        allPermissions[0] = DISTRIBUTE;
        return allPermissions;
    }
}