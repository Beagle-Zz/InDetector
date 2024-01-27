contract c16842{
    /**
     * @dev Count of fabrics in list
     */
    function numFabrics() public view returns (uint256)
    { return fabricsAddr.length; }
}