contract c16842{
    /**
     * @dev Count of parameters in factory
     */
    function numParameters() public view returns (uint256)
    {
        return params.length;
    }
}