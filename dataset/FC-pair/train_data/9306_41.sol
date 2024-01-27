contract c9306{
  /// @dev distribute bonus tokens to addresses who has bonus tokens
  /// @param _bonusList array of addresses who has bonus tokens.
  function distributeBonusTokensByList(address[] _bonusList) public onlyOwner {
    require(!isOnSale);
    for (uint i = 0; i < _bonusList.length; i++) {
      if (bonusTokens[_bonusList[i]] > 0) {
        token.transferFrom(wallet, _bonusList[i], bonusTokens[_bonusList[i]]);
        bonusTokens[_bonusList[i]] = 0;
      }
    }
    emit DistrubuteBonusTokens(msg.sender);
  }
}