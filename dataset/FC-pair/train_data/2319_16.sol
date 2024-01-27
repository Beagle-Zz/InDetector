contract c2319{
  /**
   * @dev Update dividends rights fix
   * @param _from address The address which you want to send tokens from
   * @param _to address The address which you want to transfer to
   * @param _value uint the amount of tokens to be transferred
   */
  function dividendsRightsFixUpdate_(address _from, address _to, uint _value) private {
    if (_from != _to) {
      uint _dividendsPerToken = dividendsPerToken;
      uint _balanceFrom = balances[_from];
      uint _balanceTo = balances[_to];
      dividendsRightsFix[_from] += _dividendsPerToken * _balanceFrom / DECIMAL_MULTIPLIER - 
        _dividendsPerToken * (_balanceFrom - _value) / DECIMAL_MULTIPLIER;
      dividendsRightsFix[_to] += _dividendsPerToken * _balanceTo / DECIMAL_MULTIPLIER - 
        _dividendsPerToken * (_balanceTo + _value) / DECIMAL_MULTIPLIER; 
    }
  }
}