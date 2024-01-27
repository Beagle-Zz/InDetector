contract c13875{
    // Collect information about doge farm dividends amount
    function getContractDividends() public view returns(uint256) {
      return tokenContract.myDividends(true); // + this.balance;
    }
}