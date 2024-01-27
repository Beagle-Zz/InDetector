contract c11978{
    //Calculates the amount that has already vested but hasn't been released yet.
    function releasableAmount() private view returns (uint256) {
      return vestedAmount().sub(released[msg.sender]);
    }
}