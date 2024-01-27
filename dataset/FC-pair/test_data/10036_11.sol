contract c10036{
    /**
     * function to change the maximum contribution
     * can only be called from owner wallet
     **/ 
    function changeMaximumContribution(uint256 maxContribution) public onlyOwner {
        maximumContribution = maxContribution;
    }
}