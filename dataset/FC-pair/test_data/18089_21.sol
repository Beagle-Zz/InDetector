contract c18089{
    /**
     * @dev check if address can contribute
     */
    function isContributorInLists(address contributor) external view returns(bool) {
        return whiteList[contributor] || privilegedList[contributor] || token.limitedWallets(contributor);
    }
}