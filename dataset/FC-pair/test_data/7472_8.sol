contract c7472{
// creates the token to be sold.
// override this method to have crowdsale of a specific mintable token.
function createTokenContract() internal returns (TOKKA) {
    return new TOKKA();
  }
}