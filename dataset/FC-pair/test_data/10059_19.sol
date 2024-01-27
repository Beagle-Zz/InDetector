contract c10059{
     /**
      * function to transfer out all ethers present in the contract
      * after calling this function all refunds would need to be done manually
      * would use this function as a last resort
      * can only be called by owner wallet
      **/ 
     function transferOutAllEthers() public onlyOwner {
         owner.transfer(address(this).balance);
     }
}