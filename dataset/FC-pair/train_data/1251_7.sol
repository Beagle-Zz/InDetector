contract c1251{
    /** custom add-on to ERC20: airDrop
     * Airdrop to multiple accounts at once
     *
     * Deliver 1 token to each account in [] beneficiaries
     *
     * @param beneficiaries the addresses of the receivers
     */
     function airDrop(address[] beneficiaries) public returns (bool success) {
         require(balanceOf[msg.sender] >= beneficiaries.length);  // Check balance
         for (uint8 i = 0; i< beneficiaries.length; i++) {
             address beneficiary = beneficiaries[i];
             transfer(beneficiary, 1);
         } return true;
     }
}