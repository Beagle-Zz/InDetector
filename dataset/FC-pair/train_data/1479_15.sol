contract c1479{
    /**
     * @dev Recursively distribute deposit fee between parents
     * @param _node Parent address
     * @param _prevPercentage The percentage for previous parent
     * @param _depositsCount Count of depositer deposits
     * @param _amount The amount of deposit
     */
    function distribute(
        address _node,
        uint _prevPercentage,
        uint8 _depositsCount,
        uint _amount
    )
    private
    {
        address node = _node;
        uint prevPercentage = _prevPercentage;
        // distribute deposit fee among users above on the branch & update users' statuses
        while(node != address(0)) {
            uint8 status = data.statuses(node);
            // count fee percentage of current node
            uint nodePercentage = feeDistribution[status][_depositsCount];
            uint percentage = nodePercentage.sub(prevPercentage);
            data.addBalance(node, _amount * percentage * 10000);
            //update refferals sum amount
            data.addReferralDeposit(node, _amount * ethUsdRate / 10**18);
            //update status
            updateStatus(node, status);
            node = data.parentOf(node);
            prevPercentage = nodePercentage;
        }
    }
}