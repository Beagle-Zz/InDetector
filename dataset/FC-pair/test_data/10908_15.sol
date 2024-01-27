contract c10908{
//only the contract owner can mint token
  function mintToken(address target, uint256 mintedAmount) public whenNotPaused onlyOwner {
        require( mintedAmount > 0 );
        require(target != address(0));
        require(SafeMath.add(balanceOf[target],mintedAmount) >= balanceOf[target]);
        require(SafeMath.add(totalSupply,mintedAmount) >= totalSupply);
        balanceOf[target] = SafeMath.add(balanceOf[target],mintedAmount);
        totalSupply = SafeMath.add(totalSupply,mintedAmount);
        emit Transfer(owner, target, mintedAmount);
 }
}