contract c7262{
     /**
      * @dev total number of tokens in existence
      */
     function totalSupply() public view returns(uint256 _totalSupply) 
     {
        _totalSupply = totalTokenSupply;
        return _totalSupply;
     }
}