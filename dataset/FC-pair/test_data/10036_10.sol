contract c10036{
    /**
     * function to change the minimum contribution
     * can only be called from owner wallet
     **/ 
    function changeMinimumContribution(uint256 minContribution) public onlyOwner {
        minimumContribution = minContribution;
    }
}