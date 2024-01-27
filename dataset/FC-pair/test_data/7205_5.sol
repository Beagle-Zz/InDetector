contract c7205{
/*  Throws if called by any account other than the owner.                   */
function Ownable() public {owner = msg.sender;} modifier onlyOwner() {require(msg.sender == owner);_;}
}