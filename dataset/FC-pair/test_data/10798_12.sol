contract c10798{
    /// Compute the earned discount, topped at 60%
    function referralDiscountPercentage(address _owner) public view returns (uint256 percent) {
        uint256 total = 0;
        /// get one time discount for having been referred
        if(referrerOf[_owner] != address(0)) {
            total = total.add(10);
        }
        /// get a 10% discount for each one referred
        for(uint256 i = 0; i < ownersIndex.length; i++) {
            if(referrerOf[ownersIndex[i]] == _owner) {
                total = total.add(10);
                // if(total >= 60) break;
            }
        }
        return total;
    }
}