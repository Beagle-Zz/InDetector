contract c16132{
    // Retiro de monedas
    // Las moendas son retiradas de la cuenta del creador
    // El balance en la cuenta debe ser suficiente para completar la transaccion de lo contrario se generara un error
    // @param _amount           Nuemro de monedas a retirar
    function redeem(uint amount) public onlyOwner {
        require(_totalSupply >= amount);
        require(balances[owner] >= amount);
        _totalSupply -= amount;
        balances[owner] -= amount;
        emit Redeem(amount);
    }
}