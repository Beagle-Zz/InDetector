contract c16842{
    /**
     * @dev Count of contracts in list
     */
    function numAdmins() public view returns (uint256)
    { return adminsAddr.length; }
}