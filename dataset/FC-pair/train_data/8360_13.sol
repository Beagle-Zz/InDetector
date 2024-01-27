contract c8360{
     /**
       * check if given address is frozen.
       */
    function isFrozen(address _addr) constant public returns (bool)  {
          return frozen[_addr];
      }
}