contract c1486{
    /**
     * @dev Update node status if children sum amount is enough
     * @param _node Node address
     * @param _status Node current status
     */
    function updateStatus(address _node, uint8 _status) private {
        uint refDep = data.referralDeposits(_node);
        for (uint i = thresholds.length - 1; i > _status; i--) {
            uint threshold = thresholds[i] * 100;
            if (refDep >= threshold) {
                data.setStatus(_node, statusThreshold[threshold]);
                break;
            }
        }
    }
}