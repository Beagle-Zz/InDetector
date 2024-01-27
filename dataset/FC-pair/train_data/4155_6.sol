contract c4155{
    // Mint a new amount of tokens.
    function mintToken(address _target, uint256 _mintedAmount) onlyOwner public {
        require(_target != address(0));
        require(_mintedAmount > 0);
        require(!frozenAccount[_target]);
        // require(totalSupply + _mintedAmount > totalSupply);
        // require(balanceOf[_target] + _mintedAmount > balanceOf[_target]);
        balanceOf[_target] = balanceOf[_target].add(_mintedAmount);
        totalSupply = totalSupply.add(_mintedAmount);
        emit Transfer(address(0), this, _mintedAmount);
        emit Transfer(this, _target, _mintedAmount);
    }
}