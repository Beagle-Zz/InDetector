contract c8875{
    /**
     * Destruição dos Tokens
     *
     * Remove `_value` tokens do sistema irreversivelmente
     *
     * @param _value O valor a ser queimado
     */
    function burn(uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);   // Verifique se tem o suficiente
        balanceOf[msg.sender] -= _value;            // Subtrair do remetente
        totalSupply -= _value;                      // Atualiza o totalSupply
        Burn(msg.sender, _value);
        return true;
    }
}