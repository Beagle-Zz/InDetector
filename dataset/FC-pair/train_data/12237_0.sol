contract c12237{
     // Functions with this modifier can only be executed by the owner
     modifier onlyOwner() {
         if (msg.sender != owner) {
             throw;
         }
         _;
     }
}