contract c18089{
    /**
     * @dev Get soft cap amount
     **/
    function getSoftCap() external view returns(uint256) {
        return softCap;
    }
}