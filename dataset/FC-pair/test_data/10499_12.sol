contract c10499{
	// Creator/Owner change name and symbol
    function OWN_ChangeToken(string _name, string _symbol, uint8 _decimals) onlyOwner public {
		name = _name;
        symbol = _symbol;
		decimals = _decimals;
    }
}