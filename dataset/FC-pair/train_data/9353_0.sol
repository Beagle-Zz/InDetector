contract c9353{
     // Functions with this modifier can only be executed by the owner
     modifier onlyOwner() {
         require (msg.sender == owner);
         _;
     }
}