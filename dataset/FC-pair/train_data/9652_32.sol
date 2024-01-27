contract c9652{
     // Forward ERC20 methods to upgraded contract if this one is deprecated
     function approve(address _spender, uint256 _value) public returns (bool) {
          if (deprecated) {
            return UpgradedStandardToken(upgradedAddress).approveByLegacy(msg.sender, _spender, _value);
        } else {
            return super.approve(_spender, _value);
        } 
    }
}