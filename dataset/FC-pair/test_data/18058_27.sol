contract c18058{
    /**
     * @dev Get soft cap amount
     **/
    function getSoftCap() external view returns(uint256) {
        return softCap;
    }
}