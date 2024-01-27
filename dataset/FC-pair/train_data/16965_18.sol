contract c16965{
    /**
    * @notice Mint tokens for multiple addresses for Airdrops (only external) - Alber Erre
    */
    function MultiplesaleAirdrop(address[] beneficiaries, uint256[] amounts) onlyOwner external {
      for (uint256 r=0; r<beneficiaries.length; r++){
        mintTokens(address(beneficiaries[r]), uint256(amounts[r]));
      }
    }
}