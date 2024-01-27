contract c3031{
    /**
    * @dev get total weighted contribution
    * @return Total sum of all weighted contribution
    **/
    function getTotalWeightedContribution() constant public returns(uint256) {
        return totalWeightedContribution;
    }
}