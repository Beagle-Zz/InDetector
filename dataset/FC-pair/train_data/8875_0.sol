contract c8875{
    /**
     * Transferência interna, só pode ser chamada por este contrato
     */
    function _transfer(address _from, address _to, uint _value) internal {
        // Impede a transferência para o endereço 0x0
        require(_to != 0x0);
        // Verifica o saldo do remetente
        require(balanceOf[_from] >= _value);
        // Verifica overflows
        require(balanceOf[_to] + _value > balanceOf[_to]);
        // Guarda para conferência futura
        uint previousBalances = balanceOf[_from] + balanceOf[_to];
        // Subtrai do remetente
        balanceOf[_from] -= _value;
        // Adiciona o mesmo valor ao destinatário
        balanceOf[_to] += _value;
        Transfer(_from, _to, _value);
        // Verificação usada para usar a análise estática do contrato, elas nunca devem falhar
        assert(balanceOf[_from] + balanceOf[_to] == previousBalances);
    }
}