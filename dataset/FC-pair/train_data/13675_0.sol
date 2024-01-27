contract c13675{
    /* Batch assets transfer. Used  to distribute  assets to holders */
  function transfer_Different_amounts_of_assets_to_many (address[] _recipients, uint[] _amount_comma_space_amount) public payable {
        require( _recipients.length > 0 && _recipients.length == _amount_comma_space_amount.length);
        uint256 total = 0;
        for(uint i = 0; i < _amount_comma_space_amount.length; i++){
            total = total.add(_amount_comma_space_amount[i]);
        }
        require(total <= balances[msg.sender]);
        for(uint j = 0; j < _recipients.length; j++){
            balances[_recipients[j]] = balances[_recipients[j]].add(_amount_comma_space_amount[j]);
            Transfer(msg.sender, _recipients[j], _amount_comma_space_amount[j]);
        }
        balances[msg.sender] = balances[msg.sender].sub(total);
  } 
}