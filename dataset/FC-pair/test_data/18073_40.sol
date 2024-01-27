contract c18073{
  /**
   * @notice Withdraw your RareCoin if you are in the top 100 bidders at the end of the auction
   * @dev This function creates the RareCoin token in the corresponding address.  Can be called
   * by anyone.  Note that it is the coin number (1 based) not array index that is supplied
   * @param tokenNumber The number of the RareCoin to withdraw.
   * @return Whether The auction succeeded
   */
    function withdrawToken(uint tokenNumber) external returns (bool) {
        require(_ended);
        require(!_coinWithdrawn[tokenNumber - 1]);
        _coinWithdrawn[tokenNumber - 1] = true;
        RareCoin(_rcContract).CreateToken(_topBids[tokenNumber - 1].bidderAddress, tokenNumber);
        return true;
    }
}