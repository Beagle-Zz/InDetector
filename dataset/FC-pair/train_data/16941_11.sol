contract c16941{
//// Owner security & maintenance functions
    function resetState() external
        onlyOwner
    {
        numberOfBets = 0;
        betsState = true;
        rolled = false;
        roundID++;
    }
}