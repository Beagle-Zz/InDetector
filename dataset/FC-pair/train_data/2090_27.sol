contract c2090{
     // Forward ERC20 methods to upgraded contract if this one is deprecated
     function totalSupply() public view returns (uint256) {
         if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).totalSupplyByLegacy();
        } else {
            return totalSupply_;
        }
    }
}