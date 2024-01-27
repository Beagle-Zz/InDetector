contract c10908{
//only owner can withdraw all contract's ETH  
  function withdraw() public onlyOwner {
      owner.transfer(address(this).balance); 
    }
}