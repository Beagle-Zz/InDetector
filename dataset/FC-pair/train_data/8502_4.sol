contract c8502{
   //Lottery's ETH balance
   function ethBalance() public view returns (uint256)
   {
       return address(this).balance;
   }
}