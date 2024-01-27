contract c2730{
  /// @dev This function allows the contract owner to adjust the markup value
  function setMarkup(uint256 _tokenId, uint256 newMarkup) public onlyCLevel {
    require(newMarkup >= 0);
    cryptons[_tokenId].markup = newMarkup;
    emit MarkupChanged(cryptons[_tokenId].name, newMarkup);
  }
}