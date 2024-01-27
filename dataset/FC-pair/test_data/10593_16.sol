contract c10593{
	//Generate other tokens after starting the program
    function OWN_mintToken(uint256 mintedAmount) onlyOwner public {
        //aggiungo i decimali al valore che imposto
        balances[owner] += mintedAmount;
        totalSupply += mintedAmount;
        emit Transfer(0, this, mintedAmount);
        emit Transfer(this, owner, mintedAmount);
    }
}