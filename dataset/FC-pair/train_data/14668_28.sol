contract c14668{
  /// @dev Called by the Standard Token upon creation.
  /// @param self Stored token from token contract
  /// @param _name Name of the new token
  /// @param _symbol Symbol of the new token
  /// @param _decimals Decimal places for the token represented
  /// @param _initial_supply The initial token supply
  /// @param _allowMinting True if additional tokens can be created, false otherwise
  function init(TokenStorage storage self,
                address _owner,
                string _name,
                string _symbol,
                uint8 _decimals,
                uint256 _initial_supply,
                bool _allowMinting)
                public
  {
    require(!self.initialized);
    self.initialized = true;
    self.name = _name;
    self.symbol = _symbol;
    self.totalSupply = _initial_supply;
    self.initialSupply = _initial_supply;
    self.decimals = _decimals;
    self.owner = _owner;
    self.stillMinting = _allowMinting;
    self.balances[_owner] = _initial_supply;
  }
}