contract c18009{
    /**
        @dev returns the length of the quick buy path array
        @return quick buy path length
    */
    function getQuickBuyPathLength() public view returns (uint256) {
        return quickBuyPath.length;
    }
}